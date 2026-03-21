import 'dart:convert';

import 'package:caffeine_stay/common/db/db.dart';
import 'package:caffeine_stay/common/db/models/caffeine_item.dart';
import 'package:caffeine_stay/common/extensions/drift_extensions.dart';
import 'package:caffeine_stay/common/providers/dio_provider.dart';
import 'package:caffeine_stay/main.dart';
import 'package:drift/drift.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class ApiMixin {
  Future<dynamic> getVersion() async {
    try {
      final ref = globalContainer;
      final dio = ref.read(dioProvider);
      final sheet = dotenv.env['GOOGLE_SHEET_ID'];
      final gid = dotenv.env['VERSION_GID'];
      final res = await dio.get(
        'https://docs.google.com/spreadsheets/d/$sheet/gviz/tq?tqx=out:json&gid=$gid',
      );
      if (res.statusCode == 200) {
        final jsonString = replaceData(res.data);
        final Map<String, dynamic> data = jsonDecode(jsonString);
        final version = data['table']['rows'][0]['c'][0]['v'].toString();
        return version;
      }
    } catch (e) {
      print('버전 정보를 가져오지 못함. $e');
    }
    return null;
  }

  Future<List<CaffeineItemModel>> fetchCaffeineData() async {
    try {
      final ref = globalContainer;
      final dio = ref.read(dioProvider);
      final sheet = dotenv.env['GOOGLE_SHEET_ID'];
      final gid = dotenv.env['MAIN_GID'];
      final res = await dio.get(
        'https://docs.google.com/spreadsheets/d/$sheet/gviz/tq?tqx=out:json&gid=$gid',
      );
      if (res.statusCode == 200) {
        final jsonString = replaceData(res.data);
        final Map<String, dynamic> data = jsonDecode(jsonString);
        final rows = data['table']['rows'] as List;
        final cols = data['table']['cols'] as List;
        return rows.map((row) {
          final cells = row['c'] as List;
          Map<String, dynamic> item = {};

          for (int i = 0; i < cells.length; i++) {
            String key = cols[i]['label'] ?? 'col_$i';

            item[key] = (cells[i] != null) ? cells[i]['v'] : null;
          }

          return CaffeineItemModel.fromGviz(item);
        }).toList();
      }
    } catch (e) {
      print('데이터를 가져오지 못함: $e');
      return [];
    }
    return [];
  }

  Future<void> dataCheck(Ref ref) async {
    final db = ref.read(databaseProvider);
    final check = await (db.caffeineItems.select()..limit(1)).getSingleOrNull();
    if (check == null) {
      final fetchData = await fetchCaffeineData();
      final companionList = fetchData.map((row) {
        return row.toCompanion();
      }).toList();
      await db.refreshPublicData(companionList);
    }
  }

  String replaceData(String body) {
    final startIndex = body.indexOf('(') + 1;
    final endIndex = body.lastIndexOf(')');
    final jsonString = body.substring(startIndex, endIndex);
    return jsonString;
  }
}

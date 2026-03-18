import 'dart:async';

import 'package:caffeine_stay/common/db/db.dart';
import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:caffeine_stay/features/menu/repositories/menu_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuAsyncNotifier extends AsyncNotifier<List<CaffeineItem>> {
  late final MenuRepository _repo;
  @override
  FutureOr<List<CaffeineItem>> build() {
    _repo = ref.read(menuRepositoryProvider);
    return [];
  }

  Future<void> searchItems(String name) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final results = await _repo.searchtMenuItems(name);
      return results ?? [];
    });

    if (state.hasError) {
      final error = CustomNetworkError(
        title: '네트워크 오류',
        message: '데이터를 읽어오지 못했습니다.',
        path: '',
      );
      ref.read(errorProvider.notifier).updateError(error);
    }
  }
}

class FavoriteMenuAsyncNotifier extends AsyncNotifier<List<CaffeineItem>> {
  late final MenuRepository _repo;
  @override
  FutureOr<List<CaffeineItem>> build() async {
    _repo = ref.read(menuRepositoryProvider);
    return await _fetchFavorites();
  }

  Future<List<CaffeineItem>> _fetchFavorites() async {
    try {
      final results = await _repo.getFavorites();
      return results ?? [];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchFavorites());
    if (state.hasError) {
      final error = CustomNetworkError(
        title: '데이터 오류',
        message: '즐겨찾기를 가져오지 못했습니다.',
        path: '',
      );
      ref.read(errorProvider.notifier).updateError(error);
    }
  }
}

final menuAsyncProvider = AsyncNotifierProvider.autoDispose(
  () => MenuAsyncNotifier(),
);

final favoriteMenuAsyncProvider = AsyncNotifierProvider.autoDispose(
  () => FavoriteMenuAsyncNotifier(),
);

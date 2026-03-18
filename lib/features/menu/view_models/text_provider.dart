import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuSearchTextControllerProvider = Provider.autoDispose((ref) {
  final controller = TextEditingController();

  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});

class MenuSearchTextNotifier extends Notifier<String> {
  @override
  build() {
    return '';
  }

  void change(String value) {
    state = value;
  }

  void clear() {
    state = '';
  }
}

final menuSearchTextProvider = NotifierProvider.autoDispose(() {
  return MenuSearchTextNotifier();
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  // true : default , false : dark mode
  ThemeNotifier() : super(ThemeData.light());

  bool _isDark = false;

  toggle() {
    _isDark = !_isDark;
    state = _isDark ? ThemeData.dark() : ThemeData.light();
  }
}

// Providerの定数をグローバルに宣言
// StateNotifierProviderの後に続けて、Notifierクラスの型と、格納する状態の型を明示する
final themetNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
  (ref) => ThemeNotifier(),
);

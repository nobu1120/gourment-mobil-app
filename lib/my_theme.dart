import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<ThemeData>((ref) => ThemeData.dark());
Color txtColor = Color(0xff838383);

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<ThemeData>((ref) => ThemeData.dark());
Color txtGreyColor = Color(0xff838383);
Color bgColor = Color(0xff030B1F);
Color txtWhiteColor = Color(0xffFAFAFA);
Color tagColor = Color(0xff5E9FD5);
Color txtDiaryColor = Color(0xffBFD0F2);

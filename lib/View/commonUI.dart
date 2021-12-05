import 'package:flutter/material.dart';

Widget buildProfileImage(String url, double height) => CircleAvatar(
    backgroundColor: Colors.grey.shade800,
    radius: height,
    backgroundImage: NetworkImage(url.toString()));

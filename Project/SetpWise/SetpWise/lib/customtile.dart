import 'package:flutter/material.dart';

Widget customListTile(
    {required IconData itemIcon, required String itemTitle, trailing = false}) {
  return ListTile(
    leading: Icon(
      itemIcon,
      size: 35,
      color: Colors.white,
    ),
    title: Text(
      itemTitle,
      style: const TextStyle(
          fontSize: 22, fontWeight: FontWeight.w300, color: Colors.white),
    ),
    trailing: trailing
        ? const Icon(
      Icons.arrow_forward_ios,
      color: Colors.white,
    )
        : null,
  );
}
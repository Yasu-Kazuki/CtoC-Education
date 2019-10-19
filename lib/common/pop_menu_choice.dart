import 'package:flutter/material.dart';

class PopMenuChoice {
  const PopMenuChoice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<PopMenuChoice> choices = const <PopMenuChoice>[
  const PopMenuChoice(title: '登録情報', icon: Icons.people),
  const PopMenuChoice(title: '設定', icon: Icons.settings),
  const PopMenuChoice(title: 'ログアウト', icon: Icons.exit_to_app)
];
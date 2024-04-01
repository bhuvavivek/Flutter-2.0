import 'package:flutter/material.dart';

class InstaProfileFollowers extends StatelessWidget {
  final String? count;
  final String? lable;

  const InstaProfileFollowers(
      {super.key, required this.count, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        count!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(lable!),
    ]);
  }
}

import 'package:flutter/material.dart';

class PostTileWidget extends StatelessWidget {
  final PostTileWidgetUiModel uiModel;
  const PostTileWidget({super.key, required this.uiModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(uiModel.title),
        subtitle: Text(uiModel.body),
      ),
    );
  }
}


class PostTileWidgetUiModel{
  final String title;
  final String body;
  const PostTileWidgetUiModel({
    required this.title,
    required this.body
  })
}
import "package:flutter/material.dart";

class InstaHomeStory extends StatefulWidget {
  final String? name;
  final String? url;
  const InstaHomeStory({super.key, required this.name, required this.url});

  @override
  State<InstaHomeStory> createState() => _InstaHomeStory();
}

class _InstaHomeStory extends State<InstaHomeStory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(widget.url!),
              // backgroundColor: Colors.black,
            ),
          ),
          Text(widget.name!),
        ],
      ),
    );
  }
}

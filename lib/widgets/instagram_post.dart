import 'package:flutter/material.dart';

class InstagramPost extends StatefulWidget {
  const InstagramPost(
      {super.key,
      required this.post,
      required this.profile,
      required this.profilename});

  final String? profile;
  final String? profilename;
  final String? post;

  @override
  State<InstagramPost> createState() => _InstagramPost();
}

class _InstagramPost extends State<InstagramPost> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 50,
              child: Row(children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(widget.profile!),
                    radius: 40.0),
                Text(widget.profilename!)
              ]),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.profile!), fit: BoxFit.cover),
              ),
            )),
            SizedBox(
              height: 50,
              child: Row(children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border_rounded)),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.share_sharp))
              ]),
            )
          ],
        ));
  }
}

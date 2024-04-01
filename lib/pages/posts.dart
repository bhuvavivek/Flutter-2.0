import 'package:flutter/material.dart';
import 'package:journey_ii/services/api/fetch_posts.dart';
import 'package:journey_ii/services/mapper/post_network_to_ui_mapper.dart';
import 'package:journey_ii/services/models/Post_model.dart';
import 'package:journey_ii/widgets/post_tile.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<PostResponse> posts = [];

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  getPosts() async {
    final postTemp = await fetchPosts();
    setState(() {
      posts = postTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async => deletePost(1),
      ),
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) =>
                PostTileWidget(uiModel: PostMapper.map(posts[index]))),
      ),
    );
  }
}



/* there is a Two Types of Model 

1)Network Model :  

data comes from the internet and from internet it provice a networkmodel
server --> data --> client --> NetworkModel 


2) Ui Model

take the NetworkModel data and map it to the UiModel Data and render to the data
which helps to avoid unecessory data which comes from the networkmodel 

NetworkModel --> Data --> UiModel --> UI

*/
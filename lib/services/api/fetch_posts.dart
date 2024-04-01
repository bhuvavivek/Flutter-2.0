import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:journey_ii/services/models/Post_model.dart';

// Get Posts
Future<List<PostResponse>> fetchPosts() async {
  var client = http.Client();
  final response =
      await client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  if (response.statusCode == 200) {
    final List<PostResponse> posts = PostResponse.fromJsonList(response.body);
    print(posts[0].toJson());

    return posts;
  } else {
    return [];
  }
}

//Add Posts
void addPosts() async {
  try {
    var client = http.Client();
    final response = await client.post(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        body: json.encode({"title": "foo", "body": "bar", "userId": 1}),
        headers: {'Content-type': "application/json; charset=UTF-8"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print("Success");
    } else {
      print('failed');
    }
  } catch (error) {
    print(error);
  }
}

// update request with put
void putPosts(int id) async {
  try {
    var client = http.Client();
    final response = await client.put(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
        body: json.encode(
            {"id": 101, "title": "joo", "body": "barBrooh", "userId": 10}),
        headers: {'Content-type': "application/json; charset=UTF-8"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print("Success put");
    } else {
      print('failed');
    }
  } catch (error) {
    print(error);
  }
}

// update request with patch
void patchPosts(int id) async {
  try {
    var client = http.Client();
    final response = await client.patch(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
        body: json.encode({"body": "joihub"}),
        headers: {'Content-type': "application/json; charset=UTF-8"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print("Success patch");
    } else {
      print('failed');
    }
  } catch (error) {
    print(error);
  }
}

// delete request with delete
void deletePost(int id) async {
  try {
    var client = http.Client();
    final response = await client.delete(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print("Success delete");
    } else {
      print('failed');
    }
  } catch (error) {
    print(error);
  }
}
// second way threw the postResponse fromjson Function

/*
    Future<List<PostResponse>> fetchPosts() async {
    var client = http.Client();
    final response =
    await client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
    List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((item) => PostResponse.fromJson(json.encode(item))).toList();
    } else {
    throw Exception("Failed to load posts");
    }
    }

*/

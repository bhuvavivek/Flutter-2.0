import 'dart:convert';

class PostResponse {
  final int id;
  final String title;
  final String body;
  final int userId;

  PostResponse(
      {required this.id,
      required this.body,
      required this.title,
      required this.userId});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'userId': userId, 'body': body};
  }

  factory PostResponse.fromMap(Map<String, dynamic> map) {
    return PostResponse(
        id: map['id']?.toInt() ?? 0,
        title: map['title'] ?? "",
        body: map['body'] ?? "",
        userId: map['userId']?.toInt() ?? 0);
  }

  String toJson() => json.encode(toMap());

  factory PostResponse.fromJson(String source) =>
      PostResponse.fromMap(json.decode(source));

  static List<PostResponse> fromJsonList(String source) {
    List<dynamic> jsonList = json.decode(source);
    return jsonList
        .map((item) => PostResponse.fromMap(item as Map<String, dynamic>))
        .toList();
  }
}

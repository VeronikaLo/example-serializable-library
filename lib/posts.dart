import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

import 'package:http/http.dart' as http;

part 'posts.g.dart';

Future<PostsList> getPostsList() async {
  const url = 'https://reddit.com/r/flutterdev/new.json';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return PostsList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

@JsonSerializable()
class PostsList {
  List<Post> children;
  PostsList({required this.children});

  factory PostsList.fromJson(Map<String, dynamic> json) =>
      _$PostsListFromJson(json);
}



@JsonSerializable()
class Post {
  final String title;
  final String thumbnail;
  final int ups;
  final String selftext;

  Post({required this.title, required this.thumbnail, required this.ups, required this.selftext});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
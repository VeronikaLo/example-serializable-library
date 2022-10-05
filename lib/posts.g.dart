// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsList _$PostsListFromJson(Map<String, dynamic> json) => PostsList(
      children: (json['children'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostsListToJson(PostsList instance) => <String, dynamic>{
      'children': instance.children,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
      ups: json['ups'] as int,
      selftext: json['selftext'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'ups': instance.ups,
      'selftext': instance.selftext,
    };

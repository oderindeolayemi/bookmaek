import 'package:flutter/material.dart';
import './post_image.dart';

class Post{
  bool isStarred;
  int stars, comments;
  String id, username, userAvatar, content, hashTags, commentStore;
  List<PostImage> images = [];

  Post(
    {
      @required this.username,
      @required this.content,
      @required this.isStarred,
      this.userAvatar,
      this.hashTags,
      this.images,
      this.commentStore,
      this.comments,
      this.stars,
      this.id
    }
  );
}
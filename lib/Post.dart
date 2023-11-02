import 'package:flutter/material.dart';
import 'User.dart';
import 'Comment.dart';


class Post {
  static List<Post> allPosts = []; // Static list of all posts created

  User? user; // Making user nullable
  List<Comment>? comments; // Making comments nullable
  String postDate = ''; // Initializing to an empty string
  String postText = ''; // Initializing to an empty string
  int likes = 0; // Initializing to 0

  Post() {
    allPosts.add(this);
  }

  Post.withDetails(this.user, this.postDate, this.postText, this.likes) {
    allPosts.add(this);
  }

  void addComment(Comment comment) {
    comments ??= [];
    comments!.add(comment);
  }
}

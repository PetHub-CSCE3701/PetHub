import 'User.dart';
import 'Comment.dart';

class Post {
  final User user;
  final String postDate;
  final String postText;
  final List<Comment> comments;

  // Static list to hold all posts
  static List<Post> allPosts = [];

  Post({
    required this.user,
    required this.postDate,
    required this.postText,
    List<Comment> comments = const [], // Initializing comments with an empty list
  }) : this.comments = List<Comment>.from(comments) {
    // Add new posts to the static list of all posts
    allPosts.add(this);
  }

  Post.defaultConstructor()
      : user = User(name: '', phoneNumber: '', neighborhood: '', city: '', bio: ''),
        postDate = '',
        postText = '',
        comments = [];

  // Method to add comments to the post
  void addComment(Comment comment) {
    comments.add(comment);
  }
}

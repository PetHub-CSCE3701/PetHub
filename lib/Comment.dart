import 'User.dart';
import 'Post.dart';

class Comment {
   User commenter;
   Post post;
   String commentDate;
   String commentText;
   int likes;

   Comment({
      required this.commenter,
      required this.post,
      required this.commentDate,
      required this.commentText,
      required this.likes,
   });

   Comment.defaultConstructor()
       : commenter = User.defaultConstructor(),
          post = Post(),
          commentDate = '',
          commentText = '',
          likes = 0;

// Other methods or logic
}

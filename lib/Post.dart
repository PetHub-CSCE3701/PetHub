
import 'User.dart';
// import 'comment.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Post {
  User user;
  String postText;
  DateTime postDate;

  static List<Post> allPosts = [];


  Post({required this.user, required this.postText, required this.postDate}){

  }
  Post.defaultConstructor()
      : user = User(name: '', phoneNumber: '', neighborhood: '', city: '', bio: ''),
        postDate = DateTime(1),
        postText = '';


  static Future<void> savePosts() async {
    String posts = allPosts.map((post) {
      return '${post.user.name},${post.postText},${post.postDate.toString()}';
    }).join('\n');

    final file = await _localFile;
    await file.writeAsString(posts);
  }

  static Future<List<Post>> loadPosts() async {
    try {
      final file = await _localFile;
      String content = await file.readAsString();

      List<Post> loadedPosts = [];
      List<String> lines = content.split('\n');
      for (String line in lines) {
        List<String> data = line.split(',');
        String username = data[0];
        String text = data[1];
        DateTime date = DateTime.parse(data[2]);

        // Create User instance for the post - You might want to adjust this part based on how your User class is structured
        User postUser = User(name: username, phoneNumber: "", neighborhood: "", city: "", bio: "");

        Post post = Post(user: postUser, postText: text, postDate: date);
        loadedPosts.add(post);
      }

      return loadedPosts;
    } catch (e) {
      // Error reading the file
      return [];
    }
  }

  static Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/posts.txt');
  }

  void createPost(String text, DateTime date) {
    Post newPost = Post(user: user, postText: text, postDate: date);
    allPosts.add(newPost);
    savePosts();
  }
}



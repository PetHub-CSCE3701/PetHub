import 'package:flutter/material.dart';
import 'User.dart';
import 'Post.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  User newUser = User(
    name: "Mostafa",
    phoneNumber: "1234567890",
    neighborhood: "ABC",
    city: "XYZ",
    bio: "this is a test user",
  );

  List<Post> loadedPosts = await Post.loadPosts(); // Load saved posts
  Post.allPosts = loadedPosts;

  runApp(MyApp(myUser: newUser));
}

class MyApp extends StatelessWidget {
  final User myUser;

  MyApp({required this.myUser});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(user: myUser),
        '/createPost': (context) => CreatePostPage(user: myUser),
        '/userInfo': (context) => UserInfoPage(user: myUser),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final User user;

  MyHomePage({required this.user});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = Post.allPosts; // Get all posts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: PostsList(posts: posts, user: widget.user), // Display posts with user info
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User Info',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/createPost').then((_) {
              setState(() {
                posts = Post.allPosts; // Refresh the posts list after creating a new post
              });
            });
          } else if (index == 2) {
            Navigator.pushNamed(context, '/userInfo');
          }
        },
      ),
    );
  }
}

class PostsList extends StatelessWidget {
  final List<Post> posts;
  final User user;

  PostsList({required this.posts, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        String formattedDate = "${posts[index].postDate.day.toString().padLeft(2, '0')}-"
            "${posts[index].postDate.month.toString().padLeft(2, '0')}-"
            "${posts[index].postDate.year}";

        return Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  posts[index].user.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              ListTile(
                title: Text(posts[index].postText),
                subtitle: Text(formattedDate),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CreatePostPage extends StatefulWidget {
  final User user;

  CreatePostPage({required this.user});

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter your post text',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String text = textEditingController.text;
                if (text.isNotEmpty) {
                  setState(() {
                    widget.user.createPost(text, DateTime.now());
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  final User user;

  UserInfoPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(user.neighborhood),
            Text(user.city),
            Text(user.bio),
          ],
        ),
      ),
    );
  }
}

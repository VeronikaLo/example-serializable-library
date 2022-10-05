import 'package:flutter/material.dart';
import 'posts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<PostsList> postsList;

  @override
  void initState() {
    super.initState();
    postsList = getPostsList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<PostsList>(
          future: postsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              
              return ListView.builder(
                  itemCount: snapshot.data?.children.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            '${snapshot.data?.children[index].title}'),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Text('Error happened..');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

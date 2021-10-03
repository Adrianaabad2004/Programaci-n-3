import '../database/db.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/job_page.dart';
import 'pages/login_page.dart';
import 'pages/post_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  DBFirebase db = DBFirebase();

  @override
  Widget build(BuildContext context) {
    db.initializeFirebase();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      initialRoute: '/Login',
      routes: {
        '/Login': (context) => LoginPage(),
        '/Homepage': (context) => HomePage(),
        '/Postpage': (context) => PostPage(),
        '/Jobpage': (context) => JobPage(),
      },
    );
  }
}

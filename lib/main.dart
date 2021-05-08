import 'package:flutter/material.dart';
import 'package:one_study_mobile/screens/ui/home/home.dart';

import 'database/my_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MyDatabase.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final homekey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Study Mobile',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(key: homekey, title: 'One Study'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:one_study/screens/home/home_screen_state.dart';

import 'screens/home/home_screen.dart';
import 'screens/shared/custom_providers/state_provider.dart';

class MyApp extends StatelessWidget {
  final homekey = GlobalKey();
  final state = HomeScreenState();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateProvider<HomeScreenState>(
      state: state,
      child: MaterialApp(
        title: 'One Study Mobile',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomeScreen(key: homekey, title: 'One Study'),
      ),
    );
  }
}

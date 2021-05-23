import 'package:flutter/material.dart';
import 'package:one_study_mobile/screens/home/home_bloc.dart';
import 'package:one_study_mobile/screens/home/home_state.dart';
import 'package:one_study_mobile/screens/home/widgets/speed_dial_floating_button.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final state = StateProvider.of<HomeState>(context).state;

    var homeBloc = new HomeBloc(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder<Widget>(
        valueListenable: state.selectedScreen,
        builder: (BuildContext context, selectedScreen, _) => selectedScreen,
      ),
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: state.isVisibleFloatingButton,
        builder: (BuildContext context, isVisibleFloatingButton, _) {
          return SpeedDialFloatingButton(
            visible: isVisibleFloatingButton,
            isDialOpen: state.isDialOpen,
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: state.currentIndex,
        builder: (BuildContext context, currentIndex, _) {
          return BottomNavigationBar(
            onTap: (index) => homeBloc.changeScreenBottomNavigation(index),
            currentIndex: currentIndex,
            elevation: 12.0,
            items: [
              BottomNavigationBarItem(
                label: "Decks",
                icon: Icon(Icons.post_add_rounded),
              ),
              BottomNavigationBarItem(
                label: "Play",
                icon: Icon(Icons.library_books_sharp),
              ),
              BottomNavigationBarItem(
                label: "Settings",
                icon: Icon(Icons.settings),
              ),
            ],
          );
        },
      ),
    );
  }
}

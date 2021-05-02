import 'package:flutter/material.dart';
import 'package:one_study_mobile/ui/screens/home/widgets/speed_dial_floating_button.dart';
import 'package:one_study_mobile/ui/screens/list_flashcards/list_flashcards.dart';
import 'package:one_study_mobile/ui/screens/play_flashcards.dart';
import 'package:one_study_mobile/ui/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;

  late List<Widget> listScreens;
  late bool isVisibleFloatingButton;
  late ValueNotifier<bool> isDialOpen;

  @override
  void initState() {
    super.initState();
    listScreens = [ListFlashCards(), PlayFlashCards(), SettingsScreen()];
    isVisibleFloatingButton = false;
    isDialOpen = ValueNotifier(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: listScreens[currentIndex],
      floatingActionButton: SpeedDialFloatingButton(
        visible: isVisibleFloatingButton, isDialOpen: isDialOpen
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => changeScreenBottomNavigation(index),
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
      ),
    );
  }

  void changeScreenBottomNavigation(int index) {
    setState(
      () => {currentIndex = index, isVisibleFloatingButton = (index == 0)},
    );

    isDialOpen.value = false;
  }
}

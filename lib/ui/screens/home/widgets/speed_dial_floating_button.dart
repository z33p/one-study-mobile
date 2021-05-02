import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialFloatingButton extends StatelessWidget {
  final bool visible;
  final ValueNotifier<bool> isDialOpen;

  SpeedDialFloatingButton({required this.visible, required this.isDialOpen});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      animatedIconTheme: IconThemeData(size: 22.0),
      activeIcon: Icons.close,
      visible: visible,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      openCloseDial: isDialOpen,
      // onOpen: () => print('OPENING DIAL'),
      // onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
            child: Icon(
              Icons.layers,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).primaryColor,
            label: 'Add Deck',
            onTap: () => print('FIRST CHILD')),
        SpeedDialChild(
          child: Icon(
            Icons.post_add,
            color: Colors.white,
          ),
          label: 'Add Card',
          backgroundColor: Theme.of(context).primaryColor,
          onTap: () => print('SECOND CHILD'),
        ),
      ],
    );
  }
}

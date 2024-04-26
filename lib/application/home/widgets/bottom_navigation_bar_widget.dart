import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final Function(int)? onTap;
  final int currentIndex;

  const BottomNavigationBarWidget(
      {Key? key, required this.items, this.onTap, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.grey.withOpacity(0.5),
      ),
      child: BottomNavigationBar(
        items: items,
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        iconSize: 30.0,
        selectedFontSize: 16.0,
        unselectedFontSize: 16.0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

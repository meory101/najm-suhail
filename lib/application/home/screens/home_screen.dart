import 'dart:io';

import 'package:flutter/material.dart';

import '../../dashboard/screens/dashboard_tab.dart';
import '../../my_account/screens/my_account_tab.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/bottom_navigation_bar_widget.dart';
import '../widgets/navigator_widget.dart';

const List<Widget> tabs = [
  DashboardTab(),
  MyAccountTab(),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Map navigatorKeys = {
    tabs[0]: GlobalKey<NavigatorState>(),
    tabs[1]: GlobalKey<NavigatorState>()
  };
  int currentIndex = 0;
  Widget currentTab = tabs[0];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            var bool =
                await navigatorKeys[currentTab]!.currentState!.maybePop();
            if (bool == false) {
              if (currentIndex == 0) {
                exit(0);
              } else {
                setState(() {
                  currentIndex = 0;
                  currentTab = tabs[0];
                });
              }
            }
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBarWidget(
              leading: GestureDetector(
                child: const Icon(
                  Icons.menu,
                  color: Colors.green,
                ),
                onTap: () async {
                  /*var bool =
                    await navigatorKeys[currentTab]!.currentState!.maybePop();
                if (bool == false) {
                  if (currentIndex == 0) {
                    exit(0);
                  } else {
                    setState(() {
                      currentIndex = 0;
                      currentTab = tabs[0];
                    });
                  }
                }*/
                },
              ),
              title: const Text(
                '',
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.green,
                        ),
                        Text(
                          'عربي',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
              backgroundColor: Colors.grey.withOpacity(0.5),
            ),
            floatingActionButton: Container(
              
              height: 60.0,
              width: 60.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.5,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBarWidget(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dashboard,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.dashboard,
                    color: Colors.black,
                  ),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: 'My account',
                ),
              ],
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                  currentTab = tabs[index];
                });
              },
              currentIndex: currentIndex,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Stack(
                children: List.generate(
                  tabs.length,
                  (index) => buildOffstageNavigator(tabs[index]),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 125.0,
            width: 125.0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25.0),
              ),
              child: Image.asset(
                'assets/images/logo.jpg',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOffstageNavigator(Widget widget) {
    return Offstage(
      offstage: currentTab != widget,
      child: NavigatorWidget(
        navigatorKey: navigatorKeys[widget],
        widget: widget,
      ),
    );
  }
}

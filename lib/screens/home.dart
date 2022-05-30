import 'package:ecogram/screens/feed/feed.dart';
import 'package:ecogram/screens/profile/profile.dart';
import 'package:ecogram/screens/profile/profile_settings.dart';
import 'package:ecogram/screens/challange.dart';
import 'package:ecogram/screens/notifications.dart';
import 'package:ecogram/screens/tasks/tasks.dart';

import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeController extends StatefulWidget {
  final int pageIndex;
  const HomeController({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  final tabController = CupertinoTabController();
  int _selectedIndex = 0;

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
    tabController.index = widget.pageIndex;
  }

  /// --- Methods ---

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  /// --- Widgets ---

  Widget get buildedView {
    switch (_selectedIndex) {
      case 0:
        return FeedController();
      case 1:
        return ChallangeController();
      case 2:
        return TasksController();
      case 3:
        return NotificationsController();
      case 4:
        return ProfileController();
      default:
        return Icon(Icons.plus_one);
    }
  }

  List<BottomNavigationBarItem> get tabItems => [
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag_outlined),
          label: "Queue",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline),
          label: "Buzz",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          label: "Notifications",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Style.colors.primary,
        body: SafeArea(
          bottom: false,
          child: buildedView,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedLabelStyle: Style.minTextw5,
          selectedLabelStyle: Style.minTextw5,
          selectedItemColor: Style.colors.primary,
          unselectedItemColor: Style.colors.grey,
          backgroundColor: Style.colors.white,
          elevation: 20,
          iconSize: 32,
          items: tabItems,
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
        ),
      );
}

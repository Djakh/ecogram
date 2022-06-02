import 'package:ecogram/screens/challange.dart';
import 'package:ecogram/screens/feed/feed.dart';
import 'package:ecogram/screens/notifications.dart';
import 'package:ecogram/screens/profile/profile.dart';
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

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();

    tabController.index = widget.pageIndex;
  }

  /// --- Methods ---

  /// --- Widgets ---

  Widget buildItem(int index) {
    switch (index) {
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
        return SizedBox();
    }
  }

  Widget navigationActiveIcon(IconData icon) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          padding: Style.padding6,
          decoration: BoxDecoration(
              color: Style.colors.primary, borderRadius: Style.border8),
          child: Icon(
            icon,
            size: 28,
          ),
        ),
      );

  List<BottomNavigationBarItem> get tabItems => [
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
        ),
      ];

  CupertinoTabBar get tabBar => CupertinoTabBar(
        border: Border(
            top: BorderSide(
          color: Style.colors.grey.withOpacity(0.3),
          width: 1.0,
        )),
        iconSize: 28.0,
        items: tabItems,
        activeColor: Style.colors.primary,
        inactiveColor: Style.colors.grey7,
        backgroundColor: Style.colors.white,
      );

  Widget get tabScaffold => CupertinoTabScaffold(
        controller: tabController,
        tabBar: tabBar,
        tabBuilder: (context, index) => buildItem(index),
      );

  @override
  Widget build(BuildContext context) =>
      CupertinoPageScaffold(child: tabScaffold);
}

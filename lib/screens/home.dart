import 'package:ecogram/screens/tab_pages.dart/activity.dart';
import 'package:ecogram/screens/tab_pages.dart/challange.dart';
import 'package:ecogram/screens/tab_pages.dart/notifications.dart';
import 'package:ecogram/screens/tab_pages.dart/profile/profile.dart';
import 'package:ecogram/screens/tab_pages.dart/tasks.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeController extends StatefulWidget {
  final int pageIndex;
  const HomeController({Key key, this.pageIndex = 0}) : super(key: key);

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

  Widget headerBox(String text, IconData icon) => Padding(
      padding: Style.padding16.copyWith(
        top: 8.0,
        bottom: 40.0,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(Icons.search, color: Style.colors.white),
        Text(
          text,
          style: Style.body3w5.copyWith(color: Style.colors.white),
        ),
        Icon(icon, color: Style.colors.white),
      ]));

  Widget get containerBox => Container(
        padding: Style.padding20.copyWith(bottom: 0.0),
        decoration: BoxDecoration(
          color: Style.colors.background,
          borderRadius: Style.borderVer36,
        ),
      );

  Widget get header => Container(
        child: Container(
          width: double.infinity,
          color: Style.colors.primary,
          child: Stack(
            children: [
              getheaderBox,
              Positioned(
                  child: containerBox, bottom: 0.0, right: 0.0, left: 0.0),
            ],
          ),
        ),
      );

  Widget get getheaderBox {
    switch (_selectedIndex) {
      case 0:
        return headerBox("Feed", Icons.person_add);
      case 1:
        return headerBox("Challange", Icons.person_add);
      case 2:
        return headerBox("Notification", null);
      case 3:
        return headerBox("Feed", Icons.list);
      case 3:
        return headerBox("Profile", Icons.list);
      default:
        return headerBox("Feed", Icons.list);
    }
  }

  Widget get buildItem {
    switch (_selectedIndex) {
      case 0:
        return ActivityController();
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

  Widget get view => Container(
        color: Style.colors.background,
        child: Column(
          children: [header, buildItem],
        ),
      );

  Widget get floatNavigationBar => Material(
        elevation: 0.5,
        borderRadius: Style.border12,
        child: ClipRRect(
          borderRadius: Style.border12,
          child: Container(
            height: 80,
            child: BottomNavigationBar(
              unselectedLabelStyle: Style.minTextw5,
              selectedLabelStyle: Style.minTextw5,
              selectedItemColor: Style.colors.primary,
              unselectedItemColor: Style.colors.grey,
              backgroundColor: Style.colors.white,
              elevation: 20,
              iconSize: 38,
              items: tabItems,
              currentIndex: _selectedIndex, //New
              onTap: _onItemTapped,
            ),
          ),
        ),
      );
      
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Style.colors.primary,
        body: SafeArea(
          bottom: false,
          child: view,
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

import 'package:ecogram/screens/tab_pages.dart/profile/activity.dart';
import 'package:ecogram/screens/tab_pages.dart/profile/profile_settings.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileController extends StatefulWidget {
  const ProfileController({Key key}) : super(key: key);

  @override
  State<ProfileController> createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// --- Methods ---

  Widget test(String text) => Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  List<Widget> get getView => [
        test("Any"),
        ActivityController(),
      ];

  /// --- Widgets ---

  Widget get circleCamera => CircleAvatar(
        backgroundColor: Style.colors.grey,
        radius: 30,
        child: Icon(
          Icons.camera_alt_rounded,
          color: Style.colors.black,
          size: 30,
        ),
      );

  Widget follows(String text, int amount) => Column(
        children: [
          Text(text, style: Style.body2w5),
          Text(amount.toString(), style: Style.body2w5)
        ],
      );

  Widget get tabBar => Padding(
        padding: Style.paddingHor16,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Style.border25,
            color: Style.colors.faGray,
          ),
          child: TabBar(
              controller: _tabController,
              labelPadding: Style.paddingHor16,
              indicator: BoxDecoration(
                borderRadius: Style.border25,
                color: Style.colors.primary,
              ),
              unselectedLabelColor: Style.colors.black,
              labelStyle: Style.bodyw5,
              tabs: [
                Tab(
                  text: "Stats",
                ),
                Tab(
                  text: "Activity",
                )
              ]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            circleCamera,
            const SizedBox(height: 10),
            Text("Shoxjahon Bositxonov", style: Style.body3w5),
            const SizedBox(height: 20),
            tabBar,
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                follows("Followers", 30),
                follows("Following", 50),
              ],
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: getView),
            ),
          ],
        ),
      ),
    );
  }
}

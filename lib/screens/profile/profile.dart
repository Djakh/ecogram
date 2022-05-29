import 'package:ecogram/screens/profile/activity.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/material.dart';

class ProfileController extends StatefulWidget {
  const ProfileController({Key? key}) : super(key: key);

  @override
  State<ProfileController> createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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

  Widget get tabBar => Padding(
        padding: Style.paddingHor16,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Style.border25,
            color: Style.colors.grey3,
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
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                SizedBox(),
                ActivityController(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

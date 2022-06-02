import 'package:ecogram/cells/button.dart';
import 'package:ecogram/screens/profile/activity.dart';
import 'package:ecogram/screens/profile/stats.dart';
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

  /// --- Life ciycle ---

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);

    super.initState();
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
  Widget get tabBar => TabBar(
          controller: _tabController,
          labelPadding: Style.paddingHor16,
          indicator: BoxDecoration(
            borderRadius: Style.border25,
            color: Style.colors.primary,
          ),
          unselectedLabelColor: Style.colors.black,
          labelStyle: Style.bodyw6,
          tabs: [
            Tab(
              text: "Stats",
            ),
            Tab(
              text: "Activity",
            )
          ]);

  Widget get tabBarBox => Container(
      decoration: BoxDecoration(
        borderRadius: Style.border25,
        color: Style.colors.grey1,
      ),
      child: tabBar);

  Widget get tabView => Expanded(
        child: TabBarView(
            controller: _tabController,
            children: [StatsController(), ActivityController()]),
      );

  Widget get view => Padding(
        padding: Style.padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            circleCamera,
            const SizedBox(height: 10),
            Text("Shoxjahon Bositxonov", style: Style.body3w5),
            const SizedBox(height: 20),
            tabBarBox,
            const SizedBox(height: 32),
            tabView
          ],
        ),
      );

  PreferredSizeWidget get appBar => PreferredSize(
      preferredSize: Size.fromHeight(50.0), // here the desired height
      child: AppBar(
        title: Text(
          "Feed",
          style: Style.body2w6,
        ),
        actions: [
          Button.icon(
            onPressed: () {},
            icon: Icons.settings_outlined,
            iconColor: Style.colors.black,
            color: Style.colors.white,
            minWidth: 0.0,
          ),
        ],
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: view),
    );
  }
}

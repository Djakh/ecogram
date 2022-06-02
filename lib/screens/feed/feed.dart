import 'package:ecogram/cells/button.dart';
import 'package:ecogram/screens/feed/following.dart';
import 'package:ecogram/screens/feed/trending.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/material.dart';

class FeedController extends StatefulWidget {
  const FeedController({Key? key}) : super(key: key);

  @override
  State<FeedController> createState() => _FeedControllerState();
}

class _FeedControllerState extends State<FeedController>
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

  void submit() {}

  /// --- Widgets ---

  Widget get tabBar => TabBar(
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
              text: "Trending",
            ),
            Tab(
              text: "Folllowing",
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
            children: [TrendingController(), FollowingController()]),
      );

  Widget get view => Padding(
        padding: Style.padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [tabBarBox, const SizedBox(height: 32), tabView],
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
            icon: Icons.favorite_outline,
            iconColor: Style.colors.black,
            color: Style.colors.background,
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

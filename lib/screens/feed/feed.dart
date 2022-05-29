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

  List<Widget> get getView => [
        SizedBox(),
        SizedBox(),
      ];

  /// --- Widgets ---

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
            tabBar,
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(controller: _tabController, children: getView),
            ),
          ],
        ),
      ),
    );
  }
}

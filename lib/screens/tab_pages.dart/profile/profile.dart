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
        test("Some"),
        test("Any"),
      ];


  /// --- Widgets ---

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
          children: [
            const SizedBox(height: 4),
            tabBar,
            Expanded(
              child: TabBarView(controller: _tabController, children: getView),
            ),
          ],
        ),
      ),
    );
  }
}

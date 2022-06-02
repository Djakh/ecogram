import 'package:ecogram/cells/card/task_card.dart';
import 'package:ecogram/model/category.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/screens/tasks/task_details.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallangeController extends StatefulWidget {
  const ChallangeController({Key? key}) : super(key: key);

  @override
  State<ChallangeController> createState() => _ChallangeControllerState();
}

class _ChallangeControllerState extends State<ChallangeController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// --- Methods ---

  void openTaskDetailsPage(Task task) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (_) => TaskDetailsController(task: task)),
    );
  }

  /// --- Widgets ---

  Widget listTask(List<Task> listTask) => ListView.separated(
        itemCount: listTask.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(height: 12.0),
        itemBuilder: (_, index) => TaskCard(
          task: listTask[index],
          function: () => openTaskDetailsPage(listTask[index]),
        ),
      );

  List<Widget> get getView => List<Widget>.generate(
        listCategoryTab.length,
        (index) => listTask(listDataTask),
      );

  Widget get tabBar => TabBar(
          controller: _tabController,
          labelPadding: Style.paddingHor16,
          isScrollable: true,
          indicator: BoxDecoration(
            borderRadius: Style.border25,
            color: Style.colors.primary,
          ),
          unselectedLabelColor: Style.colors.black,
          labelStyle: Style.bodyw6,
          tabs: [
            Tab(
              text: "Challanges",
            ),
            Tab(
              text: "Folllowing",
            ),
            Tab(
              text: "Everyone",
            ),
          ]);

  Widget get tabBarBox => Container(
      decoration: BoxDecoration(
        borderRadius: Style.border25,
        color: Style.colors.grey1,
      ),
      child: tabBar);

  Widget get tabView => Expanded(
        child: TabBarView(controller: _tabController, children: [
          SizedBox(),
          SizedBox(),
          SizedBox(),
        ]),
      );

  Widget get view => Padding(
        padding: Style.padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            tabBarBox,
            const SizedBox(height: 32),
            tabView
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: view),
    );
  }
}

import 'package:ecogram/cells/card/task_card.dart';
import 'package:ecogram/model/category.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/screens/tasks/task_details.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasksController extends StatefulWidget {
  const TasksController({Key? key}) : super(key: key);

  @override
  State<TasksController> createState() => _TasksControllerState();
}

class _TasksControllerState extends State<TasksController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 7);
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
          labelStyle: Style.bodyw5,
          tabs: [
            Tab(
              text: "Trending",
            ),
            Tab(
              text: "Folllowing",
            ),
            Tab(
              text: "Folllowing",
            ),
            Tab(
              text: "Folllowing",
            ),
            Tab(
              text: "Folllowing",
            ),
            Tab(
              text: "Folllowing",
            ),
            Tab(
              text: "Folllowing",
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
          listTask(listDataTask),
          listTask(listDataTask),
          listTask(listDataTask),
          listTask(listDataTask),
          listTask(listDataTask),
          listTask(listDataTask),
          listTask(listDataTask),
        ]),
      );

  Widget get view => Padding(
        padding: Style.padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
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
          "Tasks",
          style: Style.body2w6.copyWith(color: Style.colors.white),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: view),
    );
  }
}

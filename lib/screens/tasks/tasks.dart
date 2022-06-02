import 'package:ecogram/cells/button.dart';
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
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// --- Methods ---

  void openTaskDetails(Task task) {
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
          function: () => openTaskDetails(listTask[index]),
        ),
      );

  List<Widget> get getView => List<Widget>.generate(
        listCategoryTab.length,
        (index) => listTask(listDataTask),
      );
  Widget tab(IconData icon, String text) => Tab(
          child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 4.0),
          Text(text),
        ],
      ));

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
            tab(Icons.backpack, "Recent"),
            tab(Icons.star, "Featured"),
            tab(Icons.shopping_cart, "Shopping"),
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
        leading: Button.icon(
          onPressed: () {},
          icon: Icons.search,
          iconColor: Style.colors.black,
          color: Style.colors.background,
        ),
        title: Text(
          "Tasks",
          style: Style.body2w6,
        ),
        actions: [
          Button.icon(
            onPressed: () {},
            icon: Icons.category_outlined,
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

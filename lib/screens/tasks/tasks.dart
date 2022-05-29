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

  Widget test(String text) => Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

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

  Widget get tabBar => Container(
        decoration: BoxDecoration(
          borderRadius: Style.border25,
          color: Style.colors.grey2,
        ),
        child: TabBar(
            controller: _tabController,
            labelPadding: Style.paddingHor16,
            isScrollable: true,
            indicator: BoxDecoration(
              borderRadius: Style.border25,
              color: Style.colors.primary,
            ),
            unselectedLabelColor: Style.colors.black,
            labelStyle: Style.bodyw5,
            tabs: List<Widget>.generate(
              listCategoryTab.length,
              (index) => Tab(
                  child: Row(
                children: [
                  Icon(listCategoryTab[index].icon),
                  const SizedBox(width: 4.0),
                  Text("Category Type"),
                ],
              )),
            )),
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: Style.paddingHor16,
        child: Column(
          children: [
            const SizedBox(height: 4),
            tabBar,
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(controller: _tabController, children: getView),
            ),
          ],
        ),
      ),
    );
  }
}

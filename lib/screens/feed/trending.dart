import 'package:ecogram/cells/card/feed_card.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/screens/tasks/task_details.dart';
import 'package:flutter/cupertino.dart';

class TrendingController extends StatefulWidget {
  const TrendingController({Key? key}) : super(key: key);

  @override
  State<TrendingController> createState() => _TrendingControllerState();
}

class _TrendingControllerState extends State<TrendingController>
    with SingleTickerProviderStateMixin {
  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// --- Methods ---

  void openTaskDetails(Task task) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (_) => TaskDetailsController(task: task)),
    );
  }

  /// --- Widgets ---

  Widget listUserTask(List<Task> listTask) => ListView.separated(
        itemCount: listTask.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(height: 12.0),
        itemBuilder: (_, index) => FeedCard(
          task: listTask[index],
        ),
      );

  Widget get view => ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [listUserTask(listDataTask)],
      );

  @override
  Widget build(BuildContext context) {
    return view;
  }
}

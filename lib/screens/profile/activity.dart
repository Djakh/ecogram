import 'package:ecogram/cells/card/feed_card.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/screens/tasks/task_details.dart';
import 'package:flutter/cupertino.dart';

class ActivityController extends StatefulWidget {
  const ActivityController({Key? key}) : super(key: key);

  @override
  State<ActivityController> createState() => _ActivityControllerState();
}

class _ActivityControllerState extends State<ActivityController>
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

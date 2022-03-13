import 'package:ecogram/bloc/performed_task.dart';
import 'package:ecogram/cells/card/activity_card.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/screens/tab_pages.dart/tasks/task_details.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityController extends StatefulWidget {
  const ActivityController({Key key}) : super(key: key);

  @override
  State<ActivityController> createState() => _ActivityControllerState();
}

class _ActivityControllerState extends State<ActivityController> {
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

  void openTaskDetailsPage(Task task) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (_) => TaskDetailsController(task: task)),
    );
  }

  /// --- Widgets ---

  Widget get headName => Container(
        height: 80,
        width: double.infinity,
        child: Image.asset("assets/images/head_name.png", fit: BoxFit.contain),
      );

  Widget get view => ListView(
      shrinkWrap: true, physics: ClampingScrollPhysics(), children: []);

  @override
  Widget build(BuildContext context) {
    return view;
  }
}

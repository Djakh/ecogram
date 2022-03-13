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

  Widget get listPerformedTask =>
      BlocBuilder<PerformedTaskCubit, PerformedTaskState>(
        builder: (context, state) {
          return state.fetching
              ? Center(
                  child: ActivityController(),
                )
              : state.data != null
                  ? ListView.separated(
                      itemCount: state.data.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                      itemBuilder: (_, index) => ActivityCard(
                        performedTask: state.data[index],
                      ),
                    )
                  : SizedBox();
        },
      );

  Widget get view => Padding(
        padding: Style.paddingHor16,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            const SizedBox(height: 10),
            headName,
            const SizedBox(height: 10),
            listPerformedTask
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return view;
  }
}

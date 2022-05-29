import 'package:ecogram/model/task.dart';
import 'package:ecogram/screens/tasks/task_details.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';

class ChallangeController extends StatefulWidget {
  const ChallangeController({Key? key}) : super(key: key);

  @override
  State<ChallangeController> createState() => _ChallangeControllerState();
}

class _ChallangeControllerState extends State<ChallangeController> {
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

  Widget challangeImage(String image) => ClipRRect(
        borderRadius: Style.border12,
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: Style.border12),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
      );

  Widget headTitle(text) => Text(
        text,
        style: Style.body2w5,
      );
  Widget descriptionTitle(text) => Text(
        text,
        style: Style.bodyw3,
      );
  Widget challangeBox(Task task) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: Style.border12,
            color: Style.colors.blue.withOpacity(0.7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            challangeImage("assets/images/bike.png"),
            Padding(
              padding: Style.padding16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  headTitle(task.headText),
                  const SizedBox(height: 4),
                  descriptionTitle(task.describing),
                ],
              ),
            )
          ],
        ),
      );

  Widget get view => Expanded(
        child: ListView.separated(
          itemCount: listDataChallangeTask.length,
          scrollDirection: Axis.vertical,
          padding: Style.paddingHor16,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
          itemBuilder: (_, index) => challangeBox(
            listDataChallangeTask[index],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return view;
  }
}

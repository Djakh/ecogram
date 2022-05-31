import 'package:ecogram/cells/button.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskDetailsController extends StatefulWidget {
  final Task task;
  const TaskDetailsController({Key? key, required this.task}) : super(key: key);
  @override
  _TaskDetailsControllerState createState() => _TaskDetailsControllerState();
}

class _TaskDetailsControllerState extends State<TaskDetailsController> {
  final phoneController = TextEditingController();

  /// --- Methods ---

  void openTaskPerformPage() {}

  /// --- Widgets ---

  Widget detailsImageBox(String image, double height, double width) =>
      Container(
        height: height,
        width: width,
        child: Image.asset(image, fit: BoxFit.contain),
      );

  Widget detailsTitle(String text) => Text(
        text,
        style: Style.body2w6.copyWith(color: Style.colors.white),
      );

  Widget iconHeader(IconData icon, Function function) => GestureDetector(
        onTap: () {},
        child: Icon(
          icon,
          size: 24.0,
          color: Style.colors.white,
        ),
      );

  Widget get navigationHeader => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconHeader(Icons.arrow_back_rounded, () => Navigator.pop(context)),
          Text(
            "Details",
            style: Style.body2w6.copyWith(color: Style.colors.white),
          ),
          iconHeader(Icons.file_upload_outlined, () {}),
        ],
      );
  Widget get headerBox => Padding(
      padding: Style.padding16.copyWith(
        top: 8.0,
        bottom: 40.0,
      ),
      child: navigationHeader);

  Widget get containerBox => Container(
        padding: Style.padding20.copyWith(bottom: 0.0),
        decoration: BoxDecoration(
          color: Style.colors.background,
          borderRadius: Style.borderVer36,
        ),
      );

  Widget get header => Container(
        child: Container(
          width: double.infinity,
          color: Style.colors.primary,
          child: Stack(
            children: [
              headerBox,
              Positioned(
                  child: containerBox, bottom: 0.0, right: 0.0, left: 0.0),
            ],
          ),
        ),
      );

  Widget get descriptionTitle => Text(
        "It’s not just a 5 cent refund. Recycling is a warm fuzzy feeling inside! There’s no easier way to make big difference (and get some points). So make sure your paper, bottles and other non-trash get to the bin where they belong.",
        style: Style.bodyw3,
      );

  Widget get taskIconText => Padding(
        padding: Style.padding16,
        child: Row(children: [
          detailsImageBox("assets/images/recycle_white.png", 50, 50),
          const SizedBox(width: 12),
          detailsTitle("Recycle"),
        ]),
      );

  Widget get stackImage => Stack(
        children: [
          detailsImageBox(
              "assets/images/bottle_photo.png", 220, double.infinity),
          Positioned.fill(
              child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: taskIconText))
        ],
      );

  Widget get complete => Button.primary(
        onPressed: openTaskPerformPage,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 30,
              color: Style.colors.white,
            ),
            const SizedBox(width: 12),
            detailsTitle("Complete"),
          ],
        ),
      );

  Widget get corps => Padding(
        padding: Style.padding20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            stackImage,
            const SizedBox(height: 8.0),
            descriptionTitle,
            const SizedBox(height: 48),
            complete,
            const SizedBox(height: 10.0),
            detailsImageBox("assets/images/8point.png", 80, double.infinity),
            const SizedBox(height: 21.0),
            Text(
              "Same yearly impact as",
              style: Style.body2w6,
            ),
            const SizedBox(height: 16.0),
            detailsImageBox(
                "assets/images/garbage_photo.png", 220, double.infinity),
          ],
        ),
      );

  Widget get view => Container(
        color: Style.colors.background,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [header, corps],
        ),
      );
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Style.colors.primary,
        body: SafeArea(
          bottom: false,
          child: view,
        ),
      );
}

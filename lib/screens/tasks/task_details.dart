import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecogram/cells/button.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/screens/tasks/complete_task.dart';
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
  /// --- Methods ---

  void openTaskComplete() {
    Navigator.of(context).push(
      CupertinoPageRoute(
          builder: (_) => CompleteTaskController(task: widget.task)),
    );
  }

  /// --- Widgets ---

  Widget get headerBox => Padding(
      padding: Style.padding0.copyWith(
        top: 8.0,
        bottom: 20.0,
      ),
      child: SizedBox());

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

  Widget detailsImageBox(String? image, double height, double width) =>
      ClipRRect(
        borderRadius: Style.border10,
        child: CachedNetworkImage(
          height: height,
          width: width,
          fit: BoxFit.cover,
          imageUrl: image ?? "",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (_, __, ___) => Icon(
            Icons.local_drink_outlined,
            size: 30,
            color: Style.colors.black,
          ),
        ),
      );

  Widget detailsTitle(String text) => Text(
        text,
        style: Style.body2w6.copyWith(color: Style.colors.white),
      );

  Widget get descriptionTitle => Text(
        "It’s not just a 5 cent refund. Recycling is a warm fuzzy feeling inside! There’s no easier way to make big difference (and get some points). So make sure your paper, bottles and other non-trash get to the bin where they belong.",
        style: Style.bodyw3,
      );

  Widget get bonusPoint =>
      Stack(alignment: AlignmentDirectional.center, children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 64,
            padding: EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
                borderRadius: Style.border16,
                color: Style.colors.primary.withOpacity(0.1)),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "BONUS POINTS",
                style: Style.body3w5,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: Style.padding28,
            decoration: BoxDecoration(
                color: Style.colors.primary, shape: BoxShape.circle),
            child: Text(
              "8",
              style: Style.headline6w5.copyWith(color: Style.colors.white),
            ),
          ),
        ),
      ]);

  Widget get taskIconText => Padding(
        padding: Style.padding16,
        child: Row(children: [
          detailsImageBox(widget.task.iconImage, 50, 50),
          const SizedBox(width: 12),
          detailsTitle("Recycle"),
        ]),
      );

  Widget get stackImage => Stack(
        children: [
          detailsImageBox(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKMV5mMZsERVcx88aeq38UJ8dssB1BYO4Ddw&usqp=CAU",
              220,
              double.infinity),
          Positioned.fill(
              child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: taskIconText))
        ],
      );

  Widget get complete => Button.primary(
        onPressed: openTaskComplete,
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
            const SizedBox(height: 16.0),
            bonusPoint,
            const SizedBox(height: 48),
            complete,
            const SizedBox(height: 21.0),
            Text(
              "Same yearly impact as",
              style: Style.body2w6,
            ),
            const SizedBox(height: 16.0),
            detailsImageBox(
                "https://www.greenqueen.com.hk/wp-content/uploads/2021/05/Only-20-Firms-Behind-50-Of-All-Throwaway-Plastic-Waste-Report-Reveals.jpeg",
                220,
                double.infinity),
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

  PreferredSizeWidget get appBar => PreferredSize(
      preferredSize: Size.fromHeight(50.0), // here the desired height
      child: AppBar(
        backgroundColor: Style.colors.primary,
        iconTheme: IconThemeData(color: Style.colors.white),
        title: Text(
          "Tasks",
          style: Style.body2w6.copyWith(color: Style.colors.white),
        ),
      ));
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        backgroundColor: Style.colors.primary,
        body: SafeArea(
          bottom: false,
          child: view,
        ),
      );
}

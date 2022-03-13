import 'dart:io';

import 'package:camera/camera.dart';
import 'package:ecogram/cells/button.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/screens/tab_pages.dart/tasks/take_picture_page.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskPerformController extends StatefulWidget {
  final Task task;
  const TaskPerformController({Key key, this.task}) : super(key: key);
  @override
  _TaskPerformControllerState createState() => _TaskPerformControllerState();
}

class _TaskPerformControllerState extends State<TaskPerformController> {
  final phoneController = TextEditingController();
  XFile xFileResut;

  /// --- Methods ---

  void showCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    xFileResut = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakePicturePage(camera: camera)));
    listxFileResult.add(xFileResut);
    setState(() {});
  }

  /// --- Widgets ---

  Widget detailsImageBox(String image, double height, double width) =>
      Container(
        height: height,
        width: width,
        child: Image.asset(image, fit: BoxFit.contain),
      );

  Widget detailsTitle(String text) => Text(
        text,
        style: Style.body2w5.copyWith(color: Style.colors.white),
      );

  Widget iconHeader(IconData icon, Function function) => GestureDetector(
        onTap: function,
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
          detailsTitle(widget.task.headText),
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

  Widget get upload => Center(
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: Style.border10,
            color: Style.colors.grey3,
          ),
          child: Image.asset(
            "assets/images/upload.png",
            fit: BoxFit.contain,
          ),
        ),
      );

  Widget get takenPhoto => Container(
        height: 260,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: Style.border10,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(
              File(xFileResut.path),
            ),
          ),
          color: Style.colors.grey3,
        ),
      );

  Widget get gesturePhoto => GestureDetector(
      onTap: showCamera, child: xFileResut != null ? takenPhoto : upload);

  Widget get complete => Button.primary(
        onPressed: () {},
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
            gesturePhoto,
            const SizedBox(height: 8.0),
            descriptionTitle,
            const SizedBox(height: 48),
            complete,
            const SizedBox(height: 10.0),
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
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: Style.colors.primary,
        child: SafeArea(
          bottom: false,
          child: view,
        ),
      );
}

List<XFile> listxFileResult = [];

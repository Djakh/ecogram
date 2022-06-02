import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecogram/cells/button.dart';
import 'package:ecogram/cells/text_field.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CompleteTaskController extends StatefulWidget {
  final Task task;
  const CompleteTaskController({Key? key, required this.task})
      : super(key: key);
  @override
  _CompleteTaskControllerState createState() => _CompleteTaskControllerState();
}

class _CompleteTaskControllerState extends State<CompleteTaskController> {
  final _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? photoXFile;
  bool isCompleted = false;

  /// --- Methods ---

  Future<void> dealWithPhoto(
    ImageSource source,
  ) async {
    Navigator.pop(context);
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 20,
    );

    if (pickedFile != null) {
      photoXFile = pickedFile;
    }
    setState(() {});
  }

  void clearPhotoXFile() {
    Navigator.pop(context);
    if (photoXFile != null) photoXFile = null;
    setState(() {});
  }

  void showPhotoSheeSheet() => showCupertinoModalBottomSheet(
        context: context,
        topRadius: Radius.circular(20),
        builder: (_) => Material(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8.0),
              Text("Photo", style: Style.body3w4),
              const SizedBox(height: 12.0),
              photoSheetItem("camera", Icons.camera_alt_outlined,
                  () => dealWithPhoto(ImageSource.camera)),
              photoSheetItem("Gallery", Icons.photo,
                  () => dealWithPhoto(ImageSource.gallery)),
              photoSheetItem(
                  "Clear photo", Icons.delete, () => clearPhotoXFile()),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      );

  void shareMethod() {}

  void greatMethod() {}

  void complete() {
    isCompleted = true;
    setState(() {});
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

  Widget taskIconImage(String? image, double height, double width) => ClipRRect(
        borderRadius: Style.border10,
        child: CachedNetworkImage(
          height: height,
          width: width,
          fit: BoxFit.cover,
          imageUrl: image ?? "http://",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (_, __, ___) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Style.colors.primary.withOpacity(0.2)),
            child: Icon(
              Icons.local_drink_outlined,
              size: 30,
              color: Style.colors.black,
            ),
          ),
        ),
      );

  Widget get earnedPoints =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "12",
          style: Style.headline6w5,
        ),
        const SizedBox(height: 8.0),
        Text(
          "points earned",
          style: Style.bodyw3,
        ),
      ]);

  Widget get share => Button.primary(
        onPressed: shareMethod,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.upload_outlined,
              size: 30,
              color: Style.colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              "Share",
              style: Style.body2w6.copyWith(color: Style.colors.white),
            ),
          ],
        ),
      );

  Widget get great => Button.primary(
        onPressed: greatMethod,
        text: "Great",
      );

  Widget get iconAndEarnedPoints =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        taskIconImage("", 80, 80),
        const SizedBox(width: 24),
        earnedPoints
      ]);

  Widget get taskInfo => Container(
        height: 64,
        padding: EdgeInsets.only(left: 12.0),
        decoration: BoxDecoration(
            borderRadius: Style.border16,
            color: Style.colors.primary.withOpacity(0.1)),
        child: Row(
          children: [
            taskIconImage("", 50, 50),
            const SizedBox(width: 16),
            Text(
              "Recycled",
              style: Style.body3w5,
            ),
          ],
        ),
      );
  Widget photoSheetItem(String title, IconData icon, Function() function) =>
      Padding(
        padding: Style.paddingHor10,
        child: ListTile(
          title: Text(title, style: Style.bodyw4),
          trailing: Icon(icon),
          onTap: function,
        ),
      );

  Widget get photoBox => photoXFile != null
      ? ClipRRect(
          borderRadius: Style.border10,
          child: Container(
              height: 250,
              width: double.infinity,
              child: Image.file(File(photoXFile!.path), fit: BoxFit.cover)),
        )
      : const SizedBox();

  Widget get photoReport => GestureDetector(
        onTap: showPhotoSheeSheet,
        child: Container(
          padding: Style.padding12,
          decoration: BoxDecoration(
              color: Style.colors.grey2, borderRadius: Style.border8),
          child: Center(
              child: Icon(
            Icons.camera_alt,
            size: 30,
          )),
        ),
      );

  Widget get descriptionTextInput => Expanded(
        child: TextInputField.large(
          controller: _descriptionController,
          placeholder: "Write your description herre",
          backgroundColor: Style.colors.background,
          maxLines: 5,
        ),
      );

  Widget get photoAndDescription => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [photoReport, const SizedBox(width: 10), descriptionTextInput]);

  Widget get done => Button.primary(
        onPressed: complete,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              size: 30,
              color: Style.colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              "Done",
              style: Style.body2w6.copyWith(color: Style.colors.white),
            ),
          ],
        ),
      );

  Widget get completedCorps => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Personal progress",
            style: Style.headlinew6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            "Now you can look at baby polar bears in the eye and say you are doing your part",
            style: Style.body2w4,
          ),
          const SizedBox(height: 24.0),
          iconAndEarnedPoints,
          const SizedBox(height: 350.0),
          share,
          const SizedBox(height: 24.0),
          great
        ],
      );

  Widget get corps => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          taskInfo,
          const SizedBox(height: 48),
          photoAndDescription,
          const SizedBox(height: 16.0),
          photoBox,
          const SizedBox(height: 16.0),
          done,
          const SizedBox(height: 16.0),
        ],
      );

  Widget get view => Container(
        color: Style.colors.background,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            header,
            Padding(
              padding: Style.padding16,
              child: isCompleted ? completedCorps : corps,
            )
          ],
        ),
      );

  PreferredSizeWidget get appBar => PreferredSize(
      preferredSize: Size.fromHeight(50.0), // here the desired height
      child: AppBar(
        backgroundColor: Style.colors.primary,
        iconTheme: IconThemeData(color: Style.colors.white),
        title: Text(
          "Complete",
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

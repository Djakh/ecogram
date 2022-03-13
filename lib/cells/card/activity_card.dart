import 'dart:io';

import 'package:ecogram/model/performed_task.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final PerformedTask performedTask;
  const ActivityCard({Key key, this.performedTask}) : super(key: key);

  /// --- Widgets ---

  Widget get cardImage => Container(
        height: 260,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: Style.border10,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(
              File(performedTask.xfile.path),
            ),
          ),
          color: Style.colors.grey3,
        ),
      );

  Widget get likeTitle => Row(
        children: [
          Text("0 likes", style: Style.body2w5),
          Icon(Icons.favorite, color: Style.colors.red)
        ],
      );

  Widget get taskTitle => Text(performedTask.text, style: Style.bodyw3);

  Widget get corps => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          cardImage,
          const SizedBox(height: 10),
          likeTitle,
          const SizedBox(height: 10),
          taskTitle
        ],
      );

  Widget get card => Container(
      padding: Style.padding16,
      decoration: BoxDecoration(
          color: Style.colors.grey.withOpacity(0.3),
          borderRadius: Style.border12),
      child: corps);

  @override
  Widget build(BuildContext context) {
    return card;
  }
}

import 'package:ecogram/model/task.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Task? task;
  final Function()? function;
  const TaskCard({Key? key, this.task, this.function}) : super(key: key);

  /// --- Widgets ---

  Widget get info => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Head text",
              style: Style.body2w5,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Describing",
              style: Style.smallTextw3,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      );

  Widget get cardImage => Container(
        height: 70,
        width: 70,
        child: Image.asset("assets/images/recycle.png"),
      );

  Widget get corps => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cardImage,
          const SizedBox(width: 20),
          info,
          const SizedBox(width: 50),
          const SizedBox(height: 6),
          Icon(
            Icons.chevron_right_sharp,
            size: 30,
            color: Style.colors.orange,
          )
        ],
      );

  Widget get card => GestureDetector(
        onTap: function,
        child: Container(
            height: 108,
            padding: Style.padding16.copyWith(right: 5.0),
            decoration: BoxDecoration(
                color: Style.colors.orange.withOpacity(0.1),
                borderRadius: Style.border12),
            child: corps),
      );

  @override
  Widget build(BuildContext context) {
    return card;
  }
}

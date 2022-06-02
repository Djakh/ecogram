import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function()? function;
  const TaskCard({Key? key, required this.task, this.function})
      : super(key: key);

  /// --- Widgets ---

  Widget get info => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Head text",
              style: Style.body3w5.copyWith(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
            Text(
              "Describing",
              style: Style.bodyw4,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      );

  Widget get cardImage => CachedNetworkImage(
        height: 70,
        width: 70,
        fit: BoxFit.contain,
        imageUrl: task.iconImage ?? "http://",
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (_, __, ___) => Icon(
          Icons.local_drink_outlined,
          size: 30,
          color: Style.colors.black,
        ),
      );

  Color getColor(int? id, double opacity) {
    switch (id ?? 0) {
      case 0:
        return Style.colors.green5.withOpacity(opacity);
      case 1:
        return Style.colors.blue.withOpacity(opacity);
      case 2:
        return Style.colors.red.withOpacity(opacity);
      case 3:
        return Style.colors.indigo9.withOpacity(opacity);
      case 4:
        return Style.colors.orange.withOpacity(opacity);
      default:
        return Style.colors.red.withOpacity(opacity);
    }
  }

  Widget get corps => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cardImage,
          const SizedBox(width: 16.0),
          info,
          Icon(
            Icons.chevron_right_sharp,
            size: 30,
            color: getColor(task.id, 1.0),
          )
        ],
      );

  Widget get card => GestureDetector(
        onTap: function,
        child: Container(
            height: 108,
            padding: Style.padding16.copyWith(right: 5.0),
            decoration: BoxDecoration(
                color: getColor(task.id, 0.1), borderRadius: Style.border16),
            child: corps),
      );

  @override
  Widget build(BuildContext context) {
    return card;
  }
}

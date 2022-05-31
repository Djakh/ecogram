import 'package:ecogram/theme/style.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key}) : super(key: key);

  /// --- Widgets ---

  Widget get likeTitle => Row(
        children: [
          Text("0 likes", style: Style.body2w6),
          Icon(Icons.favorite, color: Style.colors.red)
        ],
      );

  Widget get taskTitle => Text("Some text", style: Style.bodyw3);

  Widget get corps => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          likeTitle,
          const SizedBox(height: 10),
          taskTitle
        ],
      );

  Widget get view => Container(
      padding: Style.padding16,
      decoration: BoxDecoration(
          color: Style.colors.grey.withOpacity(0.3),
          borderRadius: Style.border12),
      child: corps);

  @override
  Widget build(BuildContext context) {
    return view;
  }
}

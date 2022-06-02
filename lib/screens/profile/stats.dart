import 'package:ecogram/api.dart';
import 'package:ecogram/asset_manager.dart';
import 'package:ecogram/cells/card/feed_card.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/screens/tasks/task_details.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsController extends StatefulWidget {
  const StatsController({Key? key}) : super(key: key);

  @override
  State<StatsController> createState() => _StatsControllerState();
}

class _StatsControllerState extends State<StatsController>
    with SingleTickerProviderStateMixin {
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

  /// --- Widgets ---

  Widget followersOrFollowing(int amount, String title) => Column(children: [
        Text(amount.toString(), style: Style.body2w4),
        const SizedBox(height: 8.0),
        Text(title, style: Style.body2w4)
      ]);

  Widget get followersAndFollowing => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          followersOrFollowing(10, "Follers"),
          const SizedBox(width: 60),
          followersOrFollowing(50, "Following"),
        ],
      );

  Widget pointsAndTasksBox(int amount, String title, Color color) => Container(
        height: 79,
        width: 173,
        decoration: BoxDecoration(borderRadius: Style.border12, color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(amount.toString(),
                style: Style.headline3w5.copyWith(color: Style.colors.white)),
            Text(title, style: Style.bodyw4.copyWith(color: Style.colors.white))
          ],
        ),
      );

  Widget get pointsAndTasks => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          pointsAndTasksBox(99, "points", Style.colors.blue),
          pointsAndTasksBox(13, "tasks", Style.colors.primary),
        ],
      );
  Widget impactType(String image, String name, String process, int amount,
          String mass, Color color) =>
      Column(children: [
        Container(height: 40, width: 40, child: Image.asset(image)),
        const SizedBox(height: 20),
        Text(name, style: Style.bodyw6),
        const SizedBox(height: 4),
        Text(process,
            style: Style.smallTextw4.copyWith(color: Style.colors.grey6)),
        const SizedBox(height: 4),
        Text(amount.toString(), style: Style.headlinew6.copyWith(color: color)),
        const SizedBox(height: 4),
        Text(mass,
            style: Style.smallTextw4.copyWith(color: Style.colors.grey6)),
      ]);

  Widget get verticalDivider => VerticalDivider(
        color: Style.colors.grey,
        thickness: 0.3,
        indent: 10,
        endIndent: 10,
      );

  Widget get impact => Container(
        width: double.infinity,
        padding: Style.padding20,
        decoration: BoxDecoration(
            color: Style.colors.grey0p5, borderRadius: Style.border12),
        child: IntrinsicHeight(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            impactType(AssetManager.air, "CO2", "saved", 12, "kilograms",
                Style.colors.indigo9),
            verticalDivider,
            impactType(AssetManager.recycle, "Waste", "diverted", 7,
                "kilograms", Style.colors.primary),
            verticalDivider,
            impactType(AssetManager.water, "Water", "saved", 2, "litres",
                Style.colors.blue)
          ]),
        ),
      );
  Widget get view => ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          followersAndFollowing,
          const SizedBox(height: 24),
          Text("Activity totals", style: Style.body2w6),
          const SizedBox(height: 16),
          pointsAndTasks,
          const SizedBox(height: 20),
          Text("Same yearly impact as", style: Style.body2w6),
          const SizedBox(height: 16),
          impact
        ],
      );

  @override
  Widget build(BuildContext context) {
    return view;
  }
}

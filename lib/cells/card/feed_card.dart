import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecogram/cells/button.dart';
import 'package:ecogram/model/task.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  final Task task;
  const FeedCard({Key? key, required this.task}) : super(key: key);

  /// --- Widgets ---

  Widget image(String? image, IconData icon) => CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: image ?? "http://",
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (_, __, ___) => Icon(
          icon,
          size: 30,
          color: Style.colors.black,
        ),
      );

  Widget circleImage(String imageSource) => Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: Style.border25, color: Style.colors.grey2),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
            child: image(imageSource, Icons.camera)),
      );

  Widget get nameAndTaskPurpose => Expanded(
        child: Column(
          children: [
            Text(
              'Shokhjakhon Bositkhonov',
              style: Style.bodyw5,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              task.name ?? "",
              style: Style.smallTextw3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
  Widget get userInfo =>
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        circleImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlIdlqsqk4RyGcfcOMgYPl_NG1PKDq2FjCTQ&usqp=CAU'),
        nameAndTaskPurpose,
        circleImage('https://cdn-icons-png.flaticon.com/512/1040/1040664.png'),
      ]);

  Widget get taskImage => Container(
      height: 250,
      width: double.infinity,
      child: ClipRRect(
          borderRadius: Style.border16,
          child: image(task.image, Icons.local_drink_outlined)));
  Widget get likeAndComment => Row(children: [
        Button.icon(
          onPressed: () {},
          color: Style.colors.white,
          icon: Icons.favorite,
          iconColor: Style.colors.red,
          minWidth: 0,
        ),
        Button.icon(
          onPressed: () {},
          color: Style.colors.white,
          icon: Icons.comment,
          iconColor: Style.colors.grey,
          minWidth: 0,
        )
      ]);
  Widget get countLikesAndComment => Row(children: [
        Text("8 likes", style: Style.body2w6),
        const Spacer(),
        likeAndComment
      ]);
  Widget get description => Text.rich(
        TextSpan(
          text: "Shokhjakhon Bositkhonov. ",
          style: Style.body2w6.copyWith(color: Style.colors.grey7),
          children: [
            TextSpan(
                text: "It is not just a 5 cent refund", style: Style.bodyw3),
          ],
        ),
      );
  Widget get view => Column(children: [
        userInfo,
        const SizedBox(height: 16),
        taskImage,
        const SizedBox(height: 8),
        countLikesAndComment,
        const SizedBox(height: 8),
        description
      ]);

  @override
  Widget build(BuildContext context) {
    return view;
  }
}

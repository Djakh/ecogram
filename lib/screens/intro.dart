import 'package:ecogram/asset_manager.dart';
import 'package:ecogram/bloc/app.dart';
import 'package:ecogram/cells/button.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroController extends StatefulWidget {
  const IntroController({Key key}) : super(key: key);

  @override
  _IntroControllerState createState() => _IntroControllerState();
}

class _IntroControllerState extends State<IntroController> {
  final controller = PageController();
  int currentPage = 0;
  bool get isLastPage => pages.length - 1 == currentPage;

  /// --- Life Cycles ---

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// --- Methods ---

  void changePage(int page, {bool swipe = false}) {
    currentPage = page;

    if (swipe) {
      controller.animateToPage(
        page,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
    }
    setState(() {});
  }

  void finish() {
    context.read<AppCubit>().setShowIntro();
  }

  /// --- Widgets ---

  List<Widget> get pages => [
        page(
          AssetManager.onboard0,
          "Ecogram",
          "The interactive way to make your daily habits more fun",
        ),
        page(
          AssetManager.onboard1,
          "Bonuses",
          "Complete the tasks, collect points and exchange to bonuses ",
        ),
        page(
          AssetManager.onboard0,
          "Challenge",
          "Challenge your friends and get valuable gifts",
        ),
      ];

  Widget indicator({bool isActive = false}) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 8.0,
        width: isActive ? 25.0 : 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          color: isActive ? Style.colors.primary : Style.colors.grey3,
          borderRadius: BorderRadius.circular(6.0),
        ),
      );

  Widget get indicators => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          pages.length,
          (index) => indicator(isActive: index == currentPage),
        ),
      );

  Widget page(String imagePath, String title, String description) => Column(
        children: [
          Image.asset(
            imagePath,
            height: 380,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 64.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  style:
                      Style.headlinew5.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: 16.0),
              Padding(
                padding: Style.paddingHor40,
                child: Text(
                  description,
                  style: Style.bodyw3,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      );

  Widget get finishButton => Button.primary(
        text: "Start",
        onPressed: finish,
      );

  Widget get nextButton => Button.primary(
        text: "Next →",
        onPressed: () => changePage(currentPage + 1, swipe: true),
        padding: Style.paddingHor20,
      );

  Widget get skipTextButton => Button.text(
        onPressed: () => changePage(pages.length, swipe: true),
        text: "Skip",
        style: Style.bodyw5.copyWith(color: Style.colors.primary),
      );

  Widget get rowSkipNextButtons => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [skipTextButton, nextButton]);

  Widget get animatedSwitcherButtons => AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: isLastPage ? finishButton : rowSkipNextButtons,
      );

  Widget get view => Container(
        color: Style.colors.background,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: controller,
                children: pages,
                onPageChanged: changePage,
              ),
            ),
            indicators,
            const SizedBox(height: 102),
            Padding(
              padding: Style.paddingHor16,
              child: animatedSwitcherButtons,
            ),
            const SizedBox(height: 68),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        child: view,
      );
}

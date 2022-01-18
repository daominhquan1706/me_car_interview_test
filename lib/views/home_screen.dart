import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:me_car_interview_test/utils/constants.dart';
import 'package:me_car_interview_test/views/widgets/app_secondary_button.dart';
import 'package:me_car_interview_test/views/widgets/app_text_h1.dart';
import 'package:me_car_interview_test/views/widgets/app_text_h2.dart';
import 'package:me_car_interview_test/views/widgets/user_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Constant.paddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextH1(AppLocalizations.of(context)!.discover),
                  SizedBox(height: 32),
                  AppTextH2(AppLocalizations.of(context)!.whatNew),
                  SizedBox(height: 24),
                  Image.asset("assets/image_what_new.png"),
                  SizedBox(height: 16),
                  UserWidget(
                    avatarUrl: "assets/user_avatar_1.png",
                    userName: "Ridhwan Nordin",
                    userId: "@ridzjcob",
                  ),
                  SizedBox(height: 48),
                  AppTextH2(AppLocalizations.of(context)!.browseAll),
                  SizedBox(height: 32),
                  CustomScrollView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: MasonryGrid(
                          mainAxisSpacing: 9,
                          crossAxisSpacing: 9,
                          column: 2,
                          staggered: true,
                          children: Constant.listImage
                              .map((e) => Image.asset(e))
                              .toList(),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: Constant.buttonHeight,
                          child: AppSecondaryButton(
                              text: AppLocalizations.of(context)!.seeMore,
                              onPressed: () {}),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(Constant.listBottomIcon[0]),
                  Image.asset(Constant.listBottomIcon[1]),
                  Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.0, 1.0],
                        colors: [
                          Color(0xFFFF00D6),
                          Color(0xFFFF4D00),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(Constant.listBottomIcon[2]),
                  ),
                  Image.asset(Constant.listBottomIcon[3]),
                  Image.asset(Constant.listBottomIcon[4]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

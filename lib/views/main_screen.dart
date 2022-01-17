import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_car_interview_test/utils/constants.dart';
import 'package:me_car_interview_test/views/login_screen.dart';
import 'package:me_car_interview_test/views/register_screen.dart';
import 'package:me_car_interview_test/views/widgets/app_primary_button.dart';
import 'package:me_car_interview_test/views/widgets/app_secondary_button.dart';
import 'package:me_car_interview_test/views/widgets/user_widget.dart';
import 'package:user_repository/user_repository.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  late AuthenticationRepository authenticationRepository;
  late UserRepository userRepository;
  final String hello = "hello";

  static Route route() {
    return MaterialPageRoute<void>(builder: (context) => MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset('assets/img.png'),
          SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildLogo(context),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Constant.paddingLarge),
                    child: Column(
                      children: [
                        UserWidget(
                          avatarUrl: "assets/user_avatar_2.png",
                          userName: "Pawel Czerwinski",
                          userId: "@pawel_czerwinski",
                        ),
                        SizedBox(height: 16),
                        _buildBottom(context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildBottom(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: Constant.buttonHeight,
            child: AppSecondaryButton(
              text: AppLocalizations.of(context)!.login,
              onPressed: () {
                Navigator.of(context).push(
                  LoginScreen.route(),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: Constant.buttonHeight,
            child: AppPrimaryButton(
              text: AppLocalizations.of(context)!.register,
              onPressed: () {
                Navigator.of(context).push(
                  RegisterScreen.route(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 38,
          child: Image.asset(Constant.logoImage),
        ),
        SizedBox(width: 20),
        Text(
          "photo",
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(fontSize: 48),
          ),
        )
      ],
    );
  }
}

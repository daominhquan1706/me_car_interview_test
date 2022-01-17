import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextH1 extends StatelessWidget {
  final String text;
  const AppTextH1(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // style: TextStyle(fontSize: 36,),
      style: GoogleFonts.comfortaa(textStyle: TextStyle(fontSize: 36)),
    );
  }
}

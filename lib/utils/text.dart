import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modifiedText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const modifiedText({super.key, required this.text, required this.size, required this.color});

  @override

  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(color: color,fontSize: size),
    );
  }
}


class boldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const boldText({super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(color: color,fontSize: size,fontWeight: FontWeight.bold),
    );
  }
}
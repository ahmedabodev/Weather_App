import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text,required this.Align,required this.size,required this.weight}) : super(key: key);
  final String text;
  final TextAlign  Align;
  final double size;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        text,
        style:GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: weight,
          fontSize: size,

        ),
        textAlign:Align ,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,

      ),
    );
  }
}
class CustomTextgrey extends StatelessWidget {
  const CustomTextgrey({Key? key, required this.text,required this.Align,required this.size,required this.weight}) : super(key: key);
  final String text;
  final TextAlign  Align;
  final double size;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        text,
        style:GoogleFonts.roboto(
          color: Colors.grey,
          fontWeight: weight,
          fontSize: size,

        ),
        textAlign:Align ,
        overflow: TextOverflow.ellipsis,
maxLines: 3,

      ),
    );
  }
}
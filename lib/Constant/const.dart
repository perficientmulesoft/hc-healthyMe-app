import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primarycolor = Color(0xffDC4242);


//-------------------------------
mixin AppTextStyle {
  static const primaryText =
  TextStyle(fontSize: 18, color: Colors.white, fontFamily: "SourceSansPro");

  static TextStyle style(
      {double fontSize = 18,
        Color color = Colors.white,
        FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.robotoSlab(
          fontSize: fontSize, color: color, fontWeight: fontWeight);
}
//-------------------------------

TextStyle appbarstyle = GoogleFonts.robotoSlab(color: Colors.white,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize:20 );
TextStyle HospitalHeadingstyle = GoogleFonts.robotoSlab(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize:25 );
TextStyle subheadingstyle=GoogleFonts.robotoSlab(color: primarycolor, fontSize: 18.0, fontWeight: FontWeight.bold,fontStyle: FontStyle.normal);

TextStyle SubtitlePatientProfile = GoogleFonts.robotoSlab(
    color: primarycolor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 18.0);

TextStyle SubdetailPatientProfile = GoogleFonts.robotoSlab(
    fontSize: 15.0,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    letterSpacing: 2.0);

TextStyle NameStudentProfile = GoogleFonts.robotoSlab(
  fontSize: 22.0,
  color: Colors.white,
);

TextStyle RollNoStudentProfile = GoogleFonts.robotoSlab(
  fontSize: 15.0,
  color: Colors.white,
);
TextStyle HospitalNamePatientProfile = GoogleFonts.robotoSlab(
    color: primarycolor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 15.0);

TextStyle DoctornamePatientProfile = GoogleFonts.robotoSlab(
    fontSize: 12.0,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    letterSpacing: 2.0);

TextStyle fordatanotfoundtitle1=GoogleFonts.robotoSlab(
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
    color: Colors.black);


TextStyle fordatanotfoundtitle2=GoogleFonts.robotoSlab(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    color: Colors.black);


TextStyle fordatanotfoundtitle3=GoogleFonts.robotoSlab(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    color: Colors.black);
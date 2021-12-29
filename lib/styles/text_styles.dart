import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greating_card/styles/color.dart';

final title = GoogleFonts.poppins(
    color: fontColor, fontSize: 23, fontWeight: FontWeight.w600);

final headline_1 = GoogleFonts.varelaRound(fontSize: 23, color: Colors.white);
final headline_2 = GoogleFonts.bebasNeue(fontSize: 78, color: Colors.white);

final body =
    GoogleFonts.poppins(fontSize: 14, color: Colors.white.withOpacity(0.85));

final button = GoogleFonts.roboto(
    fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold);

final caption_1 = GoogleFonts.poppins(fontSize: 12, color: Colors.white);

final caption_2 = GoogleFonts.shadowsIntoLight(
    fontSize: 12, color: Colors.white.withOpacity(0.85));

final overline = GoogleFonts.roboto(
  color: fontColor.withOpacity(0.60),
);

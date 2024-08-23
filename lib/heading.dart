import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Text heading({required String heading}) {
    return Text(
              "$heading",
              style: GoogleFonts.openSans(fontSize: 25),
            );
  }
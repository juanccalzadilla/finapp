

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.blue,
    // textTheme:  GoogleFonts.poppinsTextTheme(),
    // textTheme:  GoogleFonts.nunitoSansTextTheme(),
    textTheme:  GoogleFonts.latoTextTheme()
  );
}
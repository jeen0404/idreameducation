import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget get iDreamEducationTextLogo => Column(
      children: [
        Center(
            child: Text(
          "iDream",
          style: GoogleFonts.pacifico(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.blue),
        )),
        Center(
            child: Text(
          "EDUCATION",
          style: GoogleFonts.pacifico(fontSize: 15),
        ))
      ],
    );

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget get googleButton => SizedBox(
      width: 120,
      height: 50,
      child: Material(
        color: Colors.red,
        elevation: 8,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {},
          highlightColor: Colors.blueAccent,
          child: Center(
            child: Text(
              "G",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );

Widget get iCloudButton => SizedBox(
      width: 120,
      height: 50,
      child: Material(
        color: Colors.black,
        elevation: 8,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {},
          highlightColor: Colors.blueAccent,
          child: Center(
            child: Text(
              "iCloud",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );

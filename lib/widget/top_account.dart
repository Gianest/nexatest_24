import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopAccount extends StatelessWidget {
  final String user;

  const TopAccount({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16)),
              ),
              Text(
                user,
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          )),
          Image.asset('assets/frame.png'),
        ],
      ),
    );
  }
}

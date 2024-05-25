import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexatest/data/model/dokter.dart';

import '../data/static/doctorimg_assets.dart';

class JadwalCard extends StatefulWidget {
  final Dokter dokter;
  final bool home;

  const JadwalCard({super.key, required this.dokter, required this.home});

  @override
  State<JadwalCard> createState() => _JadwalCardState();
}

class _JadwalCardState extends State<JadwalCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  clipBehavior: Clip.antiAlias, // Ensures smooth edges
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // Set corner radius
                    image: DecorationImage(
                      image:
                          AssetImage(imageDoctor[widget.dokter.id.toInt() - 1]),
                      // Replace with your asset path
                      fit: BoxFit.cover, // Adjust fit as needed
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.dokter.nama,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                      Text(
                        widget.dokter.jenis,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ),
                Visibility(
                    visible: widget.home,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/ui/location.svg',
                          width: 16,
                          height: 16,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.dokter.jarak.toString(),
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14)),
                        )
                      ],
                    ))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: const SizedBox(
                height: 1.0,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black12, // Set background color
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/ui/calendar-2.svg',
                        width: 16,
                        height: 16,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.dokter.tanggal,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/ui/clock.svg',
                        width: 16,
                        height: 16,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.dokter.jadwal,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

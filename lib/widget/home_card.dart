import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexatest/data/model/dokter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexatest/data/static/doctorimg_assets.dart';

class HomeCard extends StatefulWidget {
  final Dokter dokter;
  final bool home;

  const HomeCard({super.key, required this.dokter, required this.home});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.blue,
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
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      Text(widget.dokter.jenis,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: const SizedBox(
                height: 1.0,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white24, // Set background color
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
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.dokter.tanggal,
                        style: GoogleFonts.poppins(
                            textStyle:
                                const TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/ui/clock.svg',
                        width: 16,
                        height: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.dokter.jadwal,
                        style: GoogleFonts.poppins(
                            textStyle:
                                const TextStyle(color: Colors.white, fontSize: 12)),
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

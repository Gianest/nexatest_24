import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexatest/widget/jadwal_card.dart';
import 'package:nexatest/widget/loading_widget.dart';
import 'package:provider/provider.dart';

import '../data/provider/data_provider.dart';
import '../widget/home_card.dart';
import '../widget/top_account.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final dokter = Provider.of<DataProvider>(context, listen: false);
    dokter.getNearbyDoctor();
  }

  @override
  Widget build(BuildContext context) {
    final dokter = Provider.of<DataProvider>(context);
    return dokter.isloading
        ? const LoadingWidget()
        : SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TopAccount(user: dokter.user),
                  HomeCard(dokter: dokter.dokter, home: true),
                  SearchWidget(),
                  CenterButton(),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dokter Terdekat',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  JadwalCard(dokter: dokter.dokter, home: true)
                ],
              ),
            ),
          );
  }

  SearchWidget() {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0), // Adjust corner radius
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/ui/search-normal.svg',
              width: 22,
              height: 22,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Cari Dokter Spesialis',
                  hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ));
  }

  CenterButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularButtonWidget('assets/ui/profile-add.svg', 'Dokter'),
          CircularButtonWidget('assets/ui/link.svg', 'Obat & Resep'),
          CircularButtonWidget("assets/ui/hospital.svg", 'Rumah Sakit'),
        ],
      ),
    );
  }

  CircularButtonWidget(String bticon, String string) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), // Set a circular border
            padding: const EdgeInsets.all(20.0), // Adjust padding as needed
            backgroundColor: Colors.white70, // Set button color
          ),
          child: SvgPicture.asset(
            bticon,
            width: 24,
            height: 24,
            color: Colors.blue,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          string,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 15, color: Colors.black54),
          ),
        )
      ],
    );
  }
}

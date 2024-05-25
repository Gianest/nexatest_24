import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexatest/widget/top_account.dart';
import 'package:provider/provider.dart';

import '../data/provider/data_provider.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final dokter = Provider.of<DataProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopAccount(
              user: dokter.user,
            ),
            ElevatedButton(
              onPressed: () {
                dokter.signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(195, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Keluar',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:nexatest/navigation/account.dart';
import 'package:nexatest/navigation/home_page.dart';
import 'package:nexatest/navigation/jadwal_page.dart';
import 'package:nexatest/navigation/jadwal_tab/jadwal_list_page.dart';

class Static {
  String name;
  Widget widget;

  Static({
    required this.name,
    required this.widget,
  });
}

var navWidget = [
  Static(
      name: 'Home',
      widget: const SafeArea(
        child: HomePage(),
      )),
  Static(
      name: 'Jadwal',
      widget: const SafeArea(
        child: JadwalPage(),
      )),
  Static(
      name: 'Pesan',
      widget: const Center(
        child: Text('Tidak ada Pesan'),
      )),
  Static(
    name: 'Akun',
    widget: const Account(),
  ),
];

var jadwaliWidget = [
  Static(
      name: 'Jadwal Dibatalkan',
      widget: const Center(
        child: Text('Tidak ada pembatalan'),
      )),
  Static(name: 'Jadwal Dokter', widget: const JadwalListPage()),
  Static(name: 'Semua Jadwal', widget: const JadwalListPage()),
];

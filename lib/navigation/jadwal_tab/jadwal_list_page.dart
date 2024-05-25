import 'package:flutter/material.dart';
import 'package:nexatest/data/provider/data_provider.dart';
import 'package:nexatest/widget/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../widget/jadwal_card.dart';

class JadwalListPage extends StatefulWidget {
  const JadwalListPage({super.key});

  @override
  State<JadwalListPage> createState() => _JadwalListPageState();
}

class _JadwalListPageState extends State<JadwalListPage> {
  @override
  void initState() {
    final dokter = Provider.of<DataProvider>(context, listen: false);
    dokter.getListDoctor();
  }

  @override
  Widget build(BuildContext context) {
    final dokter = Provider.of<DataProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
      child: dokter.isloading
          ? const LoadingWidget()
          : ListView.builder(
              itemCount: dokter.list_dokter.length,
              itemBuilder: (context, index) {
                return JadwalCard(
                  dokter: dokter.list_dokter[index],
                  home: false,
                );
              },
            ),
    );
  }
}

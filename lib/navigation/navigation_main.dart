import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexatest/data/static/static.dart';

class NavigationMain extends StatefulWidget {
  const NavigationMain({super.key});

  @override
  _NavigationMainState createState() => _NavigationMainState();
}

class _NavigationMainState extends State<NavigationMain> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navWidget[_selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          _BotomnvItem('Home', 'assets/ui/home-2.svg', 0),
          _BotomnvItem('Jadwal', 'assets/ui/calendar-2.svg', 1),
          _BotomnvItem('Pesan', 'assets/ui/message.svg', 2),
          _BotomnvItem('Akun', 'assets/ui/profile.svg', 3),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }

  _BotomnvItem(String string, String icon, int index) {
    return BottomNavigationBarItem(
        icon: Container(
          padding:
              _selectedIndex == index ? const EdgeInsets.all(12) : const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color:
                _selectedIndex == index ? Colors.grey[300] : Colors.transparent,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
                color: _selectedIndex == index ? Colors.blue : Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              if (_selectedIndex == index)
                Text(
                  string,
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(fontSize: 14, color: Colors.blue)),
                ),
            ],
          ),
        ),
        label: '');
  }
}

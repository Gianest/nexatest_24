
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexatest/navigation/navigation_main.dart';
import 'package:provider/provider.dart';

import '../data/provider/data_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwdController = TextEditingController();

  @override
  void initState() {
    final user = Provider.of<DataProvider>(context, listen: false);
    // _user.getToken();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DataProvider>(context);
    user.getToken();
    return user.islogin
        ? const NavigationMain()
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png'),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * (1 / 100),
                        bottom: MediaQuery.of(context).size.height * (5 / 100)),
                    child: Text(
                      'Kesehatan Adalah Asset Berharga',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 15)),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius:
                            BorderRadius.circular(10.0), // Adjust corner radius
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/ui/profile.svg',
                            width: 22,
                            height: 22,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _userController,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(height: 20),
                  Container(
                      padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius:
                            BorderRadius.circular(10.0), // Adjust corner radius
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/ui/key.svg',
                            width: 22,
                            height: 22,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _passwdController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * (10 / 100)),
                  ElevatedButton(
                    onPressed: () {
                      if (_userController.text == "" ||
                          _passwdController == "") {
                        print('User atau Password belum diisi');
                      } else {
                        Map<String, String> post = {
                          "username": _userController.text,
                          "password": _passwdController.text,
                        };
                        user.signinn = post;
                        user.user = _userController.text;
                        user.signIn();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(195, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.poppins(
                          textStyle:
                              const TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

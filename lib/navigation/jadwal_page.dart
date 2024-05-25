import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../data/static/static.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  int indexpg = 1;
  late Widget _default;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _default = jadwaliWidget[1].widget;
    SchedulerBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.only(top: 12),
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: jadwaliWidget.length,
            itemBuilder: (context, index) {
              return _buildButton(
                  jadwaliWidget[index].name,
                  jadwaliWidget[index].widget,
                  index); // Build a Text widget for each item
            },
          ),
        ),
        Expanded(child: _default),
        // _scrollToBottom()
      ],
    );
  }

  _scrollToBottom() {
    _scrollController.animateTo(
      74,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  _buildButton(String text, Widget page, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.only(bottom: 5),
      child: TextButton(
        onPressed: () {
          setState(() {
            _default = page;
            indexpg = index;
          });
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          padding:
              WidgetStateProperty.all(const EdgeInsets.only(left: 32, right: 32)),
          backgroundColor: WidgetStateProperty.all(
            index == indexpg ? Colors.blue[50] : Colors.grey[200],
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: index == indexpg ? Colors.blue : Colors.grey,
              fontSize: 16),
        ),
      ),
    );
  }
}

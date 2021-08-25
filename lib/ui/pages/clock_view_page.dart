import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clock_of_clocks/ui/paint/number_view.dart';
import 'package:clock_of_clocks/common/extension.dart';

class ClockViewPage extends StatefulWidget {
  const ClockViewPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ClockViewPage> createState() => _ClockViewPageState();
}

class _ClockViewPageState extends State<ClockViewPage> {
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    Timer.periodic(const Duration(seconds: 1), (va) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (var value in dateTime.hour.splitter())
                _buildNumber(value),
              _buildDivider(),
              for (var value in dateTime.minute.splitter())
                _buildNumber(value),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (var value in dateTime.second.splitter())
                _buildNumber(value),
              // _buildNumber(dateTime.second)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumber(int number) {
    return NumberView(
      clocks: number.getValue(),
    );
  }

  _buildDivider() {
    return NumberView(
      clocks: (-1).getValue(),
    );
  }
}

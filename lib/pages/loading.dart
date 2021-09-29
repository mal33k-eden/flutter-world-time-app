import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading....';
  void setUpWorldTime() async {
    WorldTime inst = WorldTime(
        location: 'London', flag: 'flag/london', url: 'Europe/London');
    await inst.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': inst.time,
      'location': inst.location,
      'flag': inst.flag
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('loading'),
      ),
    );
  }
}
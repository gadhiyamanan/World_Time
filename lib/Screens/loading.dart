import 'package:flutter/material.dart';
import 'package:World_map/Screens/Services/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading ...';
  void setuptime() async {
    WorldTime worldTime = WorldTime(
        location: 'Asia/Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await worldTime.getTime();
    // print(worldTime.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isdaytime': worldTime.isdaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setuptime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: (SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          )),
        ));
  }
}

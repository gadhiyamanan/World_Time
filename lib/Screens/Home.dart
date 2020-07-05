import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isdaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgcolor = data['isdaytime'] ? Colors.blue[50] : Colors.black;
    Color font = data['isdaytime'] ? Colors.black : Colors.white;
    return Scaffold(
        backgroundColor: bgcolor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic Result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': Result['time'],
                          'location': Result['location'],
                          'isdaytime': Result['isdaytime'],
                          'flag': Result['flag']
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: font,
                    ),
                    label: Text(
                      "Click Here For Choose Location",
                      style: TextStyle(color: font),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28, letterSpacing: 2, color: font),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66, color: font),
                )
              ],
            ),
          ),
        )));
  }
}

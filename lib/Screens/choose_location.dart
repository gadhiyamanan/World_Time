import 'package:World_map/Screens/Services/word_time.dart';
import 'package:flutter/material.dart';

class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Africa/Johannesburg',
        url: 'Africa/Johannesburg',
        flag: 'nairobi.png'),
    WorldTime(
        location: 'Africa/Nairobi', url: 'Africa/Nairobi', flag: 'nairobi.png'),
    /*  WorldTime(
        location: 'America/Chicago',
        url: 'America/Chicago',
        flag: 'america.png'),
    WorldTime(
        location: 'America/Jamaica',
        url: 'America/Jamaica',
        flag: 'america.png'),
    WorldTime(
        location: 'America/Los_Angeles',
        url: 'America/Los_Angeles',
        flag: 'america.png'),
    WorldTime(
        location: 'America/New_York',
        url: 'America/New_York',
        flag: 'america.png'),
    WorldTime(
        location: 'America/Santiago',
        url: 'America/Santiago',
        flag: 'america.png'),
    WorldTime(
        location: 'America/Toronto',
        url: 'America/Toronto',
        flag: 'america.png'),
    WorldTime(
        location: 'America/Whitehorse',
        url: 'America/Whitehorse',
        flag: 'america.png'),*/
    WorldTime(
        location: 'Asia/Bangkok', url: 'Asia/Bangkok', flag: 'bangkok.png'),
    WorldTime(location: 'Asia/Dhaka', url: 'Asia/Dhaka', flag: 'dhaka.png'),
    WorldTime(location: 'Asia/Dubai', url: 'Asia/Dubai', flag: 'dubai.png'),
    WorldTime(location: 'Asia/Kabul', url: 'Asia/Kabul', flag: 'kabul.png'),
    WorldTime(
        location: 'Asia/Karachi', url: 'Asia/Karachi', flag: 'karachi.png'),
    WorldTime(location: 'Asia/Kolkata', url: 'Asia/Kolkata', flag: 'india.png'),
    WorldTime(location: 'Asia/Qatar', url: 'Asia/Qatar', flag: 'qatar.png'),
    WorldTime(
        location: 'Asia/Shanghai', url: 'Asia/Shanghai', flag: 'china.png'),
    WorldTime(
        location: 'Asia/Singapore',
        url: 'Asia/Singapore',
        flag: 'singapore.png'),
    WorldTime(location: 'Asia/Tokyo', url: 'Asia/Tokyo', flag: 'tokyo.png'),
    WorldTime(
        location: 'Australia/Adelaide',
        url: 'Australia/Adelaide',
        flag: 'australia.png'),
    WorldTime(
        location: 'Australia/Melbourne',
        url: 'Australia/Melbourne',
        flag: 'australia.png'),
    WorldTime(
        location: 'Australia/Perth',
        url: 'Australia/Perth',
        flag: 'australia.png'),
    WorldTime(
        location: 'Australia/Sydney',
        url: 'Australia/Sydney',
        flag: 'australia.png'),
    WorldTime(
        location: 'Europe/Istanbul',
        url: 'Europe/Istanbul',
        flag: 'istumbul.jpg'),
    WorldTime(
        location: 'Europe/London', url: 'Europe/London', flag: 'london.png'),
    WorldTime(
        location: 'Europe/Madrid', url: 'Europe/Madrid', flag: 'madrid.png'),
    //WorldTime(location: 'Europe/Moscow', url: 'Europe/Moscow', flag: ''),
    WorldTime(location: 'Europe/Paris', url: 'Europe/Paris', flag: 'paris.png'),
    WorldTime(
        location: 'Europe/Prague', url: 'Europe/Prague', flag: 'prague.png'),
    WorldTime(location: 'Europe/Rome', url: 'Europe/Rome', flag: 'rome.png'),
    WorldTime(
        location: 'Indian/Maldives',
        url: 'Indian/Maldives',
        flag: 'maldivs.png'),
    WorldTime(
        location: 'Pacific/Auckland',
        url: 'Pacific/Auckland',
        flag: 'auckland.png'),
    WorldTime(location: 'Pacific/Fiji', url: 'Pacific/Fiji', flag: 'fiji.png'),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isdaytime': worldTime.isdaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      url: 'Europe/London',
      location: 'London',
      flag: 'uk.png',
    ),
    WorldTime(
      url: 'Asia/Kolkata',
      location: 'Kolkata',
      flag: 'india.png',
    ),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'greece.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'egypt.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //Navigating to home screen.
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade800,
        title: Text(
          'Choose a Location',
          style: TextStyle(
            fontFamily: 'QuickSand',
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Colors.black26,
              child: ListTile(
                onTap: () {
                  updateTime(index);
                  print(locations[index].location);
                },
                title: Text(
                  locations[index].location,
                  style: TextStyle(
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

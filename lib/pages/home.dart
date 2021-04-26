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

    String bgImage = data['isDaytime'] ? 'day.png' : 'nightTime.png';

    Color bgColor =
        data['isDaytime'] ? Colors.blueGrey.shade200 : Colors.blueGrey.shade800;

    IconData locationIcon =
        data['isDaytime'] ? Icons.wb_sunny : Icons.nightlight_round;

    Color iconColor =
        data['isDaytime'] ? Colors.orange.shade800 : Colors.blue.shade700;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image(
                image: AssetImage('images/$bgImage'),
                height: 300,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 40.0),

            //Main Card:- containing all the other cards.
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.black12,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  //Time Card.
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                    color: Colors.red.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      child: Text(
                        data['time'],
                        style: TextStyle(
                          fontFamily: 'QuickSand',
                          fontSize: 66.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 0, 0, 10),
                        child: Icon(
                          locationIcon,
                          color: iconColor,
                          size: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),

                        //Location Card.
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.black54,
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: Text(
                              data['location'],
                              style: TextStyle(
                                fontFamily: 'DancingScript',
                                fontSize: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            //Location changing button.
            FloatingActionButton.extended(
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'location': result['location'],
                    'flag': result['flag'],
                    'isDaytime': result['isDaytime'],
                    'time': result['time'],
                  };
                });
              },
              backgroundColor: Colors.white54,
              label: Text(
                'Edit Location',
                style: TextStyle(
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              icon: Icon(
                Icons.edit_location,
                color: Colors.red.shade800,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

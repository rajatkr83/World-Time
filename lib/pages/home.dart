import 'package:flutter/material.dart';
import 'package:world_time/size_config.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 4,
              ),
              child: Image(
                image: AssetImage('images/$bgImage'),
                height: SizeConfig.blockSizeVertical * 25,
                width: double.infinity,
              ),
            ),

            //Main Card:- containing all the other cards.
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.black12,
              margin: EdgeInsets.only(
                bottom: SizeConfig.blockSizeVertical * 5,
                left: SizeConfig.blockSizeHorizontal * 6,
                right: SizeConfig.blockSizeHorizontal * 6,
              ),
              child: Column(
                children: [
                  //Time Card.
                  Card(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 6,
                        horizontal: SizeConfig.blockSizeHorizontal * 6
                    ),
                    color: Colors.red.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical * 1,
                          horizontal: SizeConfig.blockSizeHorizontal * 10
                      ),
                      child: Text(
                        data['time'],
                        style: TextStyle(
                          fontFamily: 'QuickSand',
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 16,
                          right: SizeConfig.blockSizeHorizontal * 1,
                        ),
                        child: Icon(
                          locationIcon,
                          color: iconColor,
                          size: SizeConfig.safeBlockVertical * 10,
                        ),
                      ),
                      Card(
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

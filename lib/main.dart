import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicPlaying(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MusicPlaying extends StatefulWidget {
  @override
  _MusicPlayingState createState() => _MusicPlayingState();
}

class _MusicPlayingState extends State<MusicPlaying> {
  double height, width;
  String time;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
            color: Colors.white10,
            child: Stack(
              children: <Widget>[
                AlbumArt(),
                AlbumDetails(),
                TimeDisplay(),
                BottomButtonPalette(),
                PlayPauseButtonSet(),
                BottomIconSet(),
                Slider(),
              ],
            )));
  }

  Widget AlbumArt() {
    return Container(
      height: double.infinity,
      margin:
          EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 0.35 * height),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular((width - 100) / 2),
              bottomRight: Radius.circular((width - 100) / 2)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 8),
                blurRadius: 5.0)
          ]),
    );
  }

  Widget AlbumDetails() =>Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30),
              width: (width - 100) / 1.5,
              height: height * 0.45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i.pinimg.com/originals/85/a3/df/85a3df623142a1e6705c368604fa30fb.jpg'),
                      fit: BoxFit.cover)),
            ),
            Text('Whatever It Takes',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 21.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 18,
            ),
            Text(
              'Avengers: EndGame',
              style: TextStyle(color: Colors.white, fontFamily: 'Varela'),
            )
          ],
        )
      ]);

  Widget Slider() => Positioned(
      left: 0,
      right: 0,
      top: height - 209,
      child: SleekCircularSlider(
          min: 0,
          max: 100,
          initialValue: 100,
          onChange: (value) {
            timeUpdate(value.toString().substring(0, 5));
          },
          onChangeEnd: (value) {},
          onChangeStart: (value) {},
          innerWidget: (value) => Container(),
          appearance: CircularSliderAppearance(
            startAngle: 180,
            angleRange: 180,
            size: width - 15,
            customWidths: CustomSliderWidths(
                progressBarWidth: 4.0, trackWidth: 4.0, handlerSize: 8.0),
            customColors: CustomSliderColors(
              progressBarColor: Colors.pinkAccent[900],
              trackColor: Colors.grey,
              dotColor: Colors.pinkAccent,
            ),
          )));

  Widget TimeDisplay() {
    return Positioned(
      bottom: 222,
      left: 155,
      child: Text('03:05',
          style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 21.0,
              color: Colors.amber,
              fontWeight: FontWeight.bold)),
    );
  }

  void timeUpdate(String timer) {
    setState(() {
      time = timer;
    });
  }

  Widget BottomButtonPalette() {
    return Positioned(
        left: 7,
        right: 7,
        top: height - 209,
        child: Container(
          width: width - 15,
          height: 209,
          decoration: BoxDecoration(
              color: Color(0xFF02182f),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(width / 2),
                topRight: Radius.circular(width / 2),
              )),
        ));
  }

  Widget PlayPauseButtonSet() {
    return Positioned(
        bottom: 75,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {},
              elevation: 1.0,
              fillColor: Colors.transparent,
              child: Icon(
                Icons.skip_previous,
                size: 45.0,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.transparent,
              child: Icon(
                Icons.pause,
                size: 75.0,
                color: Colors.pink,
              ),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.transparent,
              child: Icon(
                Icons.skip_next,
                size: 45.0,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
            ),
          ],
        ));
  }

  Widget BottomIconSet() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 0.12 * height,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.bookmark_border,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 42,
                          ),
                          Icon(
                            Icons.shuffle,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 42,
                          ),
                          Icon(
                            Icons.repeat,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 42,
                          ),
                          Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                            size: 30,
                          )])))]))]));

  }
}

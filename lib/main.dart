import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  //Sets Nav bar and Status Bar Color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blueGrey, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.blueGrey, // status bar color
  ));

  return runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Xylophone'),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
          body: Xylophone(),
        ),
      ),
    ),
  );
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final player = AudioCache();

  void playsound(int number) {
    setState(() {
      player.play('note$number.wav');
    });
  }

  Expanded buildKey(Color color1, int n) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          playsound(n);
        },
        child: Container(
          color: color1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildKey(Colors.purple, 1),
        buildKey(Colors.indigo, 2),
        buildKey(Colors.blue, 3),
        buildKey(Colors.green, 4),
        buildKey(Colors.yellow, 5),
        buildKey(Colors.orange, 6),
        buildKey(Colors.red, 7),
      ],
    );
  }
}

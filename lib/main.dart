import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_visualizers/Visualizers/LineVisualizer.dart';
import 'package:flutter_visualizers/flutter_visualizers.dart';
import 'package:flutter_visualizers/visualizer.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  double _thumbPercent = 0.1;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Now playing',
            style: TextStyle(
              color: Colors.black,
            )
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(110, 20, 0, 0),
            child: Card(
              elevation: 10.0,
              shape: CircleBorder(),
              shadowColor: Color(0xFF2D27FF),
              child: CircleAvatar(
                radius: 90.0,
                backgroundImage: AssetImage('Assets/1*bqNsZ6GB2aMsZE20m8tcJw.jpeg'),
              ),
            ),
          ),
          Visualizer(
            builder: (BuildContext context, List<int> wave) {
              return new CustomPaint(
                painter: new LineVisualizer(
                  waveData: wave,
                  height: MediaQuery.of(context).size.height,
                  width : MediaQuery.of(context).size.width,
                  color: Colors.blueAccent,
                ),
                child: new Container(),
              );
            },

          ),
          Container(
          margin: EdgeInsets.fromLTRB(140, 250, 0, 0),
          child: Text(
                'Shape of you',
            style: TextStyle(
            fontSize: 19, fontWeight: FontWeight.bold
          ),
            ),
          ),
          Container(
          margin: EdgeInsets.fromLTRB(115, 300, 0, 0),
          child: Text(
                'Ed Sheeran | Sony Music',
            style: TextStyle(
              color: Colors.grey,
            fontSize: 15,
          ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(35, 550, 35, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Icon(
                  Icons.fast_rewind,
                  color: Colors.black,
                  size: 40.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Icon(
                  Icons.play_arrow,
                  color: Color(0xFF2D27FF),
                  size: 90.0,
                ),
                Icon(
                  Icons.fast_forward,
                  color: Colors.black,
                  size: 40.0,
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(45, 450, 0, 0),
            width:330,
            child: CupertinoSlider(

              activeColor: Color(0xFF2D27FF),
              thumbColor: Colors.white,
              value: _thumbPercent,
              divisions: 10,
              onChanged: (double percent) {
                setState(() {
                  _thumbPercent = percent;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(180, 500, 0, 0),
            child: Text(
              '3:05|6:05', style: TextStyle( color: Colors.grey,
              fontSize:11,
            ),

            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 700, 0, 0) ,
            child: Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.grey[700],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 720, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Icon(
                  Icons.shuffle,
                  color: Colors.grey,
                  size: 30.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Icon(
                  Icons.repeat,
                  color: Colors.grey,
                  size: 30.0,
                ),
                Icon(
                  Icons.playlist_play,
                  color: Colors.grey,
                  size: 30.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rfid_radius_calculator/config.dart';
import 'package:rfid_radius_calculator/distance_calculator.dart';
import 'package:rfid_radius_calculator/radius_influencer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RFID Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CirclePage(),
    );
  }
}

class CirclePage extends StatefulWidget {
  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  double _radius = 50.0;
  static double _ceilingHeight = measuredHeight;
  static double _badgeHeight = 0;
  double _height = _ceilingHeight - _badgeHeight;
  double _xCircle = 20;
  double _yCircle = 20;
  static double _widthDoor = 2;
  static double _widthImageOnScreenInPx = 200;
  double _obstructionFactor = radiusWithObstruction / radiusNoObstruction;
  RadiusInfluencer _radiusInfluencer = RadiusInfluencer(radiusWithObstruction,
      radiusNoObstruction, _widthDoor, _widthImageOnScreenInPx);

  void _setCeilingHeight(double value) {
    setState(() {
      _ceilingHeight = value;
      _height =
          DistanceCalculator.calculateHeight(_ceilingHeight, _badgeHeight);
      _radius = DistanceCalculator.calculateRadius(_height,
          _obstructionFactor, _radiusInfluencer.scale);
    });
  }

  void _setBadgeHeight(double value) {
    setState(() {
      _badgeHeight = value;
      _height =
          DistanceCalculator.calculateHeight(_ceilingHeight, _badgeHeight);
      _radius = DistanceCalculator.calculateRadius(_height,
          _obstructionFactor, _radiusInfluencer.scale);
    });
  }

  void _setX(double value) {
    setState(() {
      _xCircle = value;
    });
  }

  void _setY(double value) {
    setState(() {
      _yCircle = value;
    });
  }

  void _setWidthDoor(double value) {
    setState(() {
      _widthDoor = value;
      //double widthDoorInPx = DistanceCalculator.calculateMeterToPx(_widthDoor);
      _radiusInfluencer.SetScale(_widthDoor, _widthImageOnScreenInPx);
      _height =
          DistanceCalculator.calculateHeight(_ceilingHeight, _badgeHeight);
      _radius = DistanceCalculator.calculateRadius(_height,
          _obstructionFactor, _radiusInfluencer.scale);
    });
  }

  void _setObstructionFactor(double value) {
    setState(() {
      _obstructionFactor = value;
      _radius = DistanceCalculator.calculateRadius(_height,
          _obstructionFactor, _radiusInfluencer.scale);
    });
  }

  @override
  Widget build(BuildContext context) {
    _widthImageOnScreenInPx = MediaQuery.of(context).size.width;
    _radiusInfluencer.SetScale(_widthDoor, _widthImageOnScreenInPx);
    return Scaffold(
      appBar: AppBar(
        title: Text('RFID Demo'),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * (1520 / 2215),
                child: Image.asset(
                  'Overzicht-Mediport-RF.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Container(
                padding: EdgeInsets.all(6000 * _radiusInfluencer.scale * _height * _obstructionFactor),
                margin: EdgeInsets.fromLTRB(
                    DistanceCalculator.convertInputInMeterToPxOnScreen(_xCircle, _radiusInfluencer.scale),
                    DistanceCalculator.convertInputInMeterToPxOnScreen(_yCircle, _radiusInfluencer.scale),
                    0,
                    0),
                width: _radius * 2,
                height: _radius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(0, 0, 255, 0.6),
                ),
                child: Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Slider(
                value: _ceilingHeight,
                min: 1.0,
                max: 6.0,
                onChanged: _setCeilingHeight,
              ),
              Text('Plafondhoogte: $_ceilingHeight m'),
              Slider(
                  value: _badgeHeight,
                  min: 0.0,
                  max: 2.0,
                  onChanged: _setBadgeHeight),
              Text('Badgehoogte: $_badgeHeight m'),
              Slider(value: _xCircle, min: 0.0, max: 100.0, onChanged: _setX),
              Text('Positie x: $_xCircle m'),
              Slider(value: _yCircle, min: 0.0, max: 100.0, onChanged: _setY),
              Text('Positie y: $_yCircle m'),
              Slider(
                  value: _widthDoor,
                  min: 0.0,
                  max: 5.0,
                  onChanged: _setWidthDoor),
              Text('Breedte deur: $_widthDoor m'),
              Slider(
                  value: _obstructionFactor,
                  min: 0.0,
                  max: 1.0,
                  onChanged: _setObstructionFactor),
              Text('ObstructieFactor (gemeten: 0,7105263): $_obstructionFactor'),

            ],
          ),
        ],
      ),
    );
  }
}

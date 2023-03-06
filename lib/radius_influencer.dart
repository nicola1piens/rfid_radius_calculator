import 'config.dart';
import 'distance_calculator.dart';

class RadiusInfluencer {
  late double _obstructionFactor;
  late double _scale;

  RadiusInfluencer(double radiusWithObstruction, radiusNoObstruction, double widthDoor, double widthImageOnScreenInPx) {
    SetObstructionFactor(radiusWithObstruction, radiusNoObstruction);
    SetScale(widthDoor, widthImageOnScreenInPx);
  }

  RadiusInfluencer.onlyScale(double widthDoor, double widthImageOnScreenInPx) {
    SetObstructionFactor(radiusWithObstruction, radiusNoObstruction);
    SetScale(widthDoor, widthImageOnScreenInPx);
  }

  double get obstructionFactor => _obstructionFactor;
  SetObstructionFactor(double radiusWithObstruction, double radiusNoObstruction) {
      double obstructionFactor = radiusWithObstruction / radiusNoObstruction;
      _obstructionFactor = obstructionFactor;
  }

  double get scale => _scale;
  SetScale(double widthDoor, double widthImageOnScreenInPx) {
    double scale = DistanceCalculator.calculateScale(widthDoor, widthImageOnScreenInPx);
    _scale = scale;
  }
}
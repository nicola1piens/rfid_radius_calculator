import 'package:rfid_radius_calculator/config.dart';

class DistanceCalculator {
  /// Berekent de straal op basis van de hoogte van de rfid reader
  /// De parameter "height" te samen met de constanten "measuredHeight"
  /// en "radiusNoObstruction" worden gebruikt om te extrapoleren naar de straal.
  /// Returns radius in meter.
  static double calculateRadius(double height, double obstructionFactor, double scale) {
    double heightInPx = calculateMeterToPx(height);
    double radiusInPx = _heightToRadiusConverter(heightInPx) * obstructionFactor * scale;
    return radiusInPx;
  }

  static double _heightToRadiusConverter(double height) {
    return radiusNoObstruction * (height / measuredHeight);
  }

  static double calculateScale(double widthDoor, double widthImageOnScreenInPx) {
    // constante kan fout zijn, dit is maar een gok
    const double imageDoorScale = 34.475;
    double widthDoorInPx = calculateMeterToPx(widthDoor);
    double widthDoorOnScreenInPx = widthImageOnScreenInPx / imageDoorScale;
    double scale = widthDoorOnScreenInPx / widthDoorInPx;
    return scale;
  }

  static double calculateMeterToPx(double lengthInMeter) {
    // 0.0264583333 is gelijk aan 1 px in cm.
    double lengthInPx = (lengthInMeter / 0.000264583333);
    return lengthInPx;
  }

  static double calculatePxToMeter(double lengthInPx) {
    // 0.0264583333 is gelijk aan 1 px in cm.
    double lengthInMeter = (lengthInPx * 0.000264583333);
    return lengthInPx;
  }

  static double convertInputInMeterToPxOnScreen(double lengthInMeter, double scale) {
    double lengthInPxOnScreen = calculateMeterToPx(lengthInMeter) * scale;
    return lengthInPxOnScreen;
  }

  static double convertPxOnScreenToRealLength(double lengthInPx, double scale) {
    double lengthInRealMeters = calculatePxToMeter(lengthInPx) / scale;
    return lengthInRealMeters;
  }

  /// Parameters x en y zijn de coördinaten van de rfid
  /// Returns distance in meter
  static double calculateX_Left(double x, double y) {
    throw Exception("Not implemented yet");
  }

  /// Parameters x en y zijn de coördinaten van de rfid
  /// Returns distance in meter
  static double calculateX_Right(double x, double y) {
    throw Exception("Not implemented yet");
  }

  /// Parameters x en y zijn de coördinaten van de rfid
  /// Returns distance in meter
  static double calculateY_Bottom(double x, double y) {
    throw Exception("Not implemented yet");
  }

  /// Parameters x en y zijn de coördinaten van de rfid
  /// Returns distance in meter
  static double calculateY_Top(double x, double y) {
    throw Exception("Not implemented yet");
  }

  static double calculateHeight(double ceilingHeight, double badgeHeight) {
    double height = ceilingHeight - badgeHeight;
    return height;
  }
}

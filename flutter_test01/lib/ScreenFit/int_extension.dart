import 'ScreenFit.dart';

extension IntFit on int{
  double get pixel {
   return ScreenFit.pixel(this.toDouble());
  }

  double get pt{
    return ScreenFit.pt(this.toDouble());
  }
}
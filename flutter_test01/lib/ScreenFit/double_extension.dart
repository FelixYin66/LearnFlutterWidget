import 'ScreenFit.dart';

extension  DoubleFit on double{
  double get pixel {
    return ScreenFit.pixel(this);
  }

  double get pt{
    return ScreenFit.pt(this);
  }
}
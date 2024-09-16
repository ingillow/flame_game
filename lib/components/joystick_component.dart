

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/cupertino.dart';

class JoyStickComponent extends JoystickComponent {
  JoyStickComponent()
      : super(
    knob: CircleComponent(
      radius: 30,
      paint: BasicPalette.darkBlue.paint(),
    ),
    margin: const EdgeInsets.only(left: 20, bottom: 20),
    background: CircleComponent(
      paint: BasicPalette.white.withAlpha(50).paint(),
      radius: 60,
    ),
  );
}
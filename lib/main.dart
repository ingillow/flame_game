import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/cupertino.dart';


import 'components/components.dart';
import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(const StartPage());
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: TiledGame());
  }
}


class TiledGame extends FlameGame with HasGameRef, HasCollisionDetection {
 late final TiledComponent mapComponent;
 late final MainHeroComponent mainHeroComponent;
 late final JoyStickComponent joystick;

  @override
  Future<void> onLoad() async {
    mapComponent = await TiledComponent.load('test_map.tmx', Vector2.all(16));
    mainHeroComponent = MainHeroComponent();
    joystick = JoyStickComponent();

    final screenSize = gameRef.size;

    MapUtils.scaleMapToFitScreen(mapComponent, screenSize);

    MapUtils.centerMainHeroOnMap(mainHeroComponent, mapComponent);

    final obstacleLayer = mapComponent.tileMap.getLayer<ObjectGroup>('obstacles');
    if (obstacleLayer != null) {
      for (final obj in obstacleLayer.objects) {
        add(Obstacle(Vector2(obj.x, obj.y), Vector2(obj.width, obj.height)));
      }
    }

    add(mapComponent);
    add(mainHeroComponent);
    add(joystick);
  }


  @override
  void update(double dt) {
    super.update(dt);
    mainHeroComponent.updateMovement(joystick.relativeDelta, dt);
  }
}






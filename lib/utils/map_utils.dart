import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

import '../components/components.dart';


class MapUtils {

  /// положение карты на экране, тк размеры маленькие, то либо увеличить карту в тайлд и сделать ее бесконечной,
  /// либо использовать этот статический метод
  static void scaleMapToFitScreen(TiledComponent mapComponent, Vector2 screenSize) {
    final mapWidth = mapComponent.tileMap.map.width * 16;
    final mapHeight = mapComponent.tileMap.map.height * 16;


    final scaleX = screenSize.x / mapWidth;
    final scaleY = screenSize.y / mapHeight;
    final scale = scaleX < scaleY ? scaleX : scaleY;


    mapComponent.scale = Vector2(scale, scale);
  }

  /// определяет положение героя на карте, по умолчанию будет верхний левый угол
  static void centerMainHeroOnMap(MainHeroComponent mainHero, TiledComponent mapComponent) {
    final mapWidth = mapComponent.tileMap.map.width * 16;
    final mapHeight = mapComponent.tileMap.map.height * 16;

    mainHero.position = Vector2(
      mapWidth / 2 - mainHero.size.x / 2,
      mapHeight / 2 - mainHero.size.y / 2,
    );
  }
}


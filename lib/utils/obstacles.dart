import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Obstacle extends PositionComponent with CollisionCallbacks {
  Obstacle(Vector2 position, Vector2 size) {
    this.position = position;
    this.size = size;
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}

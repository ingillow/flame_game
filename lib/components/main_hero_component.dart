
import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../utils/obstacles.dart';


class MainHeroComponent extends SpriteAnimationComponent with HasGameRef, CollisionCallbacks {
  final double stepTime = 0.5;
  final double speed = 100;

  Vector2 moveDirection = Vector2.zero();

  late final SpriteAnimation idleAnimation;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    await gameRef.images.load('idle.png');
    idleAnimation = _spriteAnimation('idle.png', 4);
    animation = idleAnimation;

    add(RectangleHitbox()
      ..collisionType = CollisionType.active);
  }


  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Obstacle) {
      position.add(-moveDirection.normalized() * speed * 0.1);
    }
  }

  void updateMovement(Vector2 joystickDelta, double dt) {
    moveDirection = joystickDelta * speed * dt;

    if (moveDirection != Vector2.zero()) {
      position.add(moveDirection);
    }
  }

  SpriteAnimation _spriteAnimation(String path, int amount) {
    return SpriteAnimation.fromFrameData(
      gameRef.images.fromCache(path),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2(64, 64),
      ),
    );
  }
}















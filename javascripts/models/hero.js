(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Models.Hero = (function(superClass) {
    extend(Hero, superClass);

    Hero.prototype.collidable = true;

    Hero.prototype.gravitable = true;

    Hero.prototype.sourceWidth = 99;

    Hero.prototype.sourceHeight = 63;

    Hero.prototype.width = 33;

    Hero.prototype.height = 21;

    Hero.prototype.speed = 3;

    Hero.prototype.jumpingCounter = 0;

    Hero.prototype.jumpingForce = 12;

    Hero.prototype.jumping = false;

    Hero.prototype.falling = true;

    Hero.prototype.moving = false;

    Hero.prototype.activeAnimationName = "stayRight";

    function Hero(world, imagePath) {
      this.world = world;
      this.rainbow = new RaY.Models.Rainbow(this.world);
      Hero.__super__.constructor.call(this, this.world, imagePath);
      this.jumpSound = this.world.sounds("jump");
    }

    Hero.prototype.update = function() {
      if (!this.moving) {
        this.animateStay();
      }
      this.moving = false;
      if (this.jumping) {
        this.jump();
      }
      this.spawnRainbow();
      return Hero.__super__.update.apply(this, arguments);
    };

    Hero.prototype.moveLeft = function() {
      this.moving = true;
      this.activateAnimation("runLeft");
      this.x -= this.speed;
      return this.setPosition(this.x, this.y);
    };

    Hero.prototype.moveRight = function() {
      this.moving = true;
      this.activateAnimation("runRight");
      this.x += this.speed;
      return this.setPosition(this.x, this.y);
    };

    Hero.prototype.jump = function() {
      this.moving = true;
      if (!this.falling) {
        this.y -= this.jumpingForce - this.jumpingCounter;
        this.jumpingCounter += 1;
        if (this.jumpingCounter >= this.maximumSpeed) {
          this.endJumping();
          return this.startFalling();
        }
      }
    };

    Hero.prototype.startJumping = function() {
      if (!(this.jumping || this.falling)) {
        this.jumpSound.play();
      }
      return this.jumping = true;
    };

    Hero.prototype.endJumping = function() {
      this.jumping = false;
      return this.jumpingCounter = 0;
    };

    Hero.prototype.manageCollisionWith = function(element) {
      if (!(element instanceof RaY.Models.Hero)) {
        return Hero.__super__.manageCollisionWith.apply(this, arguments);
      }
    };

    Hero.prototype.leftSideCollisionWith = function(element) {
      Hero.__super__.leftSideCollisionWith.apply(this, arguments);
      return element.applyForce(-this.speed, 0);
    };

    Hero.prototype.rightSideCollisionWith = function(element) {
      Hero.__super__.rightSideCollisionWith.apply(this, arguments);
      return element.applyForce(this.speed, 0);
    };

    Hero.prototype.bottomSideCollisionWith = function(element) {
      if (this.left() + this.speed === element.right() || this.left() - this.speed === element.right()) {
        return this.setPosition(element.right(), this.y);
      } else if (this.right() + this.speed === element.left() || this.right() - this.speed === element.left()) {
        return this.setPosition(element.left() - this.width, this.y);
      } else {
        Hero.__super__.bottomSideCollisionWith.apply(this, arguments);
        return this.endJumping();
      }
    };

    Hero.prototype.topSideCollisionWith = function(element) {
      Hero.__super__.topSideCollisionWith.apply(this, arguments);
      this.endJumping();
      return this.startFalling();
    };

    Hero.prototype.animateStay = function() {
      return this.activateAnimation(this.activeAnimationName.indexOf("Left") !== -1 ? "stayLeft" : "stayRight");
    };

    Hero.prototype.spawnRainbow = function() {
      if (this.activeAnimationName.indexOf("Left") !== -1) {
        return this.rainbow.setPosition(this.x + 22, this.y + 1);
      } else {
        return this.rainbow.setPosition(this.x + 7, this.y + 1);
      }
    };

    Hero.prototype.animations = function() {
      return {
        stayRight: {
          frames: 1,
          delay: 1,
          sourceX: 0,
          sourceY: 0
        },
        stayLeft: {
          frames: 1,
          delay: 1,
          sourceX: this.sourceWidth,
          sourceY: 0
        },
        runLeft: {
          frames: 2,
          delay: 6,
          sourceX: 0,
          sourceY: this.sourceHeight * 2
        },
        runRight: {
          frames: 2,
          delay: 6,
          sourceX: 0,
          sourceY: this.sourceHeight
        }
      };
    };

    Hero.prototype.destroy = function() {
      this.rainbow.destroy();
      return Hero.__super__.destroy.apply(this, arguments);
    };

    return Hero;

  })(RaY.Engine.Entity);

}).call(this);

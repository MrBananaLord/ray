(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.Hero = (function(_super) {
    __extends(Hero, _super);

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

    function Hero(world, imagePath) {
      this.world = world;
      Hero.__super__.constructor.call(this, this.world, imagePath);
    }

    Hero.prototype.update = function() {
      if (this.jumping) {
        this.jump();
      }
      return Hero.__super__.update.apply(this, arguments);
    };

    Hero.prototype.moveLeft = function() {
      this.x -= this.speed;
      return this.setPosition(this.x, this.y);
    };

    Hero.prototype.moveRight = function() {
      this.x += this.speed;
      return this.setPosition(this.x, this.y);
    };

    Hero.prototype.jump = function() {
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

    return Hero;

  })(RaY.Engine.Entity);

}).call(this);

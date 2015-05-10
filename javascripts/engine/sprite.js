(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Engine.Sprite = (function(_super) {
    __extends(Sprite, _super);

    Sprite.prototype.sourceWidth = 0;

    Sprite.prototype.sourceHeight = 0;

    Sprite.prototype.activeAnimationName = "default";

    function Sprite(world, imageName) {
      this.world = world;
      this.image = this.world.images(imageName);
      this.activateAnimation(this.activeAnimationName, true);
      Sprite.__super__.constructor.apply(this, arguments);
    }

    Sprite.prototype.drawImage = function(sourceX, sourceY, destinationX, destinationY) {
      if (this.image.isReady() && !this.hidden) {
        return this.world.context.drawImage(this.image.image, this.activeAnimation()["sourceX"] + this.sourceWidth * this.frame, this.activeAnimation()["sourceY"], this.sourceWidth, this.sourceHeight, destinationX, destinationY, this.width, this.height);
      }
    };

    Sprite.prototype.update = function() {
      this.animate();
      return Sprite.__super__.update.apply(this, arguments);
    };

    Sprite.prototype.animate = function() {
      if (this.activeAnimation()["delay"] <= this.animationDelayCounter) {
        this.frame = (this.frame + 1) % this.activeAnimation()["frames"];
        return this.animationDelayCounter = 0;
      } else {
        return this.animationDelayCounter += 1;
      }
    };

    Sprite.prototype.activeAnimation = function() {
      return this.animations()[this.activeAnimationName];
    };

    Sprite.prototype.activateAnimation = function(name, force) {
      if (force == null) {
        force = false;
      }
      if (!this.animations()[name]) {
        throw "InvalidAnimationName";
      }
      if (force || name !== this.activeAnimationName) {
        this.resetAnimationData();
        return this.activeAnimationName = name;
      }
    };

    Sprite.prototype.resetAnimationData = function() {
      this.frame = 0;
      return this.animationDelayCounter = 0;
    };

    Sprite.prototype.animations = function() {
      return {
        "default": {
          frames: 1,
          delay: 1,
          sourceX: 0,
          sourceY: 0
        }
      };
    };

    return Sprite;

  })(RaY.Engine.Rectangle);

}).call(this);

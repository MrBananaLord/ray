(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Engine.Sprite = (function(_super) {
    __extends(Sprite, _super);

    Sprite.prototype.sourceX = 0;

    Sprite.prototype.sourceY = 0;

    Sprite.prototype.sourceWidth = 0;

    Sprite.prototype.sourceHeight = 0;

    Sprite.prototype.frame = 0;

    Sprite.prototype.frames = 1;

    Sprite.prototype.frameDelay = 1;

    Sprite.prototype.frameDelayCounter = 0;

    Sprite.prototype.animationName = "default";

    function Sprite(world, imageUrl) {
      this.world = world;
      this.image = new RaY.Engine.SpriteImage(imageUrl);
      Sprite.__super__.constructor.apply(this, arguments);
    }

    Sprite.prototype.drawImage = function(sourceX, sourceY, destinationX, destinationY) {
      if (this.image.ready) {
        return this.world.context.drawImage(this.image.image, sourceX + this.sourceWidth * this.frame, sourceY + this.sourceHeight * this.animationOffset(), this.sourceWidth, this.sourceHeight, destinationX, destinationY, this.width, this.height);
      }
    };

    Sprite.prototype.update = function() {
      this.animate();
      return Sprite.__super__.update.apply(this, arguments);
    };

    Sprite.prototype.animate = function() {
      if (this.frameDelay <= this.frameDelayCounter) {
        this.frame = (this.frame + 1) % this.frames;
        return this.frameDelayCounter = 0;
      } else {
        return this.frameDelayCounter += 1;
      }
    };

    Sprite.prototype.animationOffset = function() {
      return 0;
    };

    return Sprite;

  })(RaY.Engine.Rectangle);

}).call(this);

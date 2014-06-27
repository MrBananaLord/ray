(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.Platform = (function(_super) {
    __extends(Platform, _super);

    Platform.prototype.collidable = true;

    Platform.prototype.gravitable = false;

    function Platform(world, x, y, width, height, fillStyle) {
      this.world = world;
      this.x = x;
      this.y = y;
      this.width = width;
      this.height = height;
      this.fillStyle = fillStyle;
      Platform.__super__.constructor.call(this, this.world);
    }

    return Platform;

  })(RaY.Engine.Rectangle);

}).call(this);

(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.Box = (function(_super) {
    __extends(Box, _super);

    Box.prototype.collidable = true;

    Box.prototype.gravitable = true;

    Box.prototype.height = 20;

    Box.prototype.width = 20;

    function Box(world, x, y, fillStyle) {
      this.world = world;
      this.x = x;
      this.y = y;
      this.fillStyle = fillStyle;
      Box.__super__.constructor.call(this, this.world);
    }

    return Box;

  })(RaY.Engine.Rectangle);

}).call(this);

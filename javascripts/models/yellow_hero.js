(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.YellowHero = (function(_super) {
    __extends(YellowHero, _super);

    function YellowHero(world) {
      this.world = world;
      YellowHero.__super__.constructor.call(this, this.world, "images/game/test.png");
    }

    YellowHero.prototype.bindToEvents = function() {
      var _this = this;

      this.bind(this.world, "keyDown", function(name) {
        switch (name) {
          case "a":
            return _this.moveLeft();
          case "d":
            return _this.moveRight();
          case "w":
            return _this.startJumping();
        }
      });
      return YellowHero.__super__.bindToEvents.apply(this, arguments);
    };

    return YellowHero;

  })(RaY.Models.Hero);

}).call(this);

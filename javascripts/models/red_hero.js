(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.RedHero = (function(_super) {
    __extends(RedHero, _super);

    function RedHero(world) {
      this.world = world;
      RedHero.__super__.constructor.call(this, this.world, "images/game/red_hero.png");
    }

    RedHero.prototype.bindToEvents = function() {
      var _this = this;

      this.bind(this.world, "keyDown", function(name) {
        switch (name) {
          case "left":
            return _this.moveLeft();
          case "right":
            return _this.moveRight();
          case "up":
            return _this.startJumping();
        }
      });
      return RedHero.__super__.bindToEvents.apply(this, arguments);
    };

    return RedHero;

  })(RaY.Models.Hero);

}).call(this);
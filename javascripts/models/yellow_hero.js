(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Models.YellowHero = (function(superClass) {
    extend(YellowHero, superClass);

    function YellowHero(world) {
      this.world = world;
      YellowHero.__super__.constructor.call(this, this.world, "yellow_hero");
    }

    YellowHero.prototype.bindToEvents = function() {
      this.bind(this.world, "keyDown", (function(_this) {
        return function(name) {
          switch (name) {
            case "a":
              return _this.moveLeft();
            case "d":
              return _this.moveRight();
            case "w":
              return _this.startJumping();
          }
        };
      })(this));
      return YellowHero.__super__.bindToEvents.apply(this, arguments);
    };

    return YellowHero;

  })(RaY.Models.Hero);

}).call(this);

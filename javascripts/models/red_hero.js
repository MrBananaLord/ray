(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Models.RedHero = (function(superClass) {
    extend(RedHero, superClass);

    function RedHero(world) {
      this.world = world;
      RedHero.__super__.constructor.call(this, this.world, "red_hero");
    }

    RedHero.prototype.bindToEvents = function() {
      this.bind(this.world, "keyDown", (function(_this) {
        return function(name) {
          switch (name) {
            case "left":
              return _this.moveLeft();
            case "right":
              return _this.moveRight();
            case "up":
              return _this.startJumping();
          }
        };
      })(this));
      return RedHero.__super__.bindToEvents.apply(this, arguments);
    };

    return RedHero;

  })(RaY.Models.Hero);

}).call(this);

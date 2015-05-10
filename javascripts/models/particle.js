(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.Particle = (function(_super) {
    __extends(Particle, _super);

    function Particle(world) {
      this.world = world;
      Particle.__super__.constructor.call(this, this.world, {
        x: 10,
        y: 10,
        width: 5,
        height: 5,
        fillStyle: "#fff"
      });
    }

    Particle.prototype.destroy = function() {
      console.debug('sad');
      return this.purge();
    };

    return Particle;

  })(RaY.Engine.Rectangle);

}).call(this);

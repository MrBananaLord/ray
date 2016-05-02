(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Models.Rainbow = (function(superClass) {
    extend(Rainbow, superClass);

    Rainbow.include(RaY.Engine.Modules.Callbacks);

    Rainbow.prototype.rainbowLength = 10;

    Rainbow.prototype.currentColumn = 0;

    function Rainbow(world) {
      this.world = world;
      this.particles = _(6).times((function(_this) {
        return function(rowIndex) {
          var fillStyle;
          fillStyle = 5 - rowIndex < _this.world.currentLevelId ? ["#f00", "#f80", "#ff0", "#0f0", "#00f", "#80f"][rowIndex] : ["#fff", "#ddd", "#bbb", "#999", "#777", "#555"][rowIndex];
          return _(_this.rainbowLength).times(function(particleIndex) {
            return new RaY.Engine.Rectangle(_this.world, {
              x: 10,
              y: 10,
              width: 4,
              height: 4,
              fillStyle: fillStyle
            });
          });
        };
      })(this));
    }

    Rainbow.prototype.destroy = function() {
      var i, j, len, len1, particle, ref, row;
      ref = this.particles;
      for (i = 0, len = ref.length; i < len; i++) {
        row = ref[i];
        for (j = 0, len1 = row.length; j < len1; j++) {
          particle = row[j];
          particle.destroy();
        }
      }
      this.particles = [];
      return this.purge();
    };

    Rainbow.prototype.setPosition = function(x, y) {
      var i, len, ref, results, row, rowIndex;
      this.iterateColumn();
      ref = this.particles;
      results = [];
      for (rowIndex = i = 0, len = ref.length; i < len; rowIndex = ++i) {
        row = ref[rowIndex];
        results.push(row[this.currentColumn].setPosition(x, y + rowIndex * 3));
      }
      return results;
    };

    Rainbow.prototype.iterateColumn = function() {
      return this.currentColumn = (this.currentColumn + 1) % this.rainbowLength;
    };

    return Rainbow;

  })(RaY.Engine.Module);

}).call(this);

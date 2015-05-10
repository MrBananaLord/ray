(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.Rainbow = (function(_super) {
    __extends(Rainbow, _super);

    Rainbow.include(RaY.Engine.Modules.Callbacks);

    function Rainbow(world) {
      var _this = this;

      this.world = world;
      this.particles = _(6).times(function(rowIndex) {
        var fillStyle;

        fillStyle = ["#f00", "#f80", "#ff0", "#0f0", "#00f", "#80f"][rowIndex];
        return _(10).times(function(particleIndex) {
          return new RaY.Engine.Rectangle(_this.world, {
            x: 10,
            y: 10,
            width: 4 - particleIndex / 3,
            height: 4 - particleIndex / 3,
            fillStyle: fillStyle
          });
        });
      });
    }

    Rainbow.prototype.destroy = function() {
      var particle, row, _i, _j, _len, _len1, _ref;

      _ref = this.particles;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        row = _ref[_i];
        for (_j = 0, _len1 = row.length; _j < _len1; _j++) {
          particle = row[_j];
          particle.destroy();
        }
      }
      this.particles = [];
      return this.purge();
    };

    Rainbow.prototype.setPosition = function(x, y) {
      var originalX, originalY, particle, particleIndex, row, rowIndex, tmpX, tmpY, _i, _len, _ref, _ref1, _ref2, _results;

      _ref = [x, y], originalX = _ref[0], originalY = _ref[1];
      _ref1 = this.particles;
      _results = [];
      for (rowIndex = _i = 0, _len = _ref1.length; _i < _len; rowIndex = ++_i) {
        row = _ref1[rowIndex];
        _ref2 = [originalX, originalY + rowIndex * 3], x = _ref2[0], y = _ref2[1];
        _results.push((function() {
          var _j, _len1, _ref3, _ref4, _results1;

          _results1 = [];
          for (particleIndex = _j = 0, _len1 = row.length; _j < _len1; particleIndex = ++_j) {
            particle = row[particleIndex];
            _ref3 = [particle.x, particle.y - particleIndex / 8], tmpX = _ref3[0], tmpY = _ref3[1];
            particle.setPosition(x, y + particleIndex / 8);
            _results1.push((_ref4 = [tmpX, tmpY], x = _ref4[0], y = _ref4[1], _ref4));
          }
          return _results1;
        })());
      }
      return _results;
    };

    return Rainbow;

  })(RaY.Engine.Module);

}).call(this);

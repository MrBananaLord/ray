(function() {
  RaY.Engine.InputHandler = (function() {
    InputHandler.prototype.keys = {
      37: "left",
      38: "up",
      39: "right",
      87: "w",
      68: "d",
      65: "a",
      82: "r"
    };

    InputHandler.prototype.keysDown = {};

    function InputHandler(world) {
      var _this = this;

      this.world = world;
      $("body").keydown(function(e) {
        return _this.keyDown(e.keyCode);
      });
      $("body").keyup(function(e) {
        return _this.keyUp(e.keyCode);
      });
    }

    InputHandler.prototype.update = function() {
      var key, _i, _len, _ref, _results;

      _ref = _.intersection(_.keys(this.keysDown), _.keys(this.keys));
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        key = _ref[_i];
        _results.push(this.world.trigger("keyDown", this.keys[key]));
      }
      return _results;
    };

    InputHandler.prototype.keyDown = function(code) {
      return this.keysDown[code] = true;
    };

    InputHandler.prototype.keyUp = function(code) {
      this.world.trigger("keyUp", this.keys[code]);
      return delete this.keysDown[code];
    };

    return InputHandler;

  })();

}).call(this);

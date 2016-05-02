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
      this.world = world;
      $("body").keydown((function(_this) {
        return function(e) {
          return _this.keyDown(e.keyCode);
        };
      })(this));
      $("body").keyup((function(_this) {
        return function(e) {
          return _this.keyUp(e.keyCode);
        };
      })(this));
    }

    InputHandler.prototype.update = function() {
      var i, key, len, ref, results;
      ref = _.intersection(_.keys(this.keysDown), _.keys(this.keys));
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        key = ref[i];
        results.push(this.world.trigger("keyDown", this.keys[key]));
      }
      return results;
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

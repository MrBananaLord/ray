(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Models.Gui = (function(superClass) {
    extend(Gui, superClass);

    Gui.include(RaY.Engine.Modules.Callbacks);

    Gui.prototype.offsetX = 0;

    Gui.prototype.offsetY = 0;

    Gui.prototype.height = 480;

    Gui.prototype.width = 640;

    Gui.prototype.resetCount = 1;

    Gui.prototype.completed = false;

    Gui.prototype.elements = [];

    Gui.prototype.level = 1;

    Gui.prototype.hidden = false;

    function Gui(world) {
      this.world = world;
      this.bindToEvents();
      this.buildScene();
    }

    Gui.prototype.bindToEvents = function() {
      this.bind(this.world, "levelCompleted", (function(_this) {
        return function() {
          return _this.levelCompleted();
        };
      })(this));
      this.bind(this.world, "resetGui", (function(_this) {
        return function() {
          return _this.reset();
        };
      })(this));
      this.bind(this.world, "hideGui", (function(_this) {
        return function() {
          return _this.hide();
        };
      })(this));
      return this.bind(this.world, "showGui", (function(_this) {
        return function() {
          return _this.show();
        };
      })(this));
    };

    Gui.prototype.levelCompleted = function() {
      if (!this.world.currentLevel.completed) {
        this.level += 1;
        return this.resetScene();
      }
    };

    Gui.prototype.createBackground = function() {
      this.background = new RaY.Engine.Rectangle(this.world, {
        fillStyle: "#23cccc",
        width: 146 + this.resetCountLength(),
        height: 38,
        x: 2,
        y: 2
      });
      return this.background;
    };

    Gui.prototype.resetCountLength = function() {
      return (this.resetCount.toString().length - 1) * 7;
    };

    Gui.prototype.resetCounterMessage = function() {
      return "Lvl: " + this.level + ".  Attempts: " + this.resetCount;
    };

    Gui.prototype.createResetCounter = function() {
      this.resetCounter = new RaY.Models.Message(this.world, this.resetCounterMessage(), {
        x: 5,
        y: 5,
        height: 32,
        width: 140 + this.resetCountLength(),
        fillStyle: "#cc35cc",
        contentX: 7,
        contentY: 22,
        textFillStyle: "#fff"
      });
      return this.resetCounter;
    };

    Gui.prototype.buildScene = function() {
      if (!this.hidden) {
        this.createBackground();
        return this.createResetCounter();
      }
    };

    Gui.prototype.destroyScene = function() {
      if (!this.hidden) {
        this.resetCounter = this.resetCounter.destroy();
        return this.background = this.background.destroy();
      }
    };

    Gui.prototype.resetScene = function() {
      this.destroyScene();
      return this.buildScene();
    };

    Gui.prototype.reset = function() {
      this.resetCount++;
      return this.resetScene();
    };

    Gui.prototype.destroy = function() {
      this.destroyScene();
      return this.purge();
    };

    Gui.prototype.hide = function() {
      this.destroyScene();
      return this.hidden = true;
    };

    Gui.prototype.show = function() {
      this.hidden = false;
      return this.buildScene();
    };

    return Gui;

  })(RaY.Engine.Module);

}).call(this);

(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.World = (function(_super) {
    __extends(World, _super);

    World.include(RaY.Engine.Modules.Callbacks);

    World.prototype.viewWidth = 640;

    World.prototype.viewHeight = 480;

    World.prototype.width = 640;

    World.prototype.height = 480;

    World.prototype.gravity = 1;

    World.prototype.levels = ["Tutorial 1", "Xtreme", "The End"];

    function World() {
      var _this = this;

      this.context = this.createCanvasAndGetContext();
      this.imageRepository = new RaY.Engine.ImageRepository;
      this.soundRepository = new RaY.Engine.SoundRepository;
      this.currentLevel = new RaY.Models.Level(this, "Tutorial 1");
      this.gui = new RaY.Models.Gui(this);
      this.bind(this, "levelCompleted", function() {
        return _this.proceedToNextLevel();
      });
    }

    World.prototype.proceedToNextLevel = function() {
      var nextLevelName;

      if (nextLevelName = this.levels[this.levels.indexOf(this.currentLevel.name) + 1]) {
        this.currentLevel.destroy();
        this.currentLevel = new RaY.Models.Level(this, nextLevelName);
        return this.gui.resetScene();
      }
    };

    World.prototype.createCanvasAndGetContext = function() {
      var canvas;

      canvas = document.createElement("canvas");
      canvas.width = this.viewWidth;
      canvas.height = this.viewHeight;
      $("body").append(canvas);
      return canvas.getContext("2d");
    };

    World.prototype.update = function() {
      if (this.isReady()) {
        return this.trigger("update");
      }
    };

    World.prototype.render = function() {
      if (this.isReady()) {
        return this.trigger("render");
      }
    };

    World.prototype.isReady = function() {
      return this.imageRepository.isReady() && this.soundRepository.isReady();
    };

    World.prototype.sounds = function(name) {
      return this.soundRepository.find(name);
    };

    World.prototype.images = function(name) {
      return this.imageRepository.find(name);
    };

    return World;

  })(RaY.Engine.Module);

}).call(this);

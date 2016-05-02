(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Models.World = (function(superClass) {
    extend(World, superClass);

    World.include(RaY.Engine.Modules.Callbacks);

    World.prototype.viewWidth = 640;

    World.prototype.viewHeight = 480;

    World.prototype.width = 640;

    World.prototype.height = 480;

    World.prototype.gravity = 1;

    World.prototype.currentLevelId = 0;

    World.prototype.levels = ["Tutorial 1", "Tutorial 2", "First challenge", "Not that easy", "Almost deadly", "Xtreme", "The End"];

    function World() {
      this.context = this.createCanvasAndGetContext();
      this.imageRepository = new RaY.Engine.ImageRepository;
      this.soundRepository = new RaY.Engine.SoundRepository;
      this.currentLevel = new RaY.Models.Level(this, this.levels[this.currentLevelId]);
      this.gui = new RaY.Models.Gui(this);
      this.bind(this, "levelCompleted", (function(_this) {
        return function() {
          return _this.proceedToNextLevel();
        };
      })(this));
    }

    World.prototype.proceedToNextLevel = function() {
      if (this.currentLevelId + 1 < this.levels.length) {
        this.currentLevelId += 1;
        this.currentLevel.destroy();
        this.currentLevel = new RaY.Models.Level(this, this.levels[this.currentLevelId]);
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

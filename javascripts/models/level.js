(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.Level = (function(_super) {
    var createElement;

    __extends(Level, _super);

    Level.include(RaY.Engine.Modules.Callbacks);

    Level.prototype.offsetX = 0;

    Level.prototype.offsetY = 0;

    Level.prototype.height = 480;

    Level.prototype.width = 640;

    Level.prototype.resetCount = 0;

    Level.prototype.completed = false;

    Level.prototype.elements = [];

    function Level(world, name) {
      this.world = world;
      this.name = name;
      this.data = _.find(RaY.Data.Levels, function(level) {
        return level.name === name;
      });
      this.bindToEvents();
      this.buildScene();
    }

    Level.prototype.bindToEvents = function() {
      var _this = this;

      this.bind(this.world, "levelCompleted", function() {
        return _this.levelCompleted();
      });
      return this.bind(this.world, "keyUp", function(name) {
        if (name === "r") {
          return _this.resetScene();
        }
      });
    };

    Level.prototype.levelCompleted = function() {
      if (!this.completed) {
        return this.completed = true;
      }
    };

    Level.prototype.createBackground = function() {
      this.background = new RaY.Engine.Rectangle(this.world);
      this.background.fillStyle = this.data.background.fillStyle;
      this.background.width = this.data.background.width;
      this.background.height = this.data.background.height;
      return this.background;
    };

    Level.prototype.createYellowHero = function() {
      this.yellowHero = new RaY.Models.YellowHero(this.world);
      this.yellowHero.x = this.data.yellowHero.x;
      this.yellowHero.y = this.data.yellowHero.y;
      if (this.data.yellowHero.firstAnimation) {
        this.yellowHero.activateAnimation(this.data.yellowHero.firstAnimation);
      }
      return this.yellowHero;
    };

    Level.prototype.createRedHero = function() {
      this.redHero = new RaY.Models.RedHero(this.world);
      this.redHero.x = this.data.redHero.x;
      this.redHero.y = this.data.redHero.y;
      if (this.data.redHero.firstAnimation) {
        this.redHero.activateAnimation(this.data.redHero.firstAnimation);
      }
      return this.redHero;
    };

    Level.prototype.createGoal = function() {
      var goal;

      goal = new RaY.Models.Goal(this.world);
      goal.x = this.data.goal.x;
      goal.y = this.data.goal.y;
      this.elements.push(goal);
      return goal;
    };

    Level.prototype.buildScene = function() {
      var element, subelement, _i, _len, _ref, _results;

      this.createBackground();
      this.createGoal();
      this.createYellowHero();
      this.createRedHero();
      _ref = this.data.elements;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        element = _ref[_i];
        _results.push((function() {
          var _j, _len1, _ref1, _results1;

          _ref1 = element.elements;
          _results1 = [];
          for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
            subelement = _ref1[_j];
            _results1.push(this.elements.push(createElement(element.klass, [this.world].concat(subelement))));
          }
          return _results1;
        }).call(this));
      }
      return _results;
    };

    Level.prototype.destroyScene = function() {
      var element, _i, _len, _ref;

      this.redHero = this.redHero.destroy();
      this.yellowHero = this.yellowHero.destroy();
      _ref = this.elements;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        element = _ref[_i];
        element.destroy();
      }
      this.elements = [];
      return this.background = this.background.destroy();
    };

    Level.prototype.resetScene = function() {
      this.destroyScene();
      this.resetCount++;
      return this.buildScene();
    };

    Level.prototype.destroy = function() {
      this.destroyScene();
      return this.purge();
    };

    createElement = function(klass, attributes) {
      var tmpObj;

      tmpObj = Object.create(klass.prototype);
      klass.apply(tmpObj, attributes);
      return tmpObj;
    };

    return Level;

  })(RaY.Engine.Module);

}).call(this);

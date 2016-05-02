(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Models.Level = (function(superClass) {
    var createElement;

    extend(Level, superClass);

    Level.include(RaY.Engine.Modules.Callbacks);

    Level.prototype.offsetX = 0;

    Level.prototype.offsetY = 0;

    Level.prototype.height = 480;

    Level.prototype.width = 640;

    Level.prototype.completed = false;

    Level.prototype.elements = [];

    function Level(world, name1) {
      this.world = world;
      this.name = name1;
      this.data = _.find(RaY.Data.Levels, (function(_this) {
        return function(level) {
          return level.name === _this.name;
        };
      })(this));
      this.bindToEvents();
      if (this.data.gui === "hidden") {
        this.world.trigger("hideGui");
      }
      this.buildScene();
    }

    Level.prototype.bindToEvents = function() {
      this.bind(this.world, "levelCompleted", (function(_this) {
        return function() {
          return _this.levelCompleted();
        };
      })(this));
      return this.bind(this.world, "keyUp", (function(_this) {
        return function(name) {
          if (name === "r") {
            _this.resetScene();
            return _this.world.trigger("resetGui");
          }
        };
      })(this));
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
      if (this.data.goal) {
        goal = new RaY.Models.Goal(this.world);
        goal.x = this.data.goal.x;
        goal.y = this.data.goal.y;
        this.elements.push(goal);
        return goal;
      }
    };

    Level.prototype.buildScene = function() {
      var element, i, len, ref, results, subelement;
      this.createBackground();
      this.createGoal();
      this.createYellowHero();
      this.createRedHero();
      ref = this.data.elements;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        element = ref[i];
        results.push((function() {
          var j, len1, ref1, results1;
          ref1 = element.elements;
          results1 = [];
          for (j = 0, len1 = ref1.length; j < len1; j++) {
            subelement = ref1[j];
            results1.push(this.elements.push(createElement(element.klass, [this.world].concat(subelement))));
          }
          return results1;
        }).call(this));
      }
      return results;
    };

    Level.prototype.destroyScene = function() {
      var element, i, len, ref;
      this.redHero.destroy();
      this.yellowHero.destroy();
      ref = this.elements;
      for (i = 0, len = ref.length; i < len; i++) {
        element = ref[i];
        element.destroy();
      }
      this.elements = [];
      return this.background.destroy();
    };

    Level.prototype.resetScene = function() {
      this.destroyScene();
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

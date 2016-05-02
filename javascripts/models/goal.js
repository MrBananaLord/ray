(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Models.Goal = (function(superClass) {
    extend(Goal, superClass);

    Goal.prototype.collidable = false;

    Goal.prototype.gravitable = false;

    Goal.prototype.sourceWidth = 100;

    Goal.prototype.sourceHeight = 100;

    Goal.prototype.width = 30;

    Goal.prototype.height = 30;

    Goal.prototype.redHeroFinished = false;

    Goal.prototype.yellowHeroFinished = false;

    Goal.prototype.completed = false;

    function Goal(world, x, y) {
      this.world = world;
      this.x = x;
      this.y = y;
      Goal.__super__.constructor.call(this, this.world, "food");
      this.bindToEvents();
    }

    Goal.prototype.bindToEvents = function() {
      Goal.__super__.bindToEvents.apply(this, arguments);
      return this.bind(this.world, "checkCollisionsWith", (function(_this) {
        return function(element) {
          if (_this !== element && _this.collidesWith(element)) {
            return _this.manageCollisionWith(element);
          }
        };
      })(this));
    };

    Goal.prototype.render = function() {
      Goal.__super__.render.apply(this, arguments);
      if (!this.world.currentLevel.completed) {
        return this.resetGoalObjectives();
      }
    };

    Goal.prototype.manageCollisionWith = function(element) {
      if (element instanceof RaY.Models.RedHero) {
        this.redHeroFinished = true;
      }
      if (element instanceof RaY.Models.YellowHero) {
        this.yellowHeroFinished = true;
      }
      if (this.redHeroFinished && this.yellowHeroFinished && !this.completed) {
        this.completed = true;
        return this.world.trigger("levelCompleted");
      }
    };

    Goal.prototype.resetGoalObjectives = function() {
      this.yellowHeroFinished = false;
      return this.redHeroFinished = false;
    };

    return Goal;

  })(RaY.Engine.Entity);

}).call(this);

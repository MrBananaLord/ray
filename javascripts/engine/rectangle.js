(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Engine.Rectangle = (function(_super) {
    __extends(Rectangle, _super);

    Rectangle.include(RaY.Engine.Modules.Callbacks);

    Rectangle.prototype.width = 0;

    Rectangle.prototype.height = 0;

    Rectangle.prototype.x = 0;

    Rectangle.prototype.y = 0;

    Rectangle.prototype.collidable = false;

    Rectangle.prototype.gravitable = false;

    Rectangle.prototype.fillStyle = "#000";

    Rectangle.prototype.speed = 0;

    Rectangle.prototype.previousX = 0;

    Rectangle.prototype.previousY = 0;

    Rectangle.prototype.maximumSpeed = 8;

    Rectangle.prototype.fallingCounter = 0;

    Rectangle.prototype.falling = false;

    Rectangle.prototype.hidden = false;

    function Rectangle(world, options) {
      var option, _i, _len, _ref;

      this.world = world;
      if (options == null) {
        options = {};
      }
      this.collidesWith = __bind(this.collidesWith, this);
      this.setPosition = __bind(this.setPosition, this);
      this.applyPhysics = __bind(this.applyPhysics, this);
      _ref = ['x', 'y', 'width', 'height', 'fillStyle', 'hidden'];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        option = _ref[_i];
        this[option] = options[option] || this[option];
      }
      this.bindToEvents();
      Rectangle.__super__.constructor.apply(this, arguments);
    }

    Rectangle.prototype.bindToEvents = function() {
      var _this = this;

      this.bind(this.world, "update", function() {
        _this.update();
        return _this.rememberPosition();
      });
      this.bind(this.world, "render", function() {
        return _this.render();
      });
      this.bind(this.world, "collision", function(object, element) {
        if (object === _this) {
          return _this.manageCollisionWith(element);
        }
      });
      return this.bind(this.world, "checkCollisionsWith", function(element) {
        if (_this !== element && _this.collidable) {
          return element.checkAndTriggerCollisionsWith(_this);
        }
      });
    };

    Rectangle.prototype.rememberPosition = function() {
      this.previousX = this.x;
      return this.previousY = this.y;
    };

    Rectangle.prototype.render = function() {
      if (!this.hidden) {
        this.world.context.fillStyle = this.fillStyle;
        return this.world.context.fillRect(this.x, this.y, this.width, this.height);
      }
    };

    Rectangle.prototype.update = function() {
      return this.applyPhysics();
    };

    Rectangle.prototype.applyPhysics = function() {
      if (this.gravitable) {
        this.applyGravity();
      }
      return this.world.trigger("checkCollisionsWith", this);
    };

    Rectangle.prototype.applyGravity = function() {
      return this.fall();
    };

    Rectangle.prototype.applyForce = function(x, y) {
      if (this.gravitable) {
        return this.setPosition(this.x + x, this.y + y);
      }
    };

    Rectangle.prototype.setPosition = function(x, y) {
      this.x = x;
      return this.y = y;
    };

    Rectangle.prototype.bottom = function() {
      return this.y + this.height;
    };

    Rectangle.prototype.top = function() {
      return this.y;
    };

    Rectangle.prototype.left = function() {
      return this.x;
    };

    Rectangle.prototype.right = function() {
      return this.x + this.width;
    };

    Rectangle.prototype.movementVector = function() {
      return [this.x - this.previousX, this.y - this.previousY];
    };

    Rectangle.prototype.debug = function() {
      return console.debug(this.left(), this.top());
    };

    Rectangle.prototype.checkAndTriggerCollisionsWith = function(element) {
      if (this.collidesWith(element)) {
        return this.world.trigger("collision", this, element);
      }
    };

    Rectangle.prototype.collidesWith = function(element) {
      return !((element.bottom() < this.top()) || (element.top() > this.bottom()) || (element.left() > this.right()) || (element.right() < this.left()));
    };

    Rectangle.prototype.manageCollisionWith = function(element) {
      if (this.gravitable) {
        return this.manageSideCollision(element);
      }
    };

    Rectangle.prototype.manageSideCollision = function(element) {
      if (this.left() <= element.right() && this.x < this.previousX && element.right() <= this.previousX && !this.xAxisAdjacentWith(element)) {
        this.leftSideCollisionWith(element);
      }
      if (this.right() >= element.left() && this.x > this.previousX && element.left() - this.width >= this.previousX && !this.xAxisAdjacentWith(element)) {
        this.rightSideCollisionWith(element);
      }
      if (this.top() <= element.bottom() && this.y < this.previousY && element.bottom() <= this.previousY && !this.yAxisAdjacentWith(element)) {
        this.topSideCollisionWith(element);
      }
      if (this.bottom() >= element.top() && this.y > this.previousY && element.top() - this.height >= this.previousY && !this.yAxisAdjacentWith(element)) {
        return this.bottomSideCollisionWith(element);
      }
    };

    Rectangle.prototype.bottomAdjacentWith = function(element) {
      return this.bottom() === element.top() || this.bottom() - this.world.gravity === element.top();
    };

    Rectangle.prototype.topAdjacentWith = function(element) {
      return this.top() === element.bottom();
    };

    Rectangle.prototype.leftAdjacentWith = function(element) {
      return this.left() === element.right();
    };

    Rectangle.prototype.rightAdjacentWith = function(element) {
      return this.right() === element.left();
    };

    Rectangle.prototype.xAxisAdjacentWith = function(element) {
      return this.bottomAdjacentWith(element) || this.topAdjacentWith(element);
    };

    Rectangle.prototype.yAxisAdjacentWith = function(element) {
      return this.leftAdjacentWith(element) || this.rightAdjacentWith(element);
    };

    Rectangle.prototype.leftSideCollisionWith = function(element) {
      return this.setPosition(element.right(), this.y);
    };

    Rectangle.prototype.rightSideCollisionWith = function(element) {
      return this.setPosition(element.left() - this.width, this.y);
    };

    Rectangle.prototype.topSideCollisionWith = function(element) {
      return this.setPosition(this.x, element.bottom());
    };

    Rectangle.prototype.bottomSideCollisionWith = function(element) {
      this.setPosition(this.x, element.top() - this.height);
      return this.endFalling();
    };

    Rectangle.prototype.fall = function() {
      this.y += this.fallingCounter * this.world.gravity;
      if (!(this.fallingCounter >= this.maximumSpeed)) {
        return this.fallingCounter += 1;
      }
    };

    Rectangle.prototype.startFalling = function() {
      this.falling = true;
      return this.fallingCounter = 0;
    };

    Rectangle.prototype.endFalling = function() {
      this.falling = false;
      return this.fallingCounter = 0;
    };

    Rectangle.prototype.hide = function() {
      return this.hidden = true;
    };

    Rectangle.prototype.show = function() {
      return this.hidden = false;
    };

    return Rectangle;

  })(RaY.Engine.Module);

}).call(this);

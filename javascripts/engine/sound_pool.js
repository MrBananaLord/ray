(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Engine.SoundPool = (function(_super) {
    __extends(SoundPool, _super);

    SoundPool.prototype.counter = 0;

    SoundPool.prototype.pool = {};

    SoundPool.prototype.ready = false;

    function SoundPool(filePath, size) {
      var _this = this;

      this.size = size != null ? size : 5;
      this.isReady = __bind(this.isReady, this);
      this.play = __bind(this.play, this);
      this.currentSound = __bind(this.currentSound, this);
      _(this.size).times(function(i) {
        var audio;

        audio = new Audio(filePath);
        audio.load();
        return _this.pool[i] = audio;
      });
      this.name = _.first(_.last(filePath.split("/")).split("."));
    }

    SoundPool.prototype.currentSound = function() {
      return this.pool[this.counter];
    };

    SoundPool.prototype.play = function() {
      if (this.currentSound().currentTime === 0 || this.currentSound().ended) {
        this.currentSound().play();
      }
      return this.counter = (this.counter + 1) % this.size;
    };

    SoundPool.prototype.isReady = function() {
      var audio, _i, _len, _ref;

      if (this.ready) {
        return this.ready;
      }
      this.ready = true;
      _ref = this.pool;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        audio = _ref[_i];
        this.ready = this.ready && audio.readyState;
      }
      return this.ready;
    };

    return SoundPool;

  })(RaY.Engine.Module);

}).call(this);

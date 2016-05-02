(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Engine.SoundPool = (function(superClass) {
    extend(SoundPool, superClass);

    SoundPool.prototype.counter = 0;

    SoundPool.prototype.pool = {};

    SoundPool.prototype.ready = false;

    function SoundPool(filePath, size) {
      this.size = size != null ? size : 5;
      this.isReady = bind(this.isReady, this);
      this.play = bind(this.play, this);
      this.currentSound = bind(this.currentSound, this);
      _(this.size).times((function(_this) {
        return function(i) {
          var audio;
          audio = new Audio(filePath);
          audio.load();
          return _this.pool[i] = audio;
        };
      })(this));
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
      var audio, j, len, ref;
      if (this.ready) {
        return this.ready;
      }
      this.ready = true;
      ref = this.pool;
      for (j = 0, len = ref.length; j < len; j++) {
        audio = ref[j];
        this.ready = this.ready && audio.readyState;
      }
      return this.ready;
    };

    return SoundPool;

  })(RaY.Engine.Module);

}).call(this);

(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Engine.SoundRepository = (function(_super) {
    __extends(SoundRepository, _super);

    SoundRepository.prototype.sounds = [];

    SoundRepository.prototype.ready = false;

    function SoundRepository() {
      this.find = __bind(this.find, this);
      this.isReady = __bind(this.isReady, this);
      var file, _i, _len, _ref;

      _ref = RaY.Data.Sounds;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        file = _ref[_i];
        this.sounds.push(new RaY.Engine.SoundPool(file.name, file.poolSize));
      }
    }

    SoundRepository.prototype.isReady = function() {
      var sound, _i, _len, _ref;

      if (this.ready) {
        return this.ready;
      }
      this.ready = true;
      _ref = this.sounds;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        sound = _ref[_i];
        this.ready = this.ready && sound.isReady();
      }
      return this.ready;
    };

    SoundRepository.prototype.find = function(name) {
      return _.findWhere(this.sounds, {
        name: name
      }) || _.first(this.sounds);
    };

    return SoundRepository;

  })(RaY.Engine.Module);

}).call(this);

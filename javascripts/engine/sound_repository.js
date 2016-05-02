(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Engine.SoundRepository = (function(superClass) {
    extend(SoundRepository, superClass);

    SoundRepository.prototype.sounds = [];

    SoundRepository.prototype.ready = false;

    function SoundRepository() {
      this.find = bind(this.find, this);
      this.isReady = bind(this.isReady, this);
      var file, i, len, ref;
      ref = RaY.Data.Sounds;
      for (i = 0, len = ref.length; i < len; i++) {
        file = ref[i];
        this.sounds.push(new RaY.Engine.SoundPool(file.name, file.poolSize));
      }
    }

    SoundRepository.prototype.isReady = function() {
      var i, len, ref, sound;
      if (this.ready) {
        return this.ready;
      }
      this.ready = true;
      ref = this.sounds;
      for (i = 0, len = ref.length; i < len; i++) {
        sound = ref[i];
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

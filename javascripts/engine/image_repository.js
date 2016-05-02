(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Engine.ImageRepository = (function(superClass) {
    extend(ImageRepository, superClass);

    ImageRepository.prototype.images = [];

    ImageRepository.prototype.ready = false;

    function ImageRepository() {
      this.find = bind(this.find, this);
      this.isReady = bind(this.isReady, this);
      var file, i, len, ref;
      ref = RaY.Data.Images;
      for (i = 0, len = ref.length; i < len; i++) {
        file = ref[i];
        this.images.push(new RaY.Engine.SpriteImage(file));
      }
    }

    ImageRepository.prototype.isReady = function() {
      var i, image, len, ref;
      if (this.ready) {
        return this.ready;
      }
      this.ready = true;
      ref = this.images;
      for (i = 0, len = ref.length; i < len; i++) {
        image = ref[i];
        this.ready = this.ready && image.isReady();
      }
      return this.ready;
    };

    ImageRepository.prototype.find = function(name) {
      return _.findWhere(this.images, {
        name: name
      }) || _.first(this.images);
    };

    return ImageRepository;

  })(RaY.Engine.Module);

}).call(this);

(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Engine.ImageRepository = (function(_super) {
    __extends(ImageRepository, _super);

    ImageRepository.prototype.images = [];

    ImageRepository.prototype.ready = false;

    function ImageRepository() {
      this.find = __bind(this.find, this);
      this.isReady = __bind(this.isReady, this);
      var file, _i, _len, _ref;

      _ref = RaY.Data.Images;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        file = _ref[_i];
        this.images.push(new RaY.Engine.SpriteImage(file));
      }
    }

    ImageRepository.prototype.isReady = function() {
      var image, _i, _len, _ref;

      if (this.ready) {
        return this.ready;
      }
      this.ready = true;
      _ref = this.images;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        image = _ref[_i];
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

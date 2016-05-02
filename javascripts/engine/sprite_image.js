(function() {
  RaY.Engine.SpriteImage = (function() {
    SpriteImage.prototype.ready = false;

    function SpriteImage(url) {
      var image;
      this.url = url;
      image = new Image;
      image.src = this.url;
      image.onload = (function(_this) {
        return function() {
          return _this.ready = true;
        };
      })(this);
      this.image = image;
      this.name = _.first(_.last(this.url.split("/")).split("."));
    }

    SpriteImage.prototype.isReady = function() {
      return this.ready;
    };

    return SpriteImage;

  })();

}).call(this);

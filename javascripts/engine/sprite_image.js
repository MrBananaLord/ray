(function() {
  RaY.Engine.SpriteImage = (function() {
    SpriteImage.prototype.ready = false;

    function SpriteImage(url) {
      var image,
        _this = this;

      this.url = url;
      image = new Image;
      image.src = this.url;
      image.onload = function() {
        return _this.ready = true;
      };
      this.image = image;
    }

    return SpriteImage;

  })();

}).call(this);

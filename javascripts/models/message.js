(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Models.Message = (function(superClass) {
    extend(Message, superClass);

    Message.prototype.collidable = false;

    Message.prototype.gravitable = false;

    Message.prototype.fillStyle = "#fff";

    Message.prototype.textFillStyle = "#000";

    Message.prototype.font = "12pt Calibri";

    Message.prototype.width = 640;

    Message.prototype.height = 480;

    Message.prototype.x = 10;

    Message.prototype.y = 10;

    Message.prototype.contentX = 0;

    Message.prototype.contentY = 0;

    function Message(world, content, options) {
      var i, len, option, ref;
      this.world = world;
      this.content = content;
      if (options == null) {
        options = {};
      }
      ref = ['x', 'y', 'width', 'height', 'fillStyle', 'font', 'fillText', 'contentX', 'contentY', 'textFillStyle'];
      for (i = 0, len = ref.length; i < len; i++) {
        option = ref[i];
        this[option] = options[option] || this[option];
      }
      Message.__super__.constructor.call(this, this.world);
    }

    Message.prototype.render = function() {
      Message.__super__.render.apply(this, arguments);
      this.world.context.font = this.font;
      this.world.context.fillStyle = this.textFillStyle;
      return this.world.context.fillText(this.content, this.x + this.contentX, this.y + this.contentY);
    };

    return Message;

  })(RaY.Engine.Rectangle);

}).call(this);

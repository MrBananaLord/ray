(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.Message = (function(_super) {
    __extends(Message, _super);

    Message.prototype.collidable = false;

    Message.prototype.gravitable = false;

    Message.prototype.fillStyle = "#fff";

    Message.prototype.textFillStyle = "#000";

    Message.prototype.font = "12pt Calibri";

    Message.prototype.width = 640;

    Message.prototype.height = 480;

    Message.prototype.x = 10;

    Message.prototype.y = 10;

    Message.prototype.contentX = 10;

    Message.prototype.contentY = 10;

    function Message(world, content, options) {
      var option, _i, _len, _ref;

      this.world = world;
      this.content = content;
      if (options == null) {
        options = {};
      }
      _ref = ['x', 'y', 'width', 'height', 'fillStyle', 'font', 'fillText', 'contentX', 'contentY', 'textFillStyle'];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        option = _ref[_i];
        this[option] = options[option] || this[option];
      }
      Message.__super__.constructor.call(this, this.world);
    }

    Message.prototype.render = function() {
      Message.__super__.render.apply(this, arguments);
      this.world.context.font = this.font;
      this.world.context.fillStyle = this.textFillStyle;
      return this.world.context.fillText(this.content, this.contentX, this.contentY);
    };

    return Message;

  })(RaY.Engine.Rectangle);

}).call(this);

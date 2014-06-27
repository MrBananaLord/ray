(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Models.Message = (function(_super) {
    __extends(Message, _super);

    Message.prototype.collidable = false;

    Message.prototype.gravitable = false;

    Message.prototype.fillStyle = "#111";

    Message.prototype.width = 640;

    Message.prototype.height = 480;

    Message.prototype.x = 0;

    Message.prototype.y = 0;

    function Message(world) {
      this.world = world;
      Message.__super__.constructor.call(this, this.world);
    }

    Message.prototype.render = function() {
      Message.__super__.render.apply(this, arguments);
      this.world.context.font = "40pt Calibri";
      this.world.context.fillStyle = "#fff";
      return this.world.context.fillText("The End", 230, 250);
    };

    return Message;

  })(RaY.Engine.Rectangle);

}).call(this);

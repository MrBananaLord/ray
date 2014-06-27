(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  RaY.Engine.Entity = (function(_super) {
    __extends(Entity, _super);

    function Entity() {
      _ref = Entity.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Entity.prototype.render = function() {
      return this.drawImage(this.sourceX, this.sourceY, this.x, this.y);
    };

    return Entity;

  })(RaY.Engine.Sprite);

}).call(this);

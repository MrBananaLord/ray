(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  RaY.Engine.Entity = (function(superClass) {
    extend(Entity, superClass);

    function Entity() {
      return Entity.__super__.constructor.apply(this, arguments);
    }

    Entity.prototype.render = function() {
      return this.drawImage(this.sourceX, this.sourceY, this.x, this.y);
    };

    return Entity;

  })(RaY.Engine.Sprite);

}).call(this);

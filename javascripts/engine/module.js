(function() {
  var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  RaY.Engine.Module = (function() {
    var keywords, __id;

    keywords = ['extended', 'included'];

    __id = 0;

    function Module() {}

    Module.extend = function(obj) {
      var key, value, _ref;

      for (key in obj) {
        value = obj[key];
        if (__indexOf.call(keywords, key) < 0) {
          this[key] = value;
        }
      }
      if ((_ref = obj.extended) != null) {
        _ref.apply(this);
      }
      return this;
    };

    Module.include = function(obj) {
      var key, value, _ref;

      for (key in obj) {
        value = obj[key];
        if (__indexOf.call(keywords, key) < 0) {
          this.prototype[key] = value;
        }
      }
      if ((_ref = obj.included) != null) {
        _ref.apply(this);
      }
      return this;
    };

    Module.prototype.id = function() {
      if (this._id) {
        return this._id;
      }
      __id += 1;
      return this._id = __id;
    };

    return Module;

  })();

}).call(this);

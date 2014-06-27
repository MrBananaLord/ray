(function() {
  var __slice = [].slice;

  RaY.Engine.Modules.Callbacks = {
    events: {},
    bind: function(context, topic, handler) {
      var _base;

      return ((_base = this.events)[topic] || (_base[topic] = [])).push({
        handler: handler,
        context: context,
        id: this.id()
      });
    },
    trigger: function() {
      var args, event, topic, _i, _len, _ref, _results;

      topic = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      if (this.events[topic] != null) {
        _ref = this.events[topic];
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          event = _ref[_i];
          _results.push(event.handler.apply(event.context, args));
        }
        return _results;
      }
    },
    purge: function() {
      var topic, _i, _len, _ref,
        _this = this;

      _ref = _.keys(this.events);
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        topic = _ref[_i];
        this.events[topic] = this.events[topic].filter(function(event) {
          return event.id !== _this.id();
        });
      }
      return null;
    },
    destroy: function() {
      return this.purge();
    }
  };

}).call(this);

(function() {
  var slice = [].slice;

  RaY.Engine.Modules.Callbacks = {
    events: {},
    bind: function(context, topic, handler) {
      var base;
      return ((base = this.events)[topic] || (base[topic] = [])).push({
        handler: handler,
        context: context,
        id: this.id()
      });
    },
    trigger: function() {
      var args, event, i, len, ref, results, topic;
      topic = arguments[0], args = 2 <= arguments.length ? slice.call(arguments, 1) : [];
      if (this.events[topic] != null) {
        ref = this.events[topic];
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          event = ref[i];
          results.push(event.handler.apply(event.context, args));
        }
        return results;
      }
    },
    purge: function() {
      var i, len, ref, topic;
      ref = _.keys(this.events);
      for (i = 0, len = ref.length; i < len; i++) {
        topic = ref[i];
        this.events[topic] = this.events[topic].filter((function(_this) {
          return function(event) {
            return event.id !== _this.id();
          };
        })(this));
      }
      return null;
    },
    destroy: function() {
      return this.purge();
    }
  };

}).call(this);

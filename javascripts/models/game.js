(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  RaY.Models.Game = (function() {
    function Game() {
      this.main = __bind(this.main, this);
      this.animate = __bind(this.animate, this);
    }

    Game.prototype.run = function() {
      this.setup();
      return this.animate();
    };

    Game.prototype.setup = function() {
      this.world = new RaY.Models.World;
      return this.inputHandler = new RaY.Engine.InputHandler(this.world);
    };

    Game.prototype.animate = function() {
      requestAnimationFrame(this.animate);
      return this.main();
    };

    Game.prototype.main = function() {
      this.update();
      return this.render();
    };

    Game.prototype.update = function() {
      this.inputHandler.update();
      return this.world.update();
    };

    Game.prototype.render = function() {
      return this.world.render();
    };

    return Game;

  })();

}).call(this);

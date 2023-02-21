(window._gsQueue || (window._gsQueue = [])).push(function () {
  _gsDefine(
    "plugins.ScrollToPlugin",
    ["plugins.TweenPlugin"],
    function (t) {
      var o = function (o, s) {
          t.call(this, "scrollTo"), this._overwriteProps.pop();
        },
        s = (o.prototype = new t("scrollTo")),
        e = function () {
          return null != window.pageXOffset
            ? window.pageXOffset
            : null != document.documentElement.scrollLeft
            ? document.documentElement.scrollLeft
            : document.body.scrollLeft;
        },
        i = function () {
          return null != window.pageYOffset
            ? window.pageYOffset
            : null != document.documentElement.scrollTop
            ? document.documentElement.scrollTop
            : document.body.scrollTop;
        },
        l = t.prototype.setRatio;
      return (
        (s.constructor = o),
        (o.API = 2),
        (s._onInitTween = function (t, o, s) {
          return (
            (this._wdw = t == window),
            (this._target = t),
            "object" != typeof o && (o = { y: Number(o) }),
            (this.x = this._wdw ? e() : t.scrollLeft),
            (this.y = this._wdw ? i() : t.scrollTop),
            null != o.x
              ? this._addTween(this, "x", this.x, o.x, "scrollTo_x", !0)
              : (this.skipX = !0),
            null != o.y
              ? this._addTween(this, "y", this.y, o.y, "scrollTo_y", !0)
              : (this.skipY = !0),
            !0
          );
        }),
        (s._kill = function (o) {
          return (
            o.scrollTo_x && (this.skipX = !0),
            o.scrollTo_x && (this.skipY = !0),
            t.prototype._kill.call(this, o)
          );
        }),
        (s.setRatio = function (t) {
          l.call(this, t),
            this._wdw
              ? window.scrollTo(
                  this.skipX ? e() : this.x,
                  this.skipY ? i() : this.y
                )
              : (this.skipY || (this._target.scrollTop = this.y),
                this.skipX || (this._target.scrollLeft = this.x));
        }),
        t.activate([o]),
        o
      );
    },
    !0
  );
}),
  window._gsDefine && _gsQueue.pop()();

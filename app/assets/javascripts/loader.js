NTC.Loader = {
  loadHoods: function(hoods) {
    var paths =_(hoods).map(function(hood) { return this.pathFromSlug(hood) }, this);
    var all = this.getAll(paths);
    var dfd = $.Deferred();

    $.when.apply($, all).done(function() {
      var retrieved = _(arguments).map(function(arg) { return arg[0] });
      dfd.resolve(retrieved);
    });

    return dfd;
  },

  getAll: function(paths) {
    return _(paths).map(function(path) {
      return $.getJSON(path);
    }, this);
  },

  pathFromSlug: function(slug) {
    return "/static/neighborhoods/" + slug + ".json";
  }
};

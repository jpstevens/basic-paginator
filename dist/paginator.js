(function() {
  var Paginator;

  Paginator = (function() {
    function Paginator(content, itemsPerPage) {
      this.content = content;
      this.itemsPerPage = itemsPerPage;
      this;
    }

    Paginator.prototype.getTotalPages = function() {
      return parseInt(Math.ceil(this.content.length / this.itemsPerPage));
    };

    Paginator.prototype.page = function(page) {
      var end, i, pageContent, start, totalPages, _i;
      totalPages = this.getTotalPages();
      if (page <= totalPages && page >= 1) {
        pageContent = [];
        start = (page - 1) * this.itemsPerPage;
        end = Math.min(start + this.itemsPerPage, this.content.length) - 1;
        for (i = _i = start; start <= end ? _i <= end : _i >= end; i = start <= end ? ++_i : --_i) {
          pageContent.push(this.content[i]);
        }
        return pageContent;
      }
      return [];
    };

    return Paginator;

  })();

  module.exports = Paginator;

}).call(this);

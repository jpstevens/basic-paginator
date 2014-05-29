class Paginator

  constructor: (@content, @itemsPerPage) -> @

  getTotalPages: -> parseInt Math.ceil ( @content.length / @itemsPerPage )

  page: (page) ->
    totalPages = @getTotalPages()
    if page <= totalPages and page >= 1
      pageContent = []
      start = ((page-1) * @itemsPerPage)
      end = Math.min((start + @itemsPerPage), @content.length) - 1
      pageContent.push @content[i] for i in [start..end]
      return pageContent
    []

module.exports = Paginator
Paginator = require "../src/paginator"

describe "paginator", ->

  content = [ "a", "b", "c", "d", "e", "f", "g" ]
  itemsPerPage = 3
  paginator = null

  describe "#constructor", ->

    it "takes two arguments: content, maximum items per page", ->
      
      paginator = new Paginator content, itemsPerPage
      expect(paginator.content).toEqual content
      expect(paginator.itemsPerPage).toEqual itemsPerPage

  describe "#getTotalPages", ->

    beforeEach -> paginator = new Paginator content, itemsPerPage
    afterEach -> paginator = null

    it "returns the correct number of pages", ->
      cases = [
        { max: 1, expected: 7 }
        { max: 2, expected: 4 }
        { max: 3, expected: 3 }
        { max: 4, expected: 2 }
        { max: 7, expected: 1 }
        { max: 8, expected: 1 }
      ]
      for _case in cases
        paginator.itemsPerPage = _case.max
        expect(paginator.getTotalPages()).toBe _case.expected
  
  describe "#page", ->

    beforeEach -> paginator = new Paginator content, itemsPerPage
    afterEach -> paginator = null

    it "it returns an empty array if the current page exceeds the actual number of pages", ->
      expect(paginator.page(4)).toEqual []

    it "it returns an empty array if the current page is less than 1", ->
      expect(paginator.page(0)).toEqual []

    describe "if the current page is not the last page", ->
      
      it "returns a slice of the array with length equal to the maximum items per page", ->
        expect(paginator.page(1).length).toBe 3
        expect(paginator.page(2).length).toBe 3

      it "returns the correct slice", ->
        expect(paginator.page 1).toEqual ["a","b","c"]
        expect(paginator.page 2).toEqual ["d","e","f"]

    describe "if the current page is the last page", ->

      it "returns a slice of the array with length equal to the maximum items per page", ->
        expect(paginator.page(3).length).toEqual 1

      it "returns the correct slice", ->
        expect(paginator.page 3).toEqual ["g"]
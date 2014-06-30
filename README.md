# Basic Paginator

[![Build Status](https://secure.travis-ci.org/jpstevens/basic-paginator.png?branch=master)](https://travis-ci.org/jpstevens/basic-paginator)

Usage:
```javascript
var Paginator = require("basic-paginator"),
    content = ["a","b","c","d"],
    itemsPerPage = 3;

var paginator = new Paginator(content, itemsPerPage);

// get the first page
paginator.page(1);
// returns ["a","b","c"]

// get the second page
paginator.page(2);
// returns ["d"]

// get a page that doesn't exist
paginator.page(3);
// returns []
```

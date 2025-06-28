#!/usr/bin/env sh

var buttons = document.querySelectorAll('.offer-cta[title="Add to Card"][type="button"]');
var delay = 3000;

for (var i = 0; i < buttons.length; i++) {
  (function(index) {
    setTimeout(function() {
      buttons[index].click();
    }, delay * index);
  })(i);
}

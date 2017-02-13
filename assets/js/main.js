var $ = require('jquery');
var Ladda = require('ladda');
var Retina = require('retina.js').Retina;

$(document).ready(function() {
  Ladda.stopAll();
  Retina.init(window);
});

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require chosen-jquery

//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .


$(document).ready(function() {

    $(window).keypress(function(event) {
      if ($("#search-bar").val().length > 1) {
        if (event.which == 13) {
          event.preventDefault();
          $("form#search-wrapper").submit();
        }
      }
    });

    $('.food-search').click(function() {
        $('#search-wrapper').toggleClass('moved');
    })

    $('#search-bar').click(function(event){
      event.stopPropagation();
    });
});

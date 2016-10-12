// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  $('#profile a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
  })

  $('#add_menu_item a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
  })

  $('#profile a[href="#profile"]').tab('show') // Select tab by name
  $('#add_menu_item a[href="#add_menu_item"]').tab('show') // Select tab by name
  $('#profile a:first').tab('show') // Select first tab
  $('#add_menu_item a:last').tab('show') // Select last tab

  $("#btn-map").click(function(event){
    $("#map").toggle(1000);
  });

});

$(document).ready(function() {
  $("#add-maps").click(function(){
    $("#map").append("<%= j(render('maps', {u: u})) %>");
  });
})

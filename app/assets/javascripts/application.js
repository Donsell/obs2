// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
// require.jquery.ui
// require jquery.ui.autocomplete
// require jquery_ujs
// require jquery_turbolinks
// require jquery-ui.datepicker
// require bootstrap
// require cocoon
// require moment
// require bootstrap-datetimepicker
// require pickers
//= require jquery.dataTables
// require datatables/jquery.dataTables
//= require underscore
//= require foundation
// require turbolinks
//= require_tree .


$(function() {
  $(document).foundation();
});

//$(document).on("page:load ready", function(){
//    $("input.datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
//});

//$(function(){ $(document).foundation(); });


$('#myTabs').on('toggled', function (event, tab) {
  console.log(tab);
});


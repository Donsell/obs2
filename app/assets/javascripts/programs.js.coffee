# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#myTabs').bind 'click', (event, tab) ->
  console.log tab;
 


#jQuery ->
#	$('#programs').dataTable()
#		 bJQueryUI: true


$(document).ready ->
 $('table.display').dataTable();
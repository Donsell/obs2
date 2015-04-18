# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#jQuery ->
 $('#observation_catalog_name').autocomplete
 	source: $('#observation_catalog_name').val('NGC').data('autocomplete-source')


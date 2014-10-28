# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
# Import the underscore and gmaps javascript source code.
#
#= require underscore
#= require gmaps/google

@googleMap = (content) ->
  handler = Gmaps.build("Google")
  handler.buildMap
    provider: {}
    internal:
      id: "map"
  , ->
    markers = handler.addMarkers(content)
    handler.bounds.extendWith markers
    handler.fitMapToBounds()

content = [
  {lat:22.2626188, lng: 114.1301186,infowindow: "hello!", link: 'a'},
  {lat:22.3907897, lng: 114.2022941,infowindow: "hello!", link:'b'}
]

$ ->
  $.ajax
    url: '/places.json'
  .done (data) ->
    googleMap content
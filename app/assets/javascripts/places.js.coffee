# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
# Import the underscore and gmaps javascript source code.
#
#= require underscore
#= require gmaps/google

$ ->
  directionsDisplay = new google.maps.DirectionsRenderer()
  directionsService = new google.maps.DirectionsService()


  @convert = (objects) ->
    array = []

    for x in objects
      pin =
        lat: x.lat
        lng: x.lng
        infowindow: x.name
      array.push pin

    # googleMap array


  calcRoute = (ori, dest) ->
    origin = new google.maps.LatLng(41.850033, -87.6500523)
    destination = new google.maps.LatLng(42.850033, -85.6500523)
    request =
      origin: origin
      destination: destination
      travelMode: google.maps.TravelMode.BICYCLING

    directionsService.route request, (response, status) ->
      if status is google.maps.DirectionsStatus.OK
        directionsDisplay.setDirections response
      return

    return


  # $.ajax
  #   url: '/places.json'
  # .done (data) ->
  #   convert data
  
  calcRoute()
  
  handler = Gmaps.build('Google')
  handler.buildMap
    internal:
      id: 'bikemap'
    , ->
      directionsDisplay.setMap handler.getMap()


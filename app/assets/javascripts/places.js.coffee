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


  # @convert = (objects) ->
  #   array = []

  #   for x in objects
  #     pin =
  #       lat: x.lat
  #       lng: x.lng
  #       infowindow: x.name
  #     array.push pin

    # googleMap array
 
  calcRoute = (start, end) ->

    start = {lat: 22.266203, lng: 114.178266}
    end = {lat: 22.2626188, lng: 114.1301186}

    origin = new google.maps.LatLng start.lat, end.lng
    destination = new google.maps.LatLng start.lat, end.lng
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


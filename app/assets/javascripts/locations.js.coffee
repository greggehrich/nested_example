# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  if $('#map').length > 0

    map = new GMaps({
      div: '#map',
      lat: $('#map').data('latitude'),
      lng: $('#map').data('longitude'),
      panControl: false,
      zoomControl: false,
      streetViewControl: false,
      mapTypeControl: false,
      width: '100%',
      height: '200px'
    });

    map.addMarker({
      lat: $('#map').data('latitude'),
      lng: $('#map').data('longitude'),
      title: 'Arcade'
    });

  $('#location-form-clear').click ->
    $("#new_location").trigger('reset');

  $('#add-status').click ->

    $('#add-status').html('Identifying Location...')

    unless navigator.geolocation then alert "Your browser does not support geolocation."

    # if success getting the location
    success = (position) ->
      latitude  = position.coords.latitude
      longitude = position.coords.longitude

      print_address(latitude, longitude)

    # if error getting the location
    error = ->
      $('#add-status').html("We were unable to determine your location.")

    print_address = (latitude, longitude) ->

      geocoder = new google.maps.Geocoder
   
      yourLocation = new google.maps.LatLng(latitude, longitude)
   
      geocoder.geocode(
        'latLng': yourLocation,
        (results, status) =>
          if status is google.maps.GeocoderStatus.OK
            if results[0]
              $('#add-status-message').html("We've approximated your current position using geolocation. If you would like to clear the form, press the Clear button at the bottom of page.")
              $('#add-status').html('Identify Location')

              street_number = results[0].address_components[0].long_name
              street_name = results[0].address_components[1].long_name
              city = results[0].address_components[3].long_name
              zip = results[0].address_components[7].long_name
              state = results[0].address_components[5].long_name

              $('#location-street').val(street_number + " " + street_name)
              $('#location-city').val(city)
              $("#location-state option:contains(#{state})").prop('selected', true).change()
              $('#location-zip').val(zip)
            else
              $('#add-status-message').html('We could not identify your current location. Sorry!')
              $('#add-status').html('Identify Location')

          else
            $('#add-status-message').html('We could not identify your current location. Sorry!')
            $('#add-status').html('Identify Location')

      )
    navigator.geolocation.getCurrentPosition(success, error)

$(document).ready(ready)
$(document).on('pageinit', ready)

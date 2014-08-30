ready = ->

  if $('#welcome-map').length > 0

    map = new GMaps({
      div: '#welcome-map',
      lat: $('#welcome-map').data('latitude'),
      lng: $('#welcome-map').data('longitude'),
      panControl: false,
      zoomControl: false,
      streetViewControl: false,
      mapTypeControl: false,
      width: '100%',
      height: '300px'
    });

    map.addMarker({
      lat: $('#welcome-map').data('latitude'),
      lng: $('#welcome-map').data('longitude'),
      title: 'Arcade'
    });

$(document).ready(ready)
$(document).on('pageinit', ready)
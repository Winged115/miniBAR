var map;

function initMap() {

    map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 41.876, lng: -87.653},
    zoom: 16,
    styles: [
      {elementType: 'geometry', stylers: [{color: '#242f3e'}]},
      {elementType: 'labels.text.stroke', stylers: [{color: '#242f3e'}]},
      {elementType: 'labels.text.fill', stylers: [{color: '#746855'}]},
      {
        featureType: 'administrative.locality',
        elementType: 'labels.text.fill',
        stylers: [{color: '#d59563'}]
      },
      {
        featureType: 'poi',
        elementType: 'labels.text.fill',
        stylers: [{color: '#d59563'}]
      },
      {
        featureType: 'poi.park',
        elementType: 'geometry',
        stylers: [{color: '#263c3f'}]
      },
      {
        featureType: 'poi.park',
        elementType: 'labels.text.fill',
        stylers: [{color: '#6b9a76'}]
      },
      {
        featureType: 'road',
        elementType: 'geometry',
        stylers: [{color: '#38414e'}]
      },
      {
        featureType: 'road',
        elementType: 'geometry.stroke',
        stylers: [{color: '#212a37'}]
      },
      {
        featureType: 'road',
        elementType: 'labels.text.fill',
        stylers: [{color: '#9ca5b3'}]
      },
      {
        featureType: 'road.highway',
        elementType: 'geometry',
        stylers: [{color: '#746855'}]
      },
      {
        featureType: 'road.highway',
        elementType: 'geometry.stroke',
        stylers: [{color: '#1f2835'}]
      },
      {
        featureType: 'road.highway',
        elementType: 'labels.text.fill',
        stylers: [{color: '#f3d19c'}]
      },
      {
        featureType: 'transit',
        elementType: 'geometry',
        stylers: [{color: '#2f3948'}]
      },
      {
        featureType: 'transit.station',
        elementType: 'labels.text.fill',
        stylers: [{color: '#d59563'}]
      },
      {
        featureType: 'water',
        elementType: 'geometry',
        stylers: [{color: '#17263c'}]
      },
      {
        featureType: 'water',
        elementType: 'labels.text.fill',
        stylers: [{color: '#515c6d'}]
      },
      {
        featureType: 'water',
        elementType: 'labels.text.stroke',
        stylers: [{color: '#17263c'}]
      }
    ]
  });
  getBars(map);
}

function getBars() {
  var request = $.ajax({
    url: '/bars',
    method: "GET",
    dataType: "json"
  })
  request.done(function(response) {
    var coordinates = getLatLng(response)
    console.log(coordinates)
    setAllMarkers(coordinates);
  })
  var object = request.done();
  console.log(object);
  return object;
}

function getLatLng(objectArray) {
  var allCoordinates = []
  for (var i = 0; i < objectArray.length; i++) {
    var lat = objectArray[i].latitude
    var lng = objectArray[i].longitude
    allCoordinates.push([lat, lng])
  }
  return allCoordinates
}

function setBarMarker(latLngArray) {
  var point = new google.maps.LatLng(latLngArray[0],latLngArray[1])
  var baseMarker = new google.maps.Marker({
    position: point,
    map: map
    // icon: "../../../assets/images/person.png"
  })
}

function setAllMarkers(barsArray) {
  for (var i = 0; i < barsArray.length; i++ ) {
    setBarMarker(barsArray[i])
  }
}


$(document).on('turbolinks:load', function() {
  initMap()
})
;

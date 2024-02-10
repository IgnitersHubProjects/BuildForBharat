		var polygon;
		var circle;


$(document).ready(function () {

	$("#location-btn").on("click", function(e) {
		e.preventDefault();
		$("#mapModal").modal('show');
		var latLoc = convertData($("#mediaLocation").attr('data-lat'), "geoLoc");
		var lngLoc = convertData($("#mediaLocation").attr('data-lng'), "geoLoc");
		if (latLoc !== null && lngLoc !== null) {
			window.mapModal.initMap(latLoc, lngLoc, $("#mediaLocation")[0]);
			var marker = {
				position: {
					lat: latLoc,
					lng: lngLoc
				},
				map: window.mapModal.map
			};
			window.mapModal.createMarker(marker);
			 calculateDistanceAndSpeed({
                startLat: $("#mediaLocation").attr('data-lat'),
                startLon: $("#mediaLocation").attr('data-lng'),
                endLat: $("#maxViewableDistance").attr('data-lat'),
                endLon: $("#maxViewableDistance").attr('data-lng')
            });
		} else {
			window.mapModal.initMap(INIT_LAT, INIT_LNG, $("#mediaLocation")[0]);
		}
	});


	$("#maxViewableDistence-btn").on("click", function(e) {
		e.preventDefault();
		$("#mapModal").modal('show');
		var latLoc = convertData($("#maxViewableDistance").attr('data-lat'), "geoLoc");
		var lngLoc = convertData($("#maxViewableDistance").attr('data-lng'), "geoLoc");
		if (latLoc !== null && lngLoc !== null) {
			window.mapModal.initMap(latLoc, lngLoc, $("#maxViewableDistance")[0]);
			var marker = {
				position: {
					lat: latLoc,
					lng: lngLoc
				},
				map: window.mapModal.map
			};
				window.mapModal.createMarker(marker);
			 calculateDistanceAndSpeed({
                startLat: $("#mediaLocation").attr('data-lat'),
                startLon: $("#mediaLocation").attr('data-lng'),
                endLat: $("#maxViewableDistance").attr('data-lat'),
                endLon: $("#maxViewableDistance").attr('data-lng')
            });
		} else {
			window.mapModal.initMap(INIT_LAT, INIT_LNG, $("#maxViewableDistance")[0]);
		}

	});
	
	function updateCoordinatesAndCalculateDistance(inputField) {
		const inputVal = inputField.val();
		const latLngArray = inputVal.split(',');
		if (latLngArray.length === 2) {
			const lat = latLngArray[0].trim();
			const lng = latLngArray[1].trim();
			inputField.attr('data-lat', lat);
			inputField.attr('data-lng', lng);

			inputField.val(lat + ', ' + lng);

			calculateDistanceAndSpeed({
				startLat: $("#mediaLocation").attr('data-lat'),
				startLon: $("#mediaLocation").attr('data-lng'),
				endLat: $("#maxViewableDistance").attr('data-lat'),
				endLon: $("#maxViewableDistance").attr('data-lng')
			});
		}
	}

	$("#mediaLocation").on("input", function () {
		updateCoordinatesAndCalculateDistance($(this));
	});

	$("#maxViewableDistance").on("input", function () {
		updateCoordinatesAndCalculateDistance($(this));
	});

	function calculateDistanceAndSpeed(data) {
		console.log(data)
		$.ajax({
			type: "POST",
			url: "/inventory/calculation",
			beforeSend: function (request) {
				request.setRequestHeader("Authority", "token");
			},
			contentType: "application/json",
			data: JSON.stringify(data),
			success: function (response) {
				var distance = response.data.distance;
				var unit = 'm';
				if(distance > 1000){
					distance = distance/1000;
					distance = distance.toFixed(2);
					unit = 'Km';
				}
				var durationInSeconds = response.data.duration;
				var hours = Math.floor(durationInSeconds / 3600);
				var minutes = Math.floor((durationInSeconds % 3600) / 60);
				var duration = '';
			    if (hours === 0 && minutes === 0) {
			        duration =  "less than a minute";
			    } else if (hours === 0) {
			        duration =  minutes + " minutes";
			    } else if (minutes === 0) {
			        duration = hours + " hrs";
			    } else {
			        duration = hours + " hrs " + minutes + " m";
			    }				
				$("input[name=aads]").val(`${distance} ${unit}`);
				$("input[name=mvd]").val(duration);
				$("#view-motorable-path").removeAttr("disabled");
			},
			error: function (xhr, status, error) {
				console.error(error);
			}
		});
	}

	$("#mapClose").on("click", function(e){
		$("#saveMediLoc").css("display","block");
		$("#mapModelChild").removeClass('model-left');
        $("#inventory-holder").css("display","none");
        $("#item-list").empty();
		polygon = null;
		circle = null;
        
	});
	
	$("#view-reverse-lat").on("click", function(e){
		var address = $("#addresspoc").val();
		if(address !== null && address !== undefined){
			$("#mapModal").modal('show');
			var latLoc = convertData($("#mediaLocation").attr('data-lat'), "geoLoc");
			var lngLoc = convertData($("#mediaLocation").attr('data-lng'), "geoLoc");
			if (latLoc !== null && lngLoc !== null) {
				window.mapModal.initMap(latLoc, lngLoc, $("#mediaLocation")[0]);
			} else {
				window.mapModal.initMap(INIT_LAT, INIT_LNG, $("#mediaLocation")[0]);
			}
		    $("#saveMediLoc").css("display","none");

			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({ 'address': address }, function(results, status) {
			    if (status == google.maps.GeocoderStatus.OK) {
			        var location = results[0].geometry.location;
			        var marker = new google.maps.Marker({
			            map: window.mapModal.map,
			            position: location
			        });
			        window.mapModal.map.setCenter(location);
			        window.mapModal.map.setZoom(12);
			    } else {
			        alert('Geocode was not successful for the following reason: ' + status);
			    }
			});			
		}		
	});


	$("#polygon-search-btn").on('click', function (e) {
		e.preventDefault();
		$('#mapModal').modal('show');
	
		var latLoc = convertData($("#mediaLocation").attr('data-lat'), "geoLoc");
		var lngLoc = convertData($("#mediaLocation").attr('data-lng'), "geoLoc");
		if (latLoc !== null && lngLoc !== null) {
			window.mapModal.initMap(latLoc, lngLoc, $("#mediaLocation")[0]);
		} else {
			window.mapModal.initMap(INIT_LAT, INIT_LNG, $("#mediaLocation")[0]);
		}
		$("#saveMediLoc").css("display", "none");
	
		var drawingManager = new google.maps.drawing.DrawingManager({
			drawingMode: google.maps.drawing.OverlayType.POLYGON,
			drawingControl: true,
			drawingControlOptions: {
				position: google.maps.ControlPosition.TOP_CENTER,
				drawingModes: ['polygon', 'circle']
			},
			polygonOptions: {
				editable: true
			},
			circleOptions: {
				editable: true
			}
		});
	
		drawingManager.setMap(window.mapModal.map);
		
		google.maps.event.addListener(drawingManager, 'overlaycomplete', function (event) {
			if (event.type == google.maps.drawing.OverlayType.POLYGON) {
				if (polygon) {
					polygon.setMap(null);
				}
				polygon = event.overlay;
	
				$("#searchButton").prop('disabled', false);
			} else if (event.type == google.maps.drawing.OverlayType.CIRCLE) {
				if (circle) {
					circle.setMap(null);
				}
				circle = event.overlay;
	
				$("#searchButton").prop('disabled', false);
			}
		});
		
	});

		$("#searchButton").on('click', function (e) {
			e.preventDefault();
	
			if (!polygon && !circle) {
				console.log('Please draw a polygon or circle first.');
				return;
			}
	
			$("#item-list").empty(); 
	
			var coordinates;
			var center;
			var radius;
			var searchQuery = $("#searchInput").val().trim();
	
			if (searchQuery === '') {
				console.log('Please enter a search query.');
				return;
			}
			if (polygon) {
				coordinates = polygon.getPath().getArray();
			} else if (circle) {
				center = circle.getCenter();
				radius = circle.getRadius();
			}
			performSearch(searchQuery, coordinates, center, radius);
	
		});
	
	function performSearch(searchQuery, polygonCoordinates, circleCenter, circleRadius) {
	
		var service = new google.maps.places.PlacesService(document.createElement('div'));
	
		var request;
		if (polygonCoordinates) {
			request = {
				query: searchQuery,
				bounds: getPolygonBounds(polygonCoordinates)
			};
		} else if (circleCenter && circleRadius) {
			request = {
				query: searchQuery,
				location: circleCenter,
				radius: circleRadius
			};
		}
	
		 service.textSearch(request, function (results, status) {
			 var markers = []; 
			if (status === google.maps.places.PlacesServiceStatus.OK) {
				console.log('Search results for query "' + searchQuery + '":', results);
				$("#mapModelChild").addClass('model-left');
				$("#inventory-holder").css("display", "block");
				for (var i = 0; i < results.length; i++) {
					var place = results[i];
					var icon = place.photos.length > 0 ? place.photos[0].getUrl() : place.icon;
					var listItem = `<li style="background-color:aliceblue;margin-bottom:10px;"><div><div><img style="height:50px;" src=${icon} /></div><div>${place.name}</div><div>${place.formatted_address}</div></div></li>`;
					
					var isWithinBounds = false;
					if (polygonCoordinates) {
						isWithinBounds = google.maps.geometry.poly.containsLocation(place.geometry.location, new google.maps.Polygon({paths: polygonCoordinates}));
					} else if (circleCenter && circleRadius) {
						isWithinBounds = google.maps.geometry.spherical.computeDistanceBetween(circleCenter, place.geometry.location) <= circleRadius;
					}
	
					if (isWithinBounds) {
						$("#item-list").append(listItem);
						var marker = new google.maps.Marker({
							position: place.geometry.location,
							map: window.mapModal.map,
							title: place.name
						});
						markers.push(marker);
					}
				}
			} else {
				console.error('Search request failed. Status:', status);
			}
		});
	}
	
	function getPolygonBounds(coordinates) {
		var bounds = new google.maps.LatLngBounds();
		for (var i = 0; i < coordinates.length; i++) {
			bounds.extend(new google.maps.LatLng(coordinates[i].lat(), coordinates[i].lng()));
		}
		return bounds;
	}
	
	function clearMarkers(markers) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers.splice(0, markers.length);
	}



	$("#view-motorable-path").on("click", function (e) {
		$("#mapModal").modal('show');
		var start = new google.maps.LatLng($("#maxViewableDistance").attr("data-lat"), $("#maxViewableDistance").attr("data-lng"));
		var end = new google.maps.LatLng($("#mediaLocation").attr("data-lat"), $("#mediaLocation").attr("data-lng"));
		var directionsService = new google.maps.DirectionsService();
		var request = {
		    origin: start,
		    destination: end,
		    travelMode: google.maps.TravelMode.DRIVING
		};
		directionsService.route(request, function(result, status) {
		    if (status == google.maps.DirectionsStatus.OK) {
		        // Display the route on the map
		        var directionsRenderer = new google.maps.DirectionsRenderer();
		        directionsRenderer.setMap(window.mapModal.map);
		        directionsRenderer.setDirections(result);
		        $("#saveMediLoc").css("display","none");
		    }
		});
		
	});
	
	$("#saveMediLoc").on("click", function(e) {
		e.preventDefault();
		window.mapModal.saveMarker(window.mapModal.currentElement);
		var loc = convertData(window.mapModal.markers.latitude, "geoLoc") + "," + convertData(window.mapModal.markers.longitude, "geoLoc");
		getAddressFromLatLng(convertData(window.mapModal.markers.latitude, "geoLoc"), window.mapModal.markers.longitude, function(addr) {
    		$(window.mapModal.currentElement).val(addr);
		});
		$('#'+$(window.mapModal.currentElement)[0].id+'-disabled').val(loc);
		  calculateDistanceAndSpeed({
                startLat: $("#mediaLocation").attr('data-lat'),
                startLon: $("#mediaLocation").attr('data-lng'),
                endLat: $("#maxViewableDistance").attr('data-lat'),
                endLon: $("#maxViewableDistance").attr('data-lng')
            });
	});

	$("#back-btn").on("click", function(e) {
		e.preventDefault();
		var url = location.href;
		window.location.href = url.substring(0, url.lastIndexOf('/') + 1);
	});
	$(function() {
		$('.date').datepicker({
			format: 'dd/mm/yyyy'
		});
	});
});
    
 


$("#maxViewableDistance").on("blur", function() {
	var maxViewableDistance = $(this).val();
	var maxViewableDistanceErrorElement = $("#maxViewableDistanceError"); // Get the error message element
	maxViewableDistanceErrorElement.text(""); // Clear any previous error message

	// Define the maximum allowed length for the field
	var maxLength = 50; // You can change this value to your desired maximum length

	if (maxViewableDistance.length > maxLength) {
		// Display an error message if the value exceeds the maximum length
		maxViewableDistanceErrorElement.text("Max Viewable Distance is too long (max " + maxLength + " characters)");
		maxViewableDistanceErrorElement.css("display", "block"); // Show the error message
	} else {
		// The value is valid, so hide the error message
		maxViewableDistanceErrorElement.css("display", "none");
	}
});

$("#location").on("blur", function() {
	var locationValue = $(this).val();
	var locationErrorElement = $("#locationError"); // Get the error message element
	locationErrorElement.text(""); // Clear any previous error message

	// Define the maximum allowed length for the field
	var maxLength = 50; // You can change this value to your desired maximum length

	if (locationValue.length > maxLength) {
		// Display an error message if the value exceeds the maximum length
		locationErrorElement.text("Location is too long (max " + maxLength + " characters)");
		locationErrorElement.css("display", "block"); // Show the error message
	} else {
		// The value is valid, so hide the error message
		locationErrorElement.css("display", "none");
	}
});

$("#setBackDistance").on("blur", function() {
	var setBackDistance = $(this).val();
	var setBackDistanceErrorElement = $("#setBackDistanceError"); // Get the error message element
	setBackDistanceErrorElement.text(""); // Clear any previous error message

	// Maximum allowed value for setBackDistance (adjust as needed)
	var maxValue = 500; // Maximum allowed value

	if (isNaN(setBackDistance) || setBackDistance > maxValue) {
		// Display an error message if the input is not a valid number or exceeds the allowed maximum
		setBackDistanceErrorElement.text("Please enter a valid distance less than or equal to " + maxValue + " feet.");
		setBackDistanceErrorElement.css("display", "block"); // Show the error message
	} else {
		// The setBackDistance is valid, so hide the error message
		setBackDistanceErrorElement.css("display", "none");
	}
});


$("#address").on("blur", function() {
	var address = $(this).val();
	var addressErrorElement = $("#addressError"); // Get the error message element
	addressErrorElement.text(""); // Clear any previous error message

	// Maximum allowed length for the address (adjust as needed)
	var maxLength = 100; // Maximum allowed length

	if (address.length > maxLength) {
		// Display an error message if the address exceeds the allowed maximum length
		addressErrorElement.text("Address should be less than " + maxLength + " characters.");
		addressErrorElement.css("display", "block"); // Show the error message
	} else {
		// The address is valid, so hide the error message
		addressErrorElement.css("display", "none");
	}
});

function convertData(data, type) {
	if (data === undefined || data === "") {
		if (type === "boolean") {
			return false;
		}
		return null;
	} else if (type === "geoLoc")
		return parseFloat(data);
	else if (type === "int")
		return parseInt(data);
	else if (type === "float")
		return parseFloat(data).toFixed(2);
	else if (type === "boolean")
		return data === "on";
	else
		return data;
}

async function readImageAsBase64(files) {
	if (window.FileReader) {
		for (var file of files) {
			if (file && file.type.match('image.*')) {
				let res = await new Promise((resolve) => {
					let reader = new FileReader();
					reader.onload = (e) => resolve(reader.result);
					reader.readAsDataURL(file);
				});
				var box = $("#image-slider-box").clone();
				$(box).removeAttr("id");
				$(box).find("img").attr("src", res);
				$(box).find("img").attr("data-filename", file.name);
				$(box).show();
				$("#inventry_slider_images").append(box);
				$('.inventry_slider').slick('unslick');
				slickInitialize();
			}
		}
	}
}

const INIT_LAT = parseFloat(document.getElementById("latitude").value);
const INIT_LNG = parseFloat(document.getElementById("longitude").value);
const INIT_ZOOM = 8;

window.mapModal = {
	map: null,
	markers: {},
	currentElement: null,
	markerObj: null,

	
	initMap: (x = INIT_LAT, y = INIT_LNG, e = null) => {
		window.mapModal.currentElement = e;
		const map = new google.maps.Map(document.getElementById("mapFrame"), {
			center: {
				lat: x,
				lng: y,
			},
			zoom: INIT_ZOOM,
			fullscreenControl: false,
			mapId: Math.floor(Math.random() * Math.pow(10, 10)).toString(),
		});

		window.mapModal.map = map;
		console.log(window.mapModal.map);	
		map.addListener("click", (e) => {
			console.log(e)
			window.mapModal.removeMarker();
			window.mapModal.createMarker({
				position: e.latLng,
				map: window.mapModal.map
			});
			window.mapModal.setMarker(e.latLng.lat(), e.latLng.lng());
		});
	},

	saveMarker: (e) => {
		console.log(e)
		$(e).attr('data-lat', window.mapModal.markers.latitude);
		$(e).attr('data-lng', window.mapModal.markers.longitude);
		$("#mapModal").modal('hide');
	},

	setMarker: (lat, Lng) => {
		window.mapModal.markers = {
			latitude: lat,
			longitude: Lng
		}
	},
	removeMarker: () => {
		if (window.mapModal.markerObj)
			window.mapModal.markerObj.setMap(null);
	},
	createMarker: ({
		position,
		map
	}) => {
		const containerElement = document.createElement("div");
		const markerProperties = {
			position,
			map
		};
		const marker = new google.maps.Marker(
			markerProperties
		);
		window.mapModal.markerObj = marker;
		return marker;
	},

	toggleMarkerBounce: (marker) => {
		if (marker.getAnimation() !== null) {
			marker.setAnimation(null);
		} else {
			marker.setAnimation(google.maps.Animation.BOUNCE);
		}
	},
};

function getAddressFromLatLng(lat, lng, callback) {
    var latLng = new google.maps.LatLng(lat, lng);
    var geocoder = new google.maps.Geocoder();

    geocoder.geocode({ 'location': latLng }, function(results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
            if (results[0]) {
                var address = results[0].formatted_address;
                callback(address);
            } else {
                callback("No address found");
            }
        } else {
            callback("Geocoder failed due to: " + status);
        }
    });
}



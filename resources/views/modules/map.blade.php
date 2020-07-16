<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Marker Clustering</title>
    <style>
        /* Always set the map height explicitly to define the size of the div
        * element that contains the map. */
        #map {
            height: 100%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script src="https://www.gstatic.com/firebasejs/7.4.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.4.0/firebase-firestore.js"></script>
</head>
<body>
<div id="map"></div>
<input type="button" id="addMarker" value="addMarker" onclick="addMarker();"/>
<script>



    firebase.initializeApp({
        apiKey: 'AIzaSyB4OzW9oSEjHpNpL8OfpmpXdT_yCzB0bsk',
        authDomain: 'marasieltotil.firebaseapp.com',
        projectId: 'marasieltotil'
    });


    var db = firebase.firestore();


    var markers=[];
    const docRef = db.collection("users");
    docRef.onSnapshot({includeMetadataChanges:true},snap => {
        snap.docs.forEach(doc => {

            if(doc.data().drivePos){
                var uluru = { lat: doc.data().drivePos._long, lng: doc.data().drivePos._lat };
                var image={
                    url:'marker.png',
                    scaledSize:new google.maps.Size(50, 50),
                    origin: new google.maps.Point(0, 0),
                    nchor: new google.maps.Point(0, 0)

                }
                var contentString = '<div id="content">'+
                    '<div id="siteNotice">'+
                    '</div>'+
                    '<center><h3 id="firstHeading" class="firstHeading">'+doc.data().firstName+' '+doc.data().lastName+'</h3></center>'+
                    '<div id="bodyContent">'+
                    '<center><img src="'+doc.data().profilePictureURL+'" width="50" /></center>'+
                    '<p><b>Email:</b>' +doc.data().email+'<br>'+
                    '<b>Phone:</b>' +doc.data().phone+'<br>'+
                    '<b>Vehicle:</b>' +doc.data().vehicle_brand+'<br>'+
                    '</p>'+
                    '</div>'+
                    '</div>';
                var infowindow = new google.maps.InfoWindow({
                    content: contentString
                });

                var marker = new google.maps.Marker({
                    position: uluru,
                    map: map,
                    icon:image,
                    title:doc.data().firstName
                });
                marker.addListener('click', function() {
                    infowindow.open(map, marker);
                });

                if(markers[doc.id]){markers[doc.id].setMap(null);}
                markers[doc.id] = marker;
            }

        });



        //markers[0].setMap(null);
        console.log(markers);
        // Add a marker clusterer to manage the markers.
        var markerCluster = new MarkerClusterer(map, markers,
            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});

    });
    //markers['ekb1CiVMZUSKWFduVxtgQt2nCvL2'].setMap(null);


    var map;
    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 11,
            draggable: true,
            scrollwheel:true,
            center: {lat: 41.0227125, lng: 28.9344261 }
        });

    }





</script>

<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
</script>

<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARbx3bj8FCMefvLprZ5EouqDyzzrunvto&callback=initMap">
</script>


</body>
</html>

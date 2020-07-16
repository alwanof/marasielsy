@extends('layouts.master')
@section('title','Dashboard')

@section('nav')
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Desktop</h1>
            </div>

        </div>
    </div><!-- /.container-fluid -->
@endsection
@section('content')
    <!-- Small boxes (Stat box) -->
    <!-- Default box -->
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Real Time Map</h3>

            <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                    <i class="fas fa-minus"></i></button>
                <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
                    <i class="fas fa-times"></i></button>
            </div>
        </div>
        <div class="card-body p-0">
            <div id="map" style="height: 500px">

            </div>
        </div>
        <!-- /.card-body -->


    </div>
    <!-- /.card -->
@endsection

@section('css')
    <style>
        /* Always set the map height explicitly to define the size of the div
        * element that contains the map. */
        #map {
            height: 100%;
        }
        /* Optional: Makes the sample page fill the window. */

    </style>
    @endsection

@section('head-js')
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script src="https://www.gstatic.com/firebasejs/7.4.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.4.0/firebase-firestore.js"></script>
    @endsection

@section('js')
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

                if(doc.data().drivePos && doc.data().vehicle_brand){
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
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBygkRzIk31oyrn9qtVvQmxfdy-Fhjwz0&callback=initMap">
    </script>
    @endsection

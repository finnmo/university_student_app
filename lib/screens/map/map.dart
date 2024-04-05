import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends StatefulWidget {

 @override
  MapPageState createState() => MapPageState();

}
class MapPageState extends State<MapPage>
    with AutomaticKeepAliveClientMixin<MapPage> {
      
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return 
    Scaffold(
      body: 
      Stack(
        
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height, // Use the screen height
            width: MediaQuery.of(context).size.width, // Use the screen height

            child: WebView(
              initialUrl: Uri.dataFromString(
                '''
                <!DOCTYPE html>
<head>
    <meta name="viewport" id="vp" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
    <meta charset="utf-8" />

    <link rel="stylesheet" href="https://api.mazemap.com/js/v2.0.103/mazemap.min.css">
    <script type='text/javascript' src='https://api.mazemap.com/js/v2.0.103/mazemap.min.js'></script>

    <style>

        html, body {height: 100%; position: absolute; top: 0px; bottom: 0px; left: 0px; right: 0px; margin:0px; padding:0px; font-family: "Helvetica Neue",Helvetica,Arial,sans-serif; font-size: 12px; }

            .search-control-default{
                position: absolute;
                display: flex;
                margin: auto;
                top: 80px;
                width: 80%;
                left: 50%;
                left: 0;
                right: 0;
                max-width: 300px;
                z-index: 999;
            }
            .search-input{
                border: 0;
                border-radius: 35px;
                display: flex;
                height: 55px;
                font-size: 16px;
                padding: 20px;
                align-items: stretch;

            }
            .search-suggestions.default{
              max-height: 300px;
            }

    </style>
</head>
<body>
    <div id="map" aria-label="map view" tabindex="1" class="mazemap"></div>
    <div id="search-input-container" class='search-control-default'>
        <input tabindex="0" id="searchInput" class="search-input" autocomplete="off" type="text" name='search' placeholder='Search'>

        <div id="suggestions" class="search-suggestions default"></div>
    </div>

    <script>

        // Just the same way to initialize as always...
        var myMap = new Mazemap.Map({
            container: 'map',
            campuses: 296,

            // initial position in lngLat format
            center: {lng: 115.894119, lat: -32.005658},
            zoom: 16,
            zLevel: 1,
            zLevelControl: false,
            scrollZoom: true,
            doubleClickZoom: true,
            touchZoomRotate: true
        });

        myMap.on('load', function(){
            var customZLevelBar1 = new Mazemap.ZLevelBarControl( {
                className: 'custom-zlevel-bar',
                autoUpdate: true,
                maxHeight: 300
            } );
            myMap.addControl( customZLevelBar1, 'bottom-right' );
        });

        myMap.addControl(new Mazemap.mapboxgl.GeolocateControl({
              positionOptions: {
                  enableHighAccuracy: true
                  },
                  trackUserLocation: true,
                  showUserHeading: true
          }), 'bottom-right');

        var mySearch = new Mazemap.Search.SearchController({
            campusid: 296,
            rows: 10,
            withpois: false,
            withbuilding: true,
            withtype: false,
            withcampus: false,
            resultsFormat: 'geojson'
        });

        var mySearchInput = new Mazemap.Search.SearchInput({
            container: document.getElementById('search-input-container'),
            input: document.getElementById('searchInput'),
            suggestions: document.getElementById('suggestions'),
            searchController: mySearch
        }).on('itemclick', function(e){
            
          var pois = e.suggestedPois.features; // Get the array of POIs

            var poiFeature = e.item;
            placePoiMarker( poiFeature );
        });
        

        var resultMarker = new Mazemap.MazeMarker({
            color: 'rgb(253, 117, 38)',
            innerCircle: true,
            innerCircleColor: '#FFF',
            size: 34,
            innerCircleScale: 0.5,
            zLevel: 1
        })

        map.addControl(
            new mapboxgl.GeolocateControl({
            positionOptions: {
            enableHighAccuracy: true
            },
            // When active the map will receive updates to the device's location as it changes.
            trackUserLocation: true,
            // Draw an arrow next to the location dot to indicate which direction the device is heading.
            showUserHeading: true
            })
        );

        function placePoiMarker(poi){
            // Get a center point for the POI, because the data can return a polygon instead of just a point sometimes
            var lngLat = Mazemap.Util.getPoiLngLat(poi);
            var zLevel = poi.properties.zValue;

            resultMarker
            .setLngLat(lngLat)
            .setZLevel(poi.properties.zValue)
            .addTo(myMap);

            myMap.zLevel = zLevel;

            myMap.flyTo({center: lngLat, zoom: 19, duration: 2000});
        }

        myMap.getCanvas().addEventListener('focus', function(){
            mySearchInput.hideSuggestions();
        });


    </script>
</body>                ''',
                mimeType: 'text/html',
                encoding: Encoding.getByName('utf-8'),
              ).toString(),
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
          
        ],
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
  
}

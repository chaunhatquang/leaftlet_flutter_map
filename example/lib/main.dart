// @dart=2.9
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location/flutter_map_location.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_marker_cluster_example/models/model.dart';
import 'package:flutter_map_marker_cluster_example/models/trafficsigns_model.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_cluster_example/services/trafficsigns_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///variables
  final PopupController _popupController = PopupController();
  final MapController mapController = MapController();
  ///Search controller
  final TextEditingController _searchController = TextEditingController();
  List<SearchResult> result = [];
  List<Marker> markers = [];
  int pointIndex;
  List points = [
    LatLng(51.5, -0.09),
    LatLng(51.5145160, -0.1270060),
    LatLng(16.478650, 107.601680),
  ];
  Future myFuture;

  @override
  void initState() {
    pointIndex = 2;
    myFuture = readJson();
    super.initState();
  }

  /// Fetch content from the json file
  Future<List<Marker>> readJson() async {
    String url = "assets/1.png";
    await fetchAllTrafficSignProvince().then((value) {
      setState(() {
        result = value;
      });
    });
    print("length traffics sign is: " + result.length.toString());
    result.forEach((element) {
      markers.add(Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          width: 30,
          height: 30,
          point: LatLng(
              double.parse(element.ydaidien), double.parse(element.xdaidien)),
          builder: (context) {
            switch (element.tendoituong) {
              case '1':
                {
                  url = "assets/1.png";
                }
                break;
              case '2':
                {
                  url = "assets/2.png";
                }
                break;
              case '3':
                {
                  url = "assets/3.png";
                }
                break;
              case '4':
                {
                  url = "assets/4.png";
                }
                break;
              case '5':
                {
                  url = "assets/5.png";
                }
                break;
              case '6':
                {
                  url = "assets/6.png";
                }
                break;
              case '7':
                {
                  url = "assets/7.png";
                }
                break;
              case '8':
                {
                  url = "assets/8.png";
                }
                break;
              case '9':
                {
                  url = "assets/9.png";
                }
                break;
              default:
                {
                  url = '';
                }
                break;
            }
            return Image.asset(url);
          }));
    });
    return markers;
  }

  ///calculate distance between 2 location (return in KM)
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Marker>>(
      future: myFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Marker> tempMarker = <Marker>[];
        if (snapshot.hasData) {
          tempMarker = snapshot.data;
          print('has data is true');
        } else {
          print('no data');
        }
        print("length tempMarker is: " + tempMarker.length.toString());
        return Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: LatLng(51.5061590, -0.140280),
                zoom: 10,
                maxZoom: 20,
                plugins: [
                  MarkerClusterPlugin(),
                  LocationPlugin(),
                ],
                onTap: (_) => _popupController
                    .hidePopup(), // Hide popup when the map is tapped.
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerClusterLayerOptions(
                  maxClusterRadius: 120,
                  size: Size(40, 40),
                  anchor: AnchorPos.align(AnchorAlign.center),
                  fitBoundsOptions: FitBoundsOptions(
                    padding: EdgeInsets.all(50),
                  ),
                  markers: tempMarker.isEmpty
                  ? [
                  Marker(
                      point: LatLng(51.5145160, -0.1270060),
                      builder: (context) => Icon(Icons.pin_drop))
                  ]
                      : tempMarker,
                  polygonOptions: PolygonOptions(
                      borderColor: Colors.blueAccent,
                      color: Colors.black12,
                      borderStrokeWidth: 3),
                  popupOptions: PopupOptions(
                    popupSnap: PopupSnap.markerTop,
                    popupController: _popupController,
                    popupBuilder: (_, marker) => Container(
                      width: 200,
                      height: 100,
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: () => debugPrint('Popup tap!'),
                        child: Text(
                          'Container popup for marker at ${marker.point}',
                        ),
                      ),
                    ),
                  ),
                  builder: (context, markers) {
                    return FloatingActionButton(
                      onPressed: null,
                      child: Text(markers.length.toString()),
                    );
                  },
                ),
              ],
              nonRotatedLayers: <LayerOptions>[
                LocationOptions(
                  locationButton(),
                  onLocationUpdate: (LatLngData ld) {
                    //   print(
                    //       'Location updated: ${ld?.location} (accuracy: ${ld?.accuracy})');
                  },
                  onLocationRequested: (LatLngData ld) {
                    if (ld == null) {
                      return;
                    }
                    mapController.move(ld.location, 16.0);
                  },
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0,left: 10.0,right: 10.0),
              alignment: Alignment.topCenter,
              child: TextField(
                controller: _searchController,
                enabled: false,
                style: TextStyle(fontSize: 16.0, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Tìm kiếm địa điểm...',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black45,
                  ),
                ),
              ),
            )
          ],
        );
      },
    ));
  }

  @override
  void dispose() {}

  ///Floating action button
  LocationButtonBuilder locationButton() {
    return (BuildContext context, ValueNotifier<LocationServiceStatus> status,
        Function onPressed) {
      return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
          child: FloatingActionButton(
              onPressed: () => onPressed(),
              child: ValueListenableBuilder<LocationServiceStatus>(
                  valueListenable: status,
                  builder: (BuildContext context, LocationServiceStatus value,
                      Widget child) {
                    switch (value) {
                      case LocationServiceStatus.disabled:
                      case LocationServiceStatus.permissionDenied:
                      case LocationServiceStatus.unsubscribed:
                        return const Icon(
                          Icons.location_disabled,
                          color: Colors.white,
                        );
                      default:
                        return const Icon(
                          Icons.location_searching,
                          color: Colors.white,
                        );
                    }
                  })),
        ),
      );
    };
  }
}

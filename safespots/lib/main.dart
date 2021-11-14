import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
// Este packete esta deprecado pero fue lo que encontre para poder hacer el heat map en flutterj
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  final Set<Heatmap> _heatmaps = {};
  LatLng _hetmapLocation = LatLng(4.6507696, -74.1012805);
  final LatLng _center = const LatLng(4.6507696, -74.1012805);
  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
    setState(() {
      _heatmaps.add(
        Heatmap(
          heatmapId: HeatmapId(_hetmapLocation.toString()),
          points: _createPoints(_hetmapLocation),
          radius: 20,
          visible: true,
          gradient: HeatmapGradient(
            colors: <Color>[Colors.green, Colors.red], startPoints: <double>[0.2, 0.8]
          )
        )
      );
    });
  }
  List<WeightedLatLng> _createPoints(LatLng location){
    final List<WeightedLatLng> points = <WeightedLatLng>[];
    //Can create multiple points here
    points.add(_createWeightedLatLng(location.latitude,location.longitude, 1));
    points.add(_createWeightedLatLng(4.7006776,-74.0489266, 1)); 
    return points; 
  }
  WeightedLatLng _createWeightedLatLng(double lat, double lng, int weight) {
    return WeightedLatLng(point: LatLng(lat, lng), intensity: weight);
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SafeSpots'),
          backgroundColor: Colors.blue,
        ),
        body: GoogleMap( 
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 12.00,
          ),
          heatmaps: _heatmaps,
        ),
      ),
    );
  }
}



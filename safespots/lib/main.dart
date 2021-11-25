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
          radius: 25,
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
    points.add(_createWeightedLatLng(4.7413707,-74.0588615, 1));
    points.add(_createWeightedLatLng(4.7396926,-74.1092340, 1)); 
    points.add(_createWeightedLatLng(4.7427142,-74.1062028, 1)); 
    points.add(_createWeightedLatLng(4.7194741,-74.0352194, 1)); 
    points.add(_createWeightedLatLng(4.7077666,-74.0311331, 1)); 
    points.add(_createWeightedLatLng(4.7116537,-74.1396947, 1)); 
    points.add(_createWeightedLatLng(4.7163316,-74.1212278, 1)); 
    points.add(_createWeightedLatLng(4.7012358,-74.1165639, 1)); 
    points.add(_createWeightedLatLng(4.7044213,-74.1034057, 1)); 
    points.add(_createWeightedLatLng(4.6943483,-74.0869962, 1)); 
    points.add(_createWeightedLatLng(4.6891181,-74.0466533, 1)); 
    points.add(_createWeightedLatLng(4.6828232,-74.0544073, 1)); 
    points.add(_createWeightedLatLng(4.6658886,-74.0499722, 1)); 
    points.add(_createWeightedLatLng(4.6675169,-74.0501223, 1)); 
    points.add(_createWeightedLatLng(4.6676418,-74.0517379, 1)); 
    points.add(_createWeightedLatLng(4.6679101,-74.0529138, 1)); 
    points.add(_createWeightedLatLng(4.6688685,-74.0541443, 1)); 
    points.add(_createWeightedLatLng(4.6698346,-74.0558108, 1)); 
    points.add(_createWeightedLatLng(4.6692019,-74.0597504, 1)); 
    points.add(_createWeightedLatLng(4.6695805,-74.0716733, 1)); 
    points.add(_createWeightedLatLng(4.6687851,-74.0776583, 1)); 
    points.add(_createWeightedLatLng(4.6476176,-74.0600235, 1)); 
    points.add(_createWeightedLatLng(4.6329203,-74.0749437, 1)); 
    points.add(_createWeightedLatLng(4.6288228,-74.0681989, 1)); 
    points.add(_createWeightedLatLng(4.6216747,-74.0774830, 1)); 
    points.add(_createWeightedLatLng(4.6068828,-74.0736692, 1)); 
    points.add(_createWeightedLatLng(4.6021949,-74.0787424, 1)); 
    points.add(_createWeightedLatLng(4.5975835,-74.0828015, 1)); 
    points.add(_createWeightedLatLng(4.5820459,-74.1118406, 1)); 
    points.add(_createWeightedLatLng(4.5904879,-74.1123970, 1)); 
    points.add(_createWeightedLatLng(4.5848004,-74.1193972, 1)); 
    points.add(_createWeightedLatLng(4.5932410,-74.1355926, 1)); 
    points.add(_createWeightedLatLng(4.6016533,-74.1330536, 1)); 
    points.add(_createWeightedLatLng(4.6193627,-74.1216488, 1)); 
    points.add(_createWeightedLatLng(4.6258358,-74.1196592, 1)); 
    points.add(_createWeightedLatLng(4.6216151,-74.1337546, 1)); 
    points.add(_createWeightedLatLng(4.6255206,-74.1322072, 1)); 
    points.add(_createWeightedLatLng(4.6052679,-74.1526609, 1)); 
    points.add(_createWeightedLatLng(4.6204745,-74.1509469, 1)); 
    points.add(_createWeightedLatLng(4.6316387,-74.1425808, 1)); 
    points.add(_createWeightedLatLng(4.6400174,-74.1409627, 1)); 
    points.add(_createWeightedLatLng(4.6514578,-74.1289180, 1)); 
    points.add(_createWeightedLatLng(4.5965728,-74.1904832, 1)); 
    points.add(_createWeightedLatLng(4.6100555,-74.1839126, 1)); 
    points.add(_createWeightedLatLng(4.6278806,-74.1779765, 1)); 
    points.add(_createWeightedLatLng(4.6277245,-74.2105491, 1)); 
    points.add(_createWeightedLatLng(4.5370984,-74.1434649, 1));
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
            zoom: 11.00,
          ),
          heatmaps: _heatmaps,
        ),
      ),
    );
  }
}



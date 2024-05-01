import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';


class counter extends StatefulWidget {
  const counter({Key? key}) : super(key: key);

  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {


  List<double>? _accelerometerValues;
  //STEPCOUNTER
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  int _steps = 0;
  double _previousY = 0.0;
  double _currentY = 0.0;
  bool _isStepCounting = false;
  // The user's weight in kg
  int _caloriesBurned = 0;
  double _distanceInKm = 0;
  double _strideLengthInM = 1; // Assuming the average stride length is 1 meters for walking

  //MAPS
  String maptheme = '';
  Completer<GoogleMapController> _controller = Completer();
  late LocationData _currentLocation =LocationData.fromMap({
    'latitude': 0.0,
    'longitude': 0.0,
  });
  BitmapDescriptor markericon = BitmapDescriptor.defaultMarker;
   late StreamSubscription<LocationData> _locationSubscription;
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6941, 72.9734),
    zoom: 15,
  );

  @override
  void initState() {
    super.initState();
    //MAPS
    loadMapTheme();
    _initLocation();
    addCustomIcon();
    // STEPCOUNTER
    _accelerometerSubscription = accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
        _updateStepCount(event.y);
        _updateDistance();
      });
    });
  }

  @override

  void dispose() {
    _accelerometerSubscription.cancel();
    _locationSubscription.cancel();
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(10, 10)),
        "assets/images/marker_icon1.png")
        .then((icon) {
      setState(() {
        markericon = icon;
      });
    });
  }

  Future<void> loadMapTheme() async {
    try {
      final String value = await DefaultAssetBundle.of(context)
          .loadString('assets/maptheme/dark.json');
      setState(() {
        maptheme = value;
      });
    } catch (e) {
      print('Error loading map theme: $e');
    }
  }

  Future<void> _initLocation() async {
    final location = Location();
    try {
      _currentLocation = await location.getLocation();
      if (_controller.isCompleted) {
        _controller.future.then((controller) {
          controller.animateCamera(
              CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(_currentLocation.latitude!,
                      _currentLocation.longitude!),
                  zoom: 15)));
        });
      }
      _locationSubscription = location.onLocationChanged.listen((locationData) {
        if (mounted) {
          setState(() {
            _currentLocation = locationData;
          });
        }
      });
    } catch (e) {
      print('Could not get location: $e');
    }
  }

  void _updateStepCount(double y) {
    _previousY = _currentY;
    _currentY = y;

    // Check for a step only if the previous and current Y values have opposite signs
    if (_previousY < -1.5 && _currentY >= 1.5 ||
        _previousY >= 1.5 && _currentY < 1.5) {
      if (!_isStepCounting) {
        // Start counting steps
        _isStepCounting = true;
      } else {
        // Increment step count and reset step counting flag
        _steps++;
        //CALORIES FORMULA
        _caloriesBurned = (_steps * 0.05)
            .toInt(); // Assuming 0.05 calories burned per step per kg of weight
        _isStepCounting = false;

        // Reset step count, calories burned, and distance after every 100 steps
        if (_steps % 1000 == 0) {
          _steps = 0;
          _caloriesBurned = 0;
          _distanceInKm = 0.0;
        }
      }
    }
  }

// DISTANCE
  void _updateDistance() {
    if (_steps > 0) {
      _distanceInKm = (_steps * _strideLengthInM) /
          1000; // Convert from meters to kilometers
    }
  }

  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    final percent = _steps / 1000; // Assuming a target of 10,000 steps
    final stepsText = 'Steps: $_steps';
    final caloriesText = 'Calories Burned: $_caloriesBurned';
    final distanceText = 'Distance: ${_distanceInKm.toStringAsFixed(2)} km';
    return  Container(


        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffEFEFBB),
              Colors.grey,
            ],
          ),
        ),

        child: Column(

            children: [
            SizedBox(
            height: 10,
            ),
              Text(
                'DAY',
                style: TextStyle(
                  fontFamily: 'ita',
                  fontSize: 24,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Goal 10,000',
                style: TextStyle(
                  fontFamily: 'ita',
                  fontSize: 28,
                  color: Colors.grey,
                ),
              ),
              CircularPercentIndicator(
                radius: 130.0,
                lineWidth: 15.0,
                percent: percent,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '  Todays steps',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'ita',
                          color: Colors.blueGrey

                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      '$_steps',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 64,
                        fontFamily: 'ita',
                      ),
                    ),

                  ],
                ),
                progressColor: Colors.black38,
                backgroundColor: Colors.black26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Calories Burned:',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'ita',
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        '$_caloriesBurned',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'ita',
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Distance:',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'ita',
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        '$_distanceInKm km',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'ita',
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),



              Text(
                '  Tracker',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'ita',
                    color: Colors.blueGrey
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: GoogleMap(
                    initialCameraPosition: _kGooglePlex,
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      if (!_controller.isCompleted) {
                        _controller.complete(controller);
                        if (maptheme.isNotEmpty) {
                          controller.setMapStyle(maptheme);
                        }
                      }
                    },
                    markers: _createMarker(_currentLocation),
                  ),
                ),
              ),
            ]),

    );
  }

  Set<Marker> _createMarker(LocationData locationData) {
    if (locationData != null) {
      return <Marker>[
        Marker(
          markerId: MarkerId("userLocation"),
          position: LatLng(locationData.latitude!, locationData.longitude!),
          icon: markericon,
        ),
      ].toSet();
    }
    return Set<Marker>();
  }
}
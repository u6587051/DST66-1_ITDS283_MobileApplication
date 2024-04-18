import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapHealth extends StatefulWidget {
  const MapHealth({super.key});

  @override
  State<MapHealth> createState() => _MapHealth();
}

class _MapHealth extends State<MapHealth> with SingleTickerProviderStateMixin {
  late GoogleMapController mapController;

  late Animation<Offset> _offsetAnimation;
  late AnimationController _controller;

  Location _locationController = new Location();

  final LatLng _pMahidol = const LatLng(13.7991639, 100.3162772);
  final LatLng _pKanchana = const LatLng(13.786799, 100.3189151);

  LatLng? _currentP = null;
  bool _showExpanded = false;
  List<Marker> markers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationUpdates();
    getHealthUnit();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void getHealthUnit() {
    FirebaseFirestore.instance
        .collection('markers')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc.exists) {
          double lat = doc.data()['geo'].latitude;
          double lng = doc.data()['geo'].longitude;
          String name = doc.data()['healthcareunit'];
          String phone = doc.data()['tel'];
          String openingHours = doc.data()['open'];
          print(lat);
          print(lng);
          print('${name} + ${phone} + ${openingHours}');
          Marker marker = Marker(
            markerId: MarkerId(name),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(
              title: name,
              snippet: '$openingHours',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueYellow),
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0, 0.45, 0.75, 0.98],
                            colors: [
                              Color.fromARGB(255, 45, 71, 55),
                              Color.fromARGB(255, 124, 150, 112),
                              Color.fromARGB(255, 176, 173, 140),
                              Color.fromARGB(255, 238, 230, 222),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                      height: 80,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              Text(
                                "${phone}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              Text(
                                "${openingHours}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ]),
                      ),
                    );
                  });
            },
          );
          setState(() {
            markers.add(marker);
            print(markers);
          });
        }
      });
    }).catchError((error) {
      print("Error fetching markers: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1],
                  colors: [
                    Color.fromARGB(255, 45, 71, 55),
                    Color.fromARGB(255, 124, 150, 112),
                  ],
                ),
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent, // Make app bar transparent
              elevation: 0, // Remove app bar shadow
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Text(
                  "สถานพยาบาล",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _currentP == null
          ? const Center(child: Text('Loading'))
          : Stack(children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _currentP!,
                  zoom: 12,
                ),
                markers: {
                  Marker(
                      markerId: MarkerId("_currentLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      infoWindow: InfoWindow(
                        title: 'ตำแหน่งของฉัน',
                      ),
                      position: _currentP!),
                  for (Marker marker in markers) marker,
                },
                zoomGesturesEnabled: true,
              ),
            ]),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();

    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
      }
    });
  }
}

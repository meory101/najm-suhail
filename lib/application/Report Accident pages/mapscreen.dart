import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/home/widgets/app_bar_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Mapscreen extends StatefulWidget {
  const Mapscreen({super.key});

  @override
  State<Mapscreen> createState() => _MapscreenState();
}

class _MapscreenState extends State<Mapscreen> {
  GoogleMapController? mapController;
  Position? cl;
  var lat;
  var long;
  CameraPosition? _kGooglePlex;
  late Set<Marker> mymarker;

  getlocation() async {
    PermissionStatus status = await Permission.location.request();
    if (status == PermissionStatus.denied) {
      await Geolocator.requestPermission();
    }
    if (status == PermissionStatus.granted) {
      await getLatLong();
    }
  }

  getLatLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => (value));

    lat = cl?.latitude;
    long = cl?.longitude;

    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      tilt: 0.5,
      zoom: 30.4746,
    );
    if (!mounted) return;
    setState(() {
      mymarker = {
        Marker(markerId: MarkerId("1"), position: LatLng(lat, long)),
        Marker(
            onDragEnd: ((LatLng) => {print(LatLng)}),
            markerId: MarkerId("1"),
            position: LatLng(lat, long))
      };
    });
  }

  void initState() {
    getlocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leading: GestureDetector(
          child: const Icon(
            Icons.menu,
            color: Colors.green,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.language,
                    color: Colors.green,
                  ),
                  
                  Text(
                    'عربي',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
        
        ],
        backgroundColor: Colors.grey.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Location",
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: TextEditingController(text: "${lat} 'N ${long}'E"),
                enabled: true,
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black)),
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
                ),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 300,
              height: 400,
              child: _kGooglePlex == null
                  ? Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Stack(
                      children: [
                        GoogleMap(
                          onTap: (LatLng) async {
                            setState(() {
                              mymarker.add(Marker(
                                  markerId: MarkerId("1"), position: LatLng));
                              lat = LatLng.latitude;
                              long = LatLng.longitude;
                            });
                          },
                          markers: mymarker,
                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex!,
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                          },
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop('${lat}/${long}');
              },
              child: Container(
                alignment: Alignment.center,
                child: Text("Confirm Location"),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.greenAccent),
              ),
            )
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter_profile/app_colors.dart';

import 'package:flutter_profile/logger/AppLog.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final String _tag = 'LocationScreen';

  String _latitude = '';
  String _longitude = '';
  String _errorMessage = '';

  Future<Object> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    _latitude = '';
    _longitude = '';
    _errorMessage = '';

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.;
      setState(() {
        _errorMessage = 'Error: Location services are disabled.';
      });
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        setState(() {
          _errorMessage = 'Error: Location permissions are denied';
        });
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      setState(() {
        _errorMessage =
            'Error: Location permissions are permanently denied, we cannot request permissions.';
      });
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _latitude = position.latitude.toString();
        _longitude = position.longitude.toString();
      });
    } catch (e) {
      AppLog.e(
        'getLocation() error: $e',
        tag: _tag,
      );
      setState(() {
        _errorMessage = 'Error getting location: $e';
      });
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    AppLog.d(
      'Location permissions are granted, Your Location:  $_latitude latitude, $_longitude longitude',
      tag: _tag,
    );
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          decoration: const BoxDecoration(
              // border: Border(
              //   bottom: BorderSide(color: Colors.black),
              // ),
              ),
          child: AppBar(
            backgroundColor: AppColors.bgColor,
            title: const Text(
              "Geolocator Library",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            centerTitle: false,
            elevation: 0,
          ),
        ),
      ),
      body: Container(
        color: AppColors.bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              if (_latitude.isNotEmpty && _longitude.isNotEmpty)
                Text(
                  "LATITUDE: $_latitude, \n LONGITUDE: $_longitude",
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(AppColors.blueColor),
                ),
                onPressed: () {
                  // Get location here
                  getLocation();
                },
                child: const Text("Get location"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

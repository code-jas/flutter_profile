import 'package:flutter/material.dart';
import 'package:flutter_profile/app_colors.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor, // Set the background color of the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "About Tab",
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
      // child: GridView.builder(
      //   itemCount: 5,
      //   gridDelegate:
      //       const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      //   itemBuilder: (context, index) => Padding(
      //     padding: const EdgeInsets.all(2.0),
      //     child: Container(
      //       color: Colors.amber[100],
      //     ),
      //   ),
      // ),
    );
  }
}

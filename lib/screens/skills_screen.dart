import 'package:flutter/material.dart';
import 'package:flutter_profile/app_colors.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor, // Set the background color of the container
      child: GridView.builder(
        itemCount: 5,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            child: const Text("Skills"),
            color: Colors.red[100],
          ),
        ),
      ),
    );
  }
}

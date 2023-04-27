import 'package:flutter/material.dart';
import 'package:flutter_profile/app_colors.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
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
            color: AppColors.contColor,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_profile/app_colors.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  // define a list of data for each container
  final List<Map<String, String>> _data = [
    {
      'image': 'assets/images/portfolio/bookly_mockup_transparent.png',
      'title': 'Bookly',
      'details': 'Lorem ipsum Details sdlkfjd;lkfjsa More Details',
    },
    {
      'image': 'assets/images/portfolio/phfestival_mockup_transparent.png',
      'title': 'PH Festival',
      'details': 'Lorem ipsum Details sdlkfjd;lkfjsa More Details',
    },
    {
      'image': 'assets/images/portfolio/alpas_mockup_transparent.png',
      'title': 'Alpas',
      'details': 'Lorem ipsum Details sdlkfjd;lkfjsa More Details',
    },
    // add more data for additional containers
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor, // Set the background color of the container
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: (_data.length / 3).ceil(),
            itemBuilder: (context, index) {
              final startIndex = index * 3;
              final endIndex = startIndex + 3;
              final containersData = _data.sublist(startIndex, endIndex);
              return Column(
                children: [
                  const Text(
                    'Portfolio',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  for (final containerData in containersData)
                    Column(
                      children: [
                        Container(
                          height: 300,
                          color: AppColors.bgColor,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(containerData['image']!),
                                  fit: BoxFit.cover,
                                ),
                                color: AppColors.contColor,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                  // child: Text(
                                  //   containerData['image']!,
                                  //   style: const TextStyle(
                                  //     fontSize: 20,
                                  //     fontWeight: FontWeight.bold,
                                  //     color: AppColors.textColor,
                                  //   ),
                                  // ),
                                  ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              containerData['title']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              containerData['details']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textColorAlt,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

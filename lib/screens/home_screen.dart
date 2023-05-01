import 'package:flutter/material.dart';
import 'package:flutter_profile/app_colors.dart';
import 'package:flutter_profile/screens/movies_screen.dart';
import 'package:flutter_profile/screens/location_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//         child: Center(
//       child: Text("Location Screen"),
//     ));
//   }
// }

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  // Widget _listViewBody() {
  //   return ListView.separated(
  //       controller: _homeController,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Center(
  //           child: Text(
  //             'Item $index',
  //           ),
  //         );
  //       },
  //       separatorBuilder: (BuildContext context, int index) => const Divider(
  //             thickness: 1,
  //           ),
  //       itemCount: 50);
  // }
  late List<Widget> tabs;

  @override
  void initState() {
    super.initState();

    tabs = [
      MoviesScreen(scrollController: _homeController),
      const LocationScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.open_in_new_rounded),
              label: 'Location',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: AppColors.textColor,
          selectedFontSize: 0,
          elevation: 0,
          unselectedFontSize: 0,
          selectedItemColor: AppColors.blueColor,
          backgroundColor: AppColors.bgColor,
          onTap: (int index) {
            switch (index) {
              case 0:
                // only scroll to top when current index is selected.
                if (_selectedIndex == index) {
                  _homeController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                }
                break;
            }
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
        ),
      ),
    );
  }
}

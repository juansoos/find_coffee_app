import 'dart:io';

import 'package:find_coffee_app/src/pages/home/bottom_navigation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ui_theme/ui_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              backgroundColor: CustomColors.cream,
              activeColor: CustomColors.brown,
              inactiveColor: CustomColors.lightBrown,
              items: const [
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outlined),
                  label: "Profile",
                )
              ],
            ),
            tabBuilder: (BuildContext context, int index) {
              return [
                CustomScaffold(
                  appBarTitle: "Find Coffee",
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: const Text('Profile'),
                  ),
                ),
              ][index];
            },
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text("Find Coffee"),
              elevation: 2,
            ),
            bottomNavigationBar: _BottomNavigation(
              position: currentPageIndex,
              onItemTapped: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
            ),
            body: [
              Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: const Text('Profile'),
              ),
            ][currentPageIndex],
          );
  }
}

class _BottomNavigation extends StatelessWidget {
  _BottomNavigation({required this.position, required this.onItemTapped});

  final int position;
  final Function(int) onItemTapped;

  final Map<String, BottomNavigationIconOptions> _navigationItems = {
    'Home': BottomNavigationIconOptions(
      selected: const Icon(Icons.home),
      unselected: const Icon(Icons.home_outlined),
    ),
    'Profile': BottomNavigationIconOptions(
      selected: const Icon(Icons.person),
      unselected: const Icon(Icons.person_outlined),
    )
  };

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTabBar(
            currentIndex: position,
            onTap: onItemTapped,
            items: _navigationItems.entries.map<BottomNavigationBarItem>(
              (entry) {
                final value = entry.value;

                return BottomNavigationBarItem(
                  activeIcon: value.selected,
                  icon: value.unselected,
                  label: entry.key,
                );
              },
            ).toList(),
          )
        : NavigationBar(
            selectedIndex: position,
            onDestinationSelected: onItemTapped,
            destinations: _navigationItems.entries.map<Widget>(
              (entry) {
                final value = entry.value;

                return NavigationDestination(
                  selectedIcon: value.selected,
                  icon: value.unselected,
                  label: entry.key,
                );
              },
            ).toList(),
          );
  }
}

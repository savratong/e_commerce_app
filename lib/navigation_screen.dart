import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/views/cart/cart_screen.dart';
import 'package:e_commerce_app/views/dashboard/dashboard_screen.dart';
import 'package:e_commerce_app/views/home/home_screen.dart';
import 'package:e_commerce_app/views/notification/noification_screen.dart';
import 'package:e_commerce_app/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
      CartScreen(),
      NotificationScreen(),
      ProfileScreen(),
      AdminScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                color: _selectedIndex == 0 ? primaryColor : navigationIconColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.wallet,
                color: _selectedIndex == 1 ? primaryColor : navigationIconColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card_outlined,
                color: _selectedIndex == 2 ? primaryColor : navigationIconColor,
              ),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                color: _selectedIndex == 3 ? primaryColor : navigationIconColor,
              ),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          iconSize: 24,
          // selectedIconTheme: IconThemeData(
          //   color: primaryColor
          // ),
          // unselectedIconTheme: IconThemeData(
          //   color: navigationIconColor
          // ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal, color: Colors.black),
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          onTap: _onItemTapped,
          elevation: 5),

      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        // child: SvgPicture.asset('assets/svg/scan_icon.svg'),
        onPressed: () {
          // Navigator.of(context).pushNamed(
          //   RouteGenerator.scanPage,
          // );
        },
      ),
    );
  }
}

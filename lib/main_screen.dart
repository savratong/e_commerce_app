import 'package:e_commerce_app/views/admin/admin_screen.dart';
import 'package:e_commerce_app/views/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'views/home/home_screen.dart';
import 'views/cart/cart_screen.dart';
import 'views/profile/profile_screen.dart';

class ManinScreen extends StatelessWidget {
  const ManinScreen({super.key});
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const CartScreen(),
      const FavoriteScreen(),
      const ProfileScreen(),
      const AdminScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: ("Saved"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Admin"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //*Call to use it screen
    // return const BottomNavigatorBar();
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    return Scaffold(
      body: const Center(
        
      )
      ,
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        // hideNavigationBar: true,
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// import 'views/admin/admin_screen.dart';
// import 'views/home/home_screen.dart';
// import 'views/cart/cart_screen.dart';
// import 'views/favorite/favorite_screen.dart';
// import 'views/profile/profile_screen.dart';

// class ManinScreen extends StatefulWidget {
//   const ManinScreen({Key? key}) : super(key: key);

//   @override
//   _ManinScreenState createState() => _ManinScreenState();
// }

// class _ManinScreenState extends State<ManinScreen> {
//   late PersistentTabController _controller;

//   @override
//   void initState() {
//     _controller = PersistentTabController(initialIndex: 0);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> screens = [
//       const HomeScreen(),
//       const CartScreen(),
//       const NotificationScreen(),
//       const ProfileScreen(),
//       const AdminScreen(),
//     ];

//     List<PersistentBottomNavBarItem> navBarItems = [
//       PersistentBottomNavBarItem(
//           icon: const Icon(Icons.home),
//           title: "Home",
//           activeColorPrimary: Colors.blue,
//           inactiveColorPrimary: Colors.grey),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.shopping_cart),
//         title: "Cart",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.favorite),
//         title: "Saved",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.person),
//         title: "Profile",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.settings),
//         title: "Admin",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//       ),
//     ];

//     return WillPopScope(
//       onWillPop: () async {
//         if (_controller.index != 0) {
//           _controller.jumpToTab(0);
//           return false;
//         }
//         return true;
//       },
//       child: Scaffold(
//         body: PersistentTabView(
//           context,
//           controller: _controller,
//           screens: screens,
//           items: navBarItems,
//           confineInSafeArea: true,
//           backgroundColor: Colors.white,
//           handleAndroidBackButtonPress: true,
//           resizeToAvoidBottomInset: true,
//           stateManagement: true,
//           hideNavigationBarWhenKeyboardShows: true,
//           decoration: NavBarDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             colorBehindNavBar: Colors.white,
//           ),
//           popAllScreensOnTapOfSelectedTab: true,
//           popActionScreens: PopActionScreensType.all,
//           itemAnimationProperties: const ItemAnimationProperties(
//             duration: Duration(milliseconds: 200),
//             curve: Curves.ease,
//           ),
//           screenTransitionAnimation: const ScreenTransitionAnimation(
//             animateTabTransition: true,
//             curve: Curves.ease,
//             duration: Duration(milliseconds: 200),
//           ),
//           navBarStyle: NavBarStyle.style6,
//         ),
//       ),
//     );
//   }
// }

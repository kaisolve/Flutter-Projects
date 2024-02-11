// Widget _buildIconButton(BuildContext context, IconData iconData,
//     {bool isGreen = false}) {
//   return Container(
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       color: isGreen ? const Color(0xFF2DACA3) : Colors.transparent,
//       // boxShadow: isGreen
//       //     ? [
//       //         BoxShadow(
//       //           color: Colors.white.withOpacity(0.5),
//       //           spreadRadius: 2,
//       //           blurRadius: 8,
//       //           offset: Offset(0, 3),
//       //         ),
//       //       ]
//       //     : [],
//     ),
//     child: IconButton(
//       icon: Icon(iconData, color: isGreen ? Colors.white : Colors.black),
//       onPressed: () {
//         // Navigate to the corresponding page
//         _navigateToPage(context, iconData);
//       },
//     ),
//   );
// }

 // ButtonBar with IconButton widgets at the bottom
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     color: Colors.grey[200],
          //   ),
          //   child: ButtonBar(
          //     alignment: MainAxisAlignment.center,
          //     children: [
          //       _buildIconButton(context, Icons.home),
          //       _buildIconButton(context, Icons.date_range),
          //       _buildIconButton(context, Icons.search, isGreen: true),
          //       _buildIconButton(context, Icons.notifications),
          //       _buildIconButton(context, Icons.settings),
          //     ],
          //   ),
          // ),
  
  // void _navigateToPage(BuildContext context, IconData iconData) {
  //   switch (iconData) {
  //     case Icons.home:
  //       // Navigate to the home page
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const HomePage()),
  //       );
  //       break;
  //     case Icons.date_range:
  //       // Navigate to the appointment page
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const AppointmentPage()),
  //       );
  //       break;
  //     case Icons.search:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const DoctorListPage()),
  //       );
  //       // No need to navigate, already on the home page
  //       break;
  //     case Icons.notifications:
  //       // Navigate to the notification page
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => const NotificationPage('Notifications')),
  //       );
  //       break;
  //     case Icons.settings:
  //       // Navigate to the settings page
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => const SettingPage('Settings')),
  //       );
  //       break;
  //   }
  // }


  // bottomNavigationBar: Container(
  //   decoration: BoxDecoration(
  //       boxShadow: Colors.red,
  //       borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //       color: Colors.green.shade400),
  //   // color: Colors.grey.shade200,
  //   child: GNav(
  //     rippleColor:
  //         const Color(0xFF2DACA3), // tab button ripple color when pressed
  //     gap: 8, // the tab button gap between icon and text
  //     color: Colors.grey[800], // unselected icon color
  //     activeColor: Color(0xFF2DACA3), // selected icon and text color
  //     iconSize: 24, // tab button icon size
  //     // tabBackgroundColor:
  //     //     Color(0xFF2DACA3), // selected tab background color
  //     padding: const EdgeInsets.symmetric(
  //         horizontal: 20, vertical: 20), // navigation bar padding
  //     tabs: const [
  //       GButton(
  //         icon: Icons.home,
  //         text: 'Home',

  //         // onPressed: onItemTapped,
  //         // onPressed: () {
  //         //   Navigator.push(
  //         //     context,
  //         //     MaterialPageRoute(builder: (context) => const HomePage()),
  //         //   );
  //         // },
  //       ),
  //       GButton(
  //         icon: Icons.date_range,
  //         text: 'Date',
  //         // onPressed: () {
  //         //   Navigator.push(
  //         //     context,
  //         //     MaterialPageRoute(
  //         //         builder: (context) => const AppointmentPage()),
  //         //   );
  //         // },
  //       ),
  //       GButton(
  //         icon: Icons.search,
  //         text: 'Search',
  //         // onPressed: () {
  //         //   Navigator.push(
  //         //     context,
  //         //     MaterialPageRoute(
  //         //         builder: (context) => const DoctorListPage()),
  //         //   );
  //         // },
  //       ),
  //       GButton(
  //         icon: Icons.menu,
  //         text: 'Menu',
  //         // onPressed: () {
  //         //   Navigator.push(
  //         //     context,
  //         //     MaterialPageRoute(
  //         //         builder: (context) => const SettingPage("")),
  //         //   );
  //         // },
  //       )
  //     ],
  //   ),
  // ),
  // body: pages.elementAt(selectedIndex), //New
  // bottomNavigationBar: BottomNavigationBar(
  //   selectedItemColor:
  //       Colors.green, // Adjust the color of the selected item
  //   unselectedItemColor:
  //       Colors.black, // Adjust the color of unselected items
  //   selectedLabelStyle: const TextStyle(
  //       fontSize:
  //           14), // Optional: Adjust the font size of the selected label
  //   unselectedLabelStyle: const TextStyle(
  //       fontSize:
  //           12), // Optional: Adjust the font size of unselected labels
  //   items: const <BottomNavigationBarItem>[
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.home),
  //       label: 'Home',
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.date_range),
  //       label: 'Date',
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.search),
  //       label: 'Camera',
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.notifications),
  //       label: 'Camera',
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.settings),
  //       label: 'Chats',
  //     ),
  //   ],
  //   onTap: onItemTapped,
  //   currentIndex: selectedIndex,
  // ),

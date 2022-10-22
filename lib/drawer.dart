import 'package:flutter/material.dart';

import 'widgets/drawer_item.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      width: screenWidth * .82,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.deepPurple,
                // width: screenWidth * .78,
                // decoration: const BoxDecoration(
                //   color: Colors.deepPurple,
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(100),
                //   ),
                // ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        Image(
                          height: 180,
                          width: 210,
                          image: AssetImage('assets/2.png'),
                        ),
                        Text(
                          'Smart Blood Donation \n System',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.deepPurple,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70),
                      topLeft: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      DrawerItem(
                        name: 'Awareness from Experts',
                        fontSize: 18,
                        onTap: () {},
                        icon: const Icon(
                          Icons.wb_incandescent_sharp,
                          size: 30,
                          color: Colors.purple,
                        ),
                      ),
                      DrawerItem(
                        name: 'Appreciation',
                        fontSize: 18,
                        icon: const Icon(
                          Icons.done_all_outlined,
                          size: 30,
                          color: Colors.purple,
                        ),
                        onTap: () {},
                      ),
                      DrawerItem(
                        name: 'Incentives',
                        fontSize: 18,
                        icon: const Icon(
                          Icons.person_add,
                          size: 30,
                          color: Colors.purple,
                        ),
                        onTap: () {},
                      ),
                      DrawerItem(
                        name: 'About Us',
                        fontSize: 18,
                        icon: const Icon(
                          Icons.wb_incandescent_sharp,
                          size: 30,
                          color: Colors.purple,
                        ),
                        onTap: () {},
                      ),
                      DrawerItem(
                        name: 'Change Password',
                        fontSize: 18,
                        icon: const Icon(
                          Icons.lock,
                          size: 30,
                          color: Colors.purple,
                        ),
                        onTap: () {},
                      ),
                      DrawerItem(
                        name: 'Log Out',
                        fontSize: 18,
                        icon: const Icon(
                          Icons.logout,
                          size: 30,
                          color: Colors.purple,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

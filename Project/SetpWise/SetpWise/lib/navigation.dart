import 'package:flutter/material.dart';
import 'package:setpwise/customtile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:setpwise/login.dart';
import 'package:setpwise/profile_edit.dart';
import 'package:setpwise/rap.dart';
import 'counter.dart';
import 'profile.dart';

class navigation extends StatefulWidget {
  static const String id = 'navigation';

  const navigation({Key? key}) : super(key: key);

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  final _auth = FirebaseAuth.instance;

  List<Widget> listofpages = [
    counter(),
    ProfileScreen()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Stepwise',style: TextStyle(
          fontFamily: 'Elsie',
          fontSize: 30,
          color: Color(0xff08c2b7),
        ),),
        backgroundColor: Color(0xffEFEFBB),
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
      ),
      drawer: Drawer(
        width: 300,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ClipOval(

                        child: Image(
                          image: AssetImage('assets/images/img_1.png'),
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),

                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => navigation()),
                      );
                    },
                    child: customListTile(
                      itemIcon: Icons.home_outlined,
                      itemTitle: 'Home',
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileEditScreen()),
                      );
                    },
                    child: customListTile(
                      itemIcon: Icons.person_add,
                      itemTitle: 'Update Profile',
                    ),
                  ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportProblemPage()),
              );
            },
            child:
            customListTile(
                    itemIcon: Icons.report_problem_outlined,
                    itemTitle: 'Report a Problem',
                  ),
          ),
                ],
              ),
              InkWell(
                  onTap: () {
                    _auth.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: customListTile(
                      itemIcon: Icons.logout, itemTitle: 'Sign Out'))
            ],
          ),
        ),
      ),
      body: listofpages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffEFEFBB),
        onTap: (nextIndex) {
          setState(() {
            _selectedIndex = nextIndex;
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ],
      ),
    );
  }
}

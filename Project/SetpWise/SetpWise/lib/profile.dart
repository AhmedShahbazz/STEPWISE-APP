import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:setpwise/profile_edit.dart';

class ProfileScreen extends StatefulWidget {


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final userData = _auth.currentUser;
    String? name = userData?.displayName;
    name ??= 'Not Set Yet';
    String? email = userData?.email;
    email ??= 'Not Set Yet';
    String? photoURL = userData?.photoURL;
    photoURL ??=
        'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png';
    print(userData);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffEFEFBB),
              Colors.grey,
            ],
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black26,
                Colors.black45,
              ],
            ),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.green,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: photoURL,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 1, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.grey,
                                  elevation: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ListTile(
                                        contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 17, vertical: 8),
                                        title: Text(
                                          'Name:',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'ita',
                                              color: Colors.black),
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 17, vertical: 8),
                                        title: Text(
                                          name,
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'ita',
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.grey,
                                  elevation: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ListTile(
                                        contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 6),
                                        title: Text(
                                          'Email:',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'ita',
                                              color: Colors.black),
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 6),
                                        title: Text(
                                          email,
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'ita',
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )

                            ],
                          ),
                          GestureDetector(
                            onTap: () async {
                              bool refresh = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return ProfileEditScreen();
                                }),
                              );
                              if (refresh == true) {
                                setState(() {});
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width * 0.80,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Edit Profile',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

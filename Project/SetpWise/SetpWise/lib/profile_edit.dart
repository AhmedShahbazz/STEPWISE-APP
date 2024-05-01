import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:setpwise/utils.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  static const pageName = '/profile';

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey();
  final displayName = TextEditingController();
  final displayemail = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    final userData = _auth.currentUser;
    String? name = userData?.displayName;
    name ??= 'Not Set Yet';
    String? email = userData?.email;
    email ??= 'Not Set Yet';

    displayName.text = name;
    displayemail.text = email;
    super.initState();
  }

  void updateProfile() {
    _auth.currentUser
        ?.updateDisplayName(displayName.text.toString())
        .then((value) async {
      if (_image != null) {
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref('users/${_auth.currentUser?.uid}/profile_picture.png');
        firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);

        await Future.value(uploadTask);
        var newUrl = await ref.getDownloadURL();

        final userData = _auth.currentUser;
        userData?.updatePhotoURL(newUrl);
      }

      Future.delayed(Duration(seconds: 2)).then((_) {
        Navigator.pop(context, true);
        setState(() {
          loading = false;
        });
      }).catchError((error) {
        utils().toastMessage(error.toString());
      });
    }).catchError((error) {
      utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  File? _image;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        print(pickedFile.path);
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Container(
            width: 400,
            height: 700,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(10.0),
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: getImage,
                            child: _image == null
                                ? CircleAvatar(
                                    radius: 50.0,
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 40.0,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: FileImage(_image!),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: displayName,
                            onChanged: (value) {
                              displayName.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: displayName.text.length));
                            },
                            onTap: () {
                              displayName.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: displayName.text.length));
                            },
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'ita',
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                                fillColor: Color(0xFF3d424c),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                hintText: 'Enter Your Name',
                                prefixIcon: Icon(
                                  Icons.supervised_user_circle,
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'ita',
                                    color: Colors.black)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            enabled: false,
                            controller: displayemail,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'ita',
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              fillColor: Color(0xFF3d424c),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              hintText: 'Enter Your Email',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.all(40),
                            width: MediaQuery.of(context).size.width * 0.80,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  updateProfile();
                                  setState(() {
                                    loading = true;
                                  });
                                },
                                child: Center(
                                  child: loading
                                      ? CircularProgressIndicator(
                                          strokeWidth: 5,
                                          color: Colors.white,
                                        )
                                      : Text('Update',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'ita',
                                              color: Colors.white),
                                          textAlign: TextAlign.center),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookLogin extends StatefulWidget {
  const FacebookLogin({Key? key}) : super(key: key);

  @override
  _FacebookLoginState createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {
  bool loggedIn = false;

  AccessToken? _accessToken;
  UserModel? _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook Login'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget() {
    UserModel? user = _currentUser;
    print('=============> $user');
    if (user != null) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 250,
                  width: 300,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Profile Info',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: NetworkImage(user.pictureModel!.url!),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Name: ' + user.name!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Email: ' + user.email!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'ID: ' + user.id!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ListTile(
            //   leading: CircleAvatar(
            //     radius: user.pictureModel!.width! / 6,
            //     backgroundImage: NetworkImage(user.pictureModel!.url!),
            //   ),
            //   title: Text(user.name!),
            //   subtitle: Text(user.email!),
            // ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Signed in successfully',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            // ElevatedButton(onPressed: signOut, child: const Text('Sign out')),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  minimumSize: const Size(double.infinity, 50)),
              onPressed: signOut,
              label: const Text(
                'Log out',
                style: TextStyle(fontSize: 15),
              ),
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'You are not signed in',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 20,
            ),
            // ElevatedButton(onPressed: signIn, child: const Text('Sign in')),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  onPrimary: Colors.white,
                  minimumSize: const Size(double.infinity, 50)),
              onPressed: signIn,
              label: const Text(
                'Login with Facebook',
                style: TextStyle(fontSize: 15),
              ),
              icon: const Icon(
                FontAwesomeIcons.facebook,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      );
    }
  }

  Future<void> signIn() async {
    final LoginResult result = await FacebookAuth.i.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final data = await FacebookAuth.i.getUserData();
      UserModel model = UserModel.fromJson(data);

      _currentUser = model;
      setState(() {});
    }
  }

  Future<void> signOut() async {
    await FacebookAuth.i.logOut();
    _currentUser = null;
    _accessToken = null;
    setState(() {});
  }
}

class UserModel {
  final String? email;
  final String? id;
  final String? name;
  final PictureModel? pictureModel;

  const UserModel({this.name, this.pictureModel, this.email, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'],
      id: json['id'] as String?,
      name: json['name'],
      pictureModel: PictureModel.fromJson(json['picture']['data']));
}

class PictureModel {
  final String? url;
  final int? width;
  final int? height;

  const PictureModel({this.width, this.height, this.url});

  factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(
      url: json['url'], width: json['width'], height: json['height']);
}

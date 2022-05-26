// import 'package:flutter/material.dart';
//
//
// class FacebookLoggedInPage extends StatelessWidget {
//   // final GoogleSignInAccount user;
//
//   // GoogleLoggedInPage({
//   //   Key? key,
//   //   required this.user,
//   // }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Google Profile'),
//         actions: [
//           TextButton(
//             onPressed: () async {
//               await GoogleSignInApi.logout();
//
//               Navigator.pushReplacement<void, void>(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => LoginPage(),
//                 ),
//               );
//             },
//             child: const Text(
//               'Logout',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: Card(
//           elevation: 10,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           color: Colors.blueGrey,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               height: 250,
//               width: 300,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Profile Info',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       fontStyle: FontStyle.italic,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   CircleAvatar(
//                     radius: 40.0,
//                     backgroundImage: NetworkImage(user.photoUrl!),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     'Name: ' + user.displayName!,
//                     style: const TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     'Email: ' + user.email,
//                     style: const TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     'ID: ' + user.id,
//                     style: const TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

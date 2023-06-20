// import 'package:flutter/material.dart';
// import 'package:groceryapp/model/cart_model.dart';
// import 'package:provider/provider.dart';
// import 'pages/intro_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // using imported provider
//     return ChangeNotifierProvider(
//       create: (context) => CartModel(),
//       child: const MaterialApp(
//         //debug banner
//         debugShowCheckedModeBanner: false,
//         home: IntroScreen(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

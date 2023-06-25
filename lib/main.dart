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
import 'package:groceryapp/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:groceryapp/pages/my_data.dart';
//import 'package:groceryapp/pages/home_page.dart';
//import 'package:groceryapp/pages/intro_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // using imported provider
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: HomePage(),
        //home: StoredData(),
        home: AuthPage(),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // Retrive image from firestore
  // void fetchData() async {
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection('products').get();
  //   List<QueryDocumentSnapshot> documents = snapshot.docs;

  //   // process each document
  //   for (QueryDocumentSnapshot doc in documents) {
  //     String name = doc.data()['name'];
  //     int price = doc.data()['price'];
  //     String imageUrl = doc.data()['image'];
  //   }
  // }

  //import 'package:cloud_firestore/cloud_firestore.dart';

// Retrieve data from Firestore
// Retrieve data from Firestore
  // void fetchProductData() async {
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection('products').get();
  //   List<QueryDocumentSnapshot> documents = snapshot.docs;

  //   // Process each document
  //   for (QueryDocumentSnapshot doc in documents) {
  //     Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
  //     if (data != null) {
  //       String? name = data['name'] as String?;
  //       int? price = data['price'] as int?;
  //       String? imageUrl = data['imageUrl'] as String?;

  //       // Use the data in your app
  //       if (name != null && price != null && imageUrl != null) {
  //         print('Name: $name, Price: $price, Image URL: $imageUrl');
  //       }
  //     }
  //   }
  // }

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('user: ${user.email!}'),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Text(
            //   "LOGGED IN AS : ${user.email!}",
            //   style: const TextStyle(fontSize: 20),
            // ),
            // banana logo for grocery in intro page
            Padding(
              padding: const EdgeInsets.only(
                left: 100.0,
                right: 100.0,
                top: 120,
                bottom: 20,
              ),
              child: Image.asset('lib/images/banana.png'),
            ),

            // we deliver groceries at your doorstep
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Welcome, Fresh grocery available. You order we deliver',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Fresh grocery items everyday',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 24),

            const Spacer(),

            // start shopping button

            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 9, 212, 151),
                ),
                child: const Text(
                  "Start Shopping",
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

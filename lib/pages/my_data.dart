// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping App'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('products').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           final products = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index].data() as Map<String, dynamic>;
//               final itemName = product['name'] as String;
//               final itemPrice = product['price'] as int;
//               final imageUrl = product['image'] as String;

//               return FutureBuilder<String>(
//                 future: firebase_storage.FirebaseStorage.instance
//                     .ref(imageUrl)
//                     .getDownloadURL(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }

//                   final downloadUrl = snapshot.data!;

//                   return ListTile(
//                     leading: Image.network(downloadUrl),
//                     title: Text(itemName),
//                     subtitle: Text('Price: \$$itemPrice'),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// MORE ERRORS
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping App'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('products').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           final products = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index].data() as Map<String, dynamic>;
//               final itemName = product['name'] as String;
//               final itemPrice = product['price'] as int;
//               final imageUrl = product['image'] as String;

//               return FutureBuilder<Uri>(
//                 future: firebase_storage.FirebaseStorage.instance
//                     .refFromURL(imageUrl)
//                     .getDownloadURL(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }

//                   final downloadUrl = snapshot.data!;

//                   return ListTile(
//                     leading: Image.network(downloadUrl.toString()),
//                     title: Text(itemName),
//                     subtitle: Text('Price: \$$itemPrice'),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// EVEN BETTER
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final products = snapshot.data!.docs;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index].data() as Map<String, dynamic>;
              final itemName = product['name'] as String;
              final itemPrice = product['price'] as int;
              final imageUrl = product['image'] as String;

              return ListTile(
                //leading: Image.asset('lib/images/banana.png'),
                leading: Image.network(imageUrl),
                title: Text(itemName),
                subtitle: Text('Price: Ksh $itemPrice'),
              );
            },
          );
        },
      ),
    );
  }
}


// FROM chatGPT => working
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class StoredData extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stored Data'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('products').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           List<DocumentSnapshot> documents = snapshot.data!.docs;
//           return ListView.builder(
//             itemCount: documents.length,
//             itemBuilder: (context, index) {
//               String name = documents[index]['name'];
//               int age = documents[index]['price'];
//               String city = documents[index]['image'];

//               return ListTile(
//                 title: Text(name),
//                 subtitle: Text('Age: $age, City: $city'),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


// FROM bard.google => working
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class StoredData extends StatefulWidget {
//   @override
//   _StoredDataState createState() => _StoredDataState();
// }

// class _StoredDataState extends State<StoredData> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stored Data'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('products').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView(
//               children: snapshot.data!.docs.map((doc) {
//                 return ListTile(
//                   title: Text(doc['name']),
//                   subtitle: Text(doc['price'].toString()),
//                   //trailing: Text(doc['image']),
//                 );
//               }).toList(),
//             );
//           } else {
//             return Center(child: Text('No data'));
//           }
//         },
//       ),
//     );
//   }
// }

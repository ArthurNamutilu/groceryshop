import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoredData extends StatefulWidget {
  @override
  _StoredDataState createState() => _StoredDataState();
}

class _StoredDataState extends State<StoredData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stored Data'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return ListTile(
                  title: Text(doc['name']),
                  subtitle: Text(doc['price'].toString()),
                  //trailing: Text(doc['image']),
                );
              }).toList(),
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}







// import 'package:firebase/firebase.dart';

// void main() {
//   // Create a DatabaseReference object to the Firebase database.
//   var ref = FirebaseDatabase.instance.ref("users/123");

//   // Use the once() method to retrieve the data once.
//   Future<DatabaseEvent> event = ref.once();

//   // Listen for the event and get the data.
//   event.then((event) {
//     // Get the data as a Dart object.
//     var data = event.snapshot.value;

//     // Display the data in your Flutter app.
//     print(data);
//   });
// }



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// class MyData extends StatefulWidget {
//   @override
//   _MyDataState createState() => _MyDataState();
// }

// class _MyDataState extends State<MyData> {
//   List<Map<String, dynamic>> dataList = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     QuerySnapshot snapshot =
//         await FirebaseFirestore.instance.collection('products').get();
//     List<QueryDocumentSnapshot> documents = snapshot.docs;

//     List<Map<String, dynamic>> fetchedData = [];

//     // Process each document
//     for (QueryDocumentSnapshot doc in documents) {
//       Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
//       if (data != null) {
//         String? name = data['name'] as String?;
//         int? price = data['price'] as int?;
//         String? imageUrl = data['imageUrl'] as String?;

//         // Add the data to the list
//         if (name != null && price != null && imageUrl != null) {
//           fetchedData.add({
//             'name': name,
//             'price': price,
//             'imageUrl': imageUrl,
//           });
//         }
//       }
//     }

//     setState(() {
//       dataList = fetchedData;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Data'),
//       ),
//       body: dataList.isNotEmpty
//           ? ListView.builder(
//               itemCount: dataList.length,
//               itemBuilder: (context, index) {
//                 final item = dataList[index];
//                 return ListTile(
//                   title: Text(item['name']),
//                   subtitle: Text('Price: ${item['price']}'),
//                   leading: Image.network(item['imageUrl']),
//                 );
//               },
//             )
//           : Center(
//               child: Text('Fetching data from Firestore...'),
//             ),
//     );
//   }
// }

/* ****************************************************************** */
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MyData extends StatefulWidget {
//   @override
//   _MyDataState createState() => _MyDataState();
// }

// class _MyDataState extends State<MyData> {
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     QuerySnapshot snapshot =
//         await FirebaseFirestore.instance.collection('products').get();
//     List<QueryDocumentSnapshot> documents = snapshot.docs;

//     // Process each document
//     for (QueryDocumentSnapshot doc in documents) {
//       Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
//       if (data != null) {
//         String? name = data['name'] as String?;
//         int? price = data['price'] as int?;
//         String? imageUrl = data['imageUrl'] as String?;

//         // Use the data in your app
//         if (name != null && price != null && imageUrl != null) {
//           print('Name: $name, Price: $price, Image URL: $imageUrl');
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Data'),
//       ),
//       body: Center(
//         child: Text('Fetching data from Firestore...'),
//       ),
//     );
//   }
// }

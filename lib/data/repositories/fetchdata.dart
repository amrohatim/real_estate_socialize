import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Gdata extends StatefulWidget {
  const Gdata({super.key});

  @override
  State<Gdata> createState() => _GdataState();
}

class _GdataState extends State<Gdata> {
  final CollectionReference getcollection =
      FirebaseFirestore.instance.collection('NEW');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: getcollection.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot doucmentsnap =
                        streamSnapshot.data!.docs[index];
                    return Material(
                      child: Text(doucmentsnap.id),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

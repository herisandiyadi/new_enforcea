import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/consultant_item_card.dart';

class PPNPage extends StatefulWidget {
  const PPNPage({super.key});

  @override
  State<PPNPage> createState() => _PPNPageState();
}

class _PPNPageState extends State<PPNPage> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        title: const Text('Chat Consultant'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: db
                  .collection('users')
                  .where('role', isEqualTo: 'consultant')
                  .where('expertise', arrayContains: 'PPN & PPnBM')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 15, left: 15),
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, i) {
                          final agenData = snapshot.data!.docs[i];
                          List<dynamic> expertiseAgent = agenData['expertise'];

                          List review = agenData['reviews'];

                          final lenght = review.length;
                          List rating = review.map((e) => e['rating']).toList();
                          final results =
                              (rating.reduce((a, b) => a + b) / lenght);
                          final ratings = results.toStringAsFixed(1);

                          return ConsultantItemCard(
                              reviews: review,
                              lenghtRating: lenght,
                              agenData: agenData,
                              expertiseAgent: expertiseAgent,
                              ratings: ratings);
                        },
                      ),
                    ),
                  );
                }
                return Container();
              }),
        ],
      ),
    );
  }
}

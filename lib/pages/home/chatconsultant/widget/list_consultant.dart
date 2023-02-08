import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/all_consultant_page.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/consultant_item_card.dart';

class ListConsultant extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  const ListConsultant({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Consultants',
                  style: darkTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AllConsultant()));
                },
                child: Row(
                  children: [
                    Text(
                      'See more',
                      style: blueTextStyle.copyWith(
                          fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: blueColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 15, left: 15),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, i) {
                final agenData = snapshot.data!.docs[i];
                List<dynamic> expertiseAgent = agenData['expertise'];

                List review = agenData['reviews'];

                final lenght = review.length;
                List rating = review.map((e) => e['rating']).toList();
                final results = (rating.reduce((a, b) => a + b) / lenght);
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
        ),
      ],
    );
  }
}

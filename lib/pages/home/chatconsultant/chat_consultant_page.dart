import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/admin_pajak_page.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/aplikasi_pajak_page.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/kup_page.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/pph_page.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/ppn_page.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/widget/card_expert.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/widget/list_consultant.dart';

class ChatConsultantPage extends StatefulWidget {
  const ChatConsultantPage({super.key});

  @override
  State<ChatConsultantPage> createState() => _ChatConsultantPageState();
}

class _ChatConsultantPageState extends State<ChatConsultantPage> {
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.63,
            child: StreamBuilder<QuerySnapshot>(
                stream: db
                    .collection('users')
                    .where('role', isEqualTo: 'consultant')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListConsultant(snapshot: snapshot);
                  }
                  return Container();
                }),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: Text(
              'Atau cari Konsultan sesuai kebutuhanmu',
              style: darkTextStyle.copyWith(fontSize: 14, fontWeight: bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width - 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardExpertise(
                      label: 'PPH',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PPHPage(),
                          ),
                        );
                      },
                    ),
                    CardExpertise(
                      label: 'KUP',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const KUPPage(),
                          ),
                        );
                      },
                    ),
                    CardExpertise(
                      label: 'PPN & PPnBM',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PPNPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardExpertise(
                      label: 'Perpajakan International',
                      onPressed: () {},
                    ),
                    CardExpertise(
                      label: 'Administrasi Perpajakan',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AdminPajakPage(),
                          ),
                        );
                      },
                    ),
                    CardExpertise(
                      label: 'Aplikasi Perpajakan',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AplikasiPajakPage(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

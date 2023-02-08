import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/format.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class DetailBayarChat extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> agentData;
  const DetailBayarChat({super.key, required this.agentData});

  @override
  State<DetailBayarChat> createState() => _DetailBayarChatState();
}

class _DetailBayarChatState extends State<DetailBayarChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Pembayaran'),
        backgroundColor: redColor,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 28, left: 28, top: 28),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Biaya',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Text(
                      formatValue(50000),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 11,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Net',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Text(
                      formatValue(65000),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 11,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'PPN (11%)',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Text(
                      formatValue(500),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 11,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      formatValue(
                        1000,
                      ),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Spacer(),
          Divider(
            thickness: 2,
          ),
          Container(
            margin: EdgeInsets.only(right: 28, left: 28, bottom: 28),
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total Harga',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                formatValue(2000),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Colors.red,
                              width: 128,
                              height: 41,
                              child: const Center(
                                child: Text(
                                  'Bayar',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class DetailBayar extends StatelessWidget {
  const DetailBayar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        title: const Text('Detail Bayar'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [],
      )),
    );
  }
}

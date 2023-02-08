import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Page',
          style: whiteTextStyle.copyWith(fontSize: 18),
        ),
        backgroundColor: redColor,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              'Upload Dokumen',
              textAlign: TextAlign.center,
              style: darkTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Upload File',
              style: darkTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: greyColor,
                    ),
                    Text(
                      'Tap to upload your file',
                      style: greyTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(redColor)),
                      child: Row(
                        children: const [
                          Icon(Icons.upload_rounded),
                          Text('Upload'),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

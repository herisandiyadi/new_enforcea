import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Text('Events',
                    style: darkTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold)),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text('Lihat Lebih Banyak',
                        style: blueTextStyle.copyWith(fontSize: 11)),
                    const SizedBox(
                      width: 2,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: darkColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Image.asset(
                        'assets/new/event1.png',
                        scale: 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Chat Consultant',
                      style: darkTextStyle.copyWith(
                          fontSize: 18, fontWeight: bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Konsultasikan permasalahan pajak anda kepada ahli kami.',
                      style: darkTextStyle.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Image.asset(
                        'assets/new/event2.png',
                        scale: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Promo II',
                      style: darkTextStyle.copyWith(
                          fontSize: 18, fontWeight: bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Dapatkan promo pembelian buku Taxing Woman',
                      style: darkTextStyle.copyWith(fontSize: 14),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Berlaku s/d Juli 2022',
                            style: greyTextStyle.copyWith(fontSize: 10),
                          ),
                        ),
                        Text(
                          'Lihat Kode Promo',
                          style: greyTextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: greyColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

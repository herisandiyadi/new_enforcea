import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/pages/home/ukmdesk/widget/dropdown_company.dart';
import 'package:new_ukm_desk/pages/home/ukmdesk/widget/report_card_item.dart';
import 'package:new_ukm_desk/pages/home/ukmdesk/widget/row_menu_item.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.16,
            color: redColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: whiteColor,
                        ),
                        CarouselSlider(
                          items: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: whiteColor,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Subscription Status',
                                        style: darkTextStyle.copyWith(
                                            fontSize: 10),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'PT. ABC',
                                        style: darkTextStyle.copyWith(
                                            fontSize: 10),
                                      ),
                                      Text(
                                        '0 Month Left',
                                        style: darkTextStyle.copyWith(
                                            fontSize: 18),
                                      ),
                                      Text(
                                        '-',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: whiteColor,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Subscription Status',
                                        style: darkTextStyle.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'PT. XYZ',
                                        style: darkTextStyle.copyWith(
                                            fontSize: 10),
                                      ),
                                      Text(
                                        '3 Month Left',
                                        style: darkTextStyle.copyWith(
                                            fontSize: 18),
                                      ),
                                      Text(
                                        'until 23 Januari 2023',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                          options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            aspectRatio: 1.35,
                            initialPage: 1,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: whiteColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: whiteColor),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.add,
                                  color: darkColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Renew',
                              style: whiteTextStyle,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: whiteColor),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.shopping_cart_outlined,
                                    color: darkColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Cart',
                                style: whiteTextStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget menuIcon() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              RowMenuItems(
                  label: 'Beli Paket',
                  icon: Icons.inventory,
                  onPressed: () {
                    Navigator.pushNamed(context, '/ukmdesk');
                  }),
              RowMenuItems(
                  label: 'Upload',
                  icon: Icons.upload_rounded,
                  onPressed: () {
                    Navigator.pushNamed(context, '/upload');
                  }),
              RowMenuItems(
                  label: 'Chat', icon: Icons.upload_rounded, onPressed: () {}),
              RowMenuItems(
                  label: 'Log',
                  icon: Icons.text_snippet_outlined,
                  onPressed: () {}),
              RowMenuItems(
                  label: 'Template',
                  icon: Icons.article_outlined,
                  onPressed: () {}),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: whiteTextStyle.copyWith(fontSize: 18),
        ),
        backgroundColor: redColor,
      ),
      body: ListView(
        children: [
          header(),
          menuIcon(),
          const DropDownCompany(),
          ReportCardItem(
            label: 'Tax Report',
            onPressed: () {},
            fileName: 'asdasdasd.jpeg',
          ),
          ReportCardItem(
            label: 'Accounting Report',
            onPressed: () {},
            fileName: 'asdasdasd.jpeg',
          ),
        ],
      ),
    );
  }
}

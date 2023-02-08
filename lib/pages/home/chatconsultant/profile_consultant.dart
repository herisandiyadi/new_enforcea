import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_ukm_desk/constants/constants.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/pages/authentication/signinpage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../constants/cache_utils.dart';

class ProfileConsultant extends StatefulWidget {
  final List expertise;
  final String name;
  final String title;
  final int price;
  final String imgUrl;
  final String uuid;
  final String rating;
  final int lenghtRating;
  final List reviews;
  final int promo;
  final int oldPrice;
  final bool status;

  const ProfileConsultant({
    super.key,
    required this.expertise,
    required this.imgUrl,
    required this.name,
    required this.title,
    required this.rating,
    required this.lenghtRating,
    required this.oldPrice,
    required this.price,
    required this.uuid,
    required this.reviews,
    required this.promo,
    required this.status,
  });

  @override
  State<ProfileConsultant> createState() => _ProfileConsultantState();
}

class _ProfileConsultantState extends State<ProfileConsultant> {
  bool? isLogin;

  void login() async {
    await CacheUtil.getBoolean(cacheIsLogin).then((value) {
      if (value!) {
        setState(() {
          isLogin = value;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    Widget keahlian() {
      return Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: widget.expertise.map((data) {
                return Padding(
                  padding: const EdgeInsets.only(right: 3, bottom: 3),
                  child: Chip(
                    label: Text(
                      data,
                      style: darkTextStyle.copyWith(fontSize: 11),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      );
    }

    Widget buttonWidget() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: SizedBox(
          height: 55,
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(redColor),
            ),
            child: Text(
              'Bayar',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            onPressed: () {
              if (isLogin!) {
                if (widget.status) {
                  Alert(
                      context: context,
                      title: 'Maaf',
                      desc:
                          'Saat ini sedang offline, silahkan pilih Agent lain',
                      buttons: [
                        DialogButton(
                            color: Colors.red,
                            child: const Text(
                              'OK',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ]).show();
                } else {}
              } else {
                Alert(
                    context: context,
                    title: 'Maaf',
                    desc: 'Silahkan login terlebih dahulu',
                    buttons: [
                      DialogButton(
                          color: Colors.red,
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const SigninPage(),
                            ));
                          }),
                    ]).show();
              }
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: darkColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: widget.status == true
            ? Text(
                'Offline',
                style: redTextSytle,
              )
            : Text(
                'Online',
                style: greenTextStyle,
              ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // imageProfile(),
                // nameProfile(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 14, left: 28, right: 28, bottom: 28),
                  child: Row(
                    children: [
                      widget.imgUrl.isEmpty
                          ? const Icon(
                              Icons.broken_image,
                              size: 70,
                              color: greyColor,
                            )
                          : Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    widget.imgUrl,
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170,
                            child: Text(
                              widget.name,
                              maxLines: 2,
                              style: darkTextStyle.copyWith(
                                  fontSize: 22, fontWeight: regular),
                            ),
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Text(
                            widget.title,
                            style: darkTextStyle.copyWith(
                                fontSize: 12, fontWeight: light),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                keahlian(),
                SizedBox(
                  height: 300,
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: yellowColor,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              widget.rating,
                              // result.toStringAsFixed(1),
                              style: darkTextStyle.copyWith(
                                fontSize: 22,
                                fontWeight: bold,
                              ),
                            ),
                            // Text(
                            //     '${snapshot.data.documents[i].data['ratings']}')
                          ],
                        ),
                        Text(
                          'from ${widget.lenghtRating} reviews',
                          style: greyTextStyle.copyWith(fontSize: 10),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.29,
                          child: ListView(
                              children: widget.reviews.map((e) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    '${e['name']}',
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RatingBar.builder(
                                        initialRating: double.parse(
                                            (e['rating']).toString()),
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 15,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 15,
                                        ),
                                        ignoreGestures: true,
                                        onRatingUpdate: (rating) {
                                          // print(rating);
                                        },
                                      ),
                                      Text(e['review'])
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList()),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: widget.promo == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                widget.price == 0
                                    ? 'Free'
                                    : 'Rp. ${widget.price}',
                                style: widget.promo > 0 && widget.price != 0
                                    ? whiteTextStyle.copyWith(
                                        fontSize: 33,
                                        fontWeight: medium,
                                      )
                                    : whiteTextStyle.copyWith(
                                        fontSize: 33,
                                        fontWeight: medium,
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 11, top: 10),
                                child: Text(
                                  '/60 Minute',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Rp. ${widget.price}',
                                style: widget.promo > 0 && widget.price != 0
                                    ? whiteTextStyle.copyWith(
                                        fontSize: 33,
                                        fontWeight: medium,
                                      )
                                    : whiteTextStyle.copyWith(
                                        fontSize: 33,
                                        fontWeight: medium,
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 11, top: 10),
                                child: Text(
                                  ' Rp. ${widget.oldPrice}',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 13,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              )
                            ],
                          ),
                  ),
                ),
                // consultPrice(),

                buttonWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

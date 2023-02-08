import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/cache_utils.dart';
import 'package:new_ukm_desk/constants/constants.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/detail_bayar_chat.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/profile_consultant.dart';
import 'package:new_ukm_desk/pages/payment/detail_bayar/detail_bayar_chat.dart';
import 'package:new_ukm_desk/pages/widget/alert_login.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ConsultantItemCard extends StatefulWidget {
  const ConsultantItemCard(
      {Key? key,
      required this.agenData,
      required this.expertiseAgent,
      required this.ratings,
      required this.lenghtRating,
      required this.reviews})
      : super(key: key);

  final QueryDocumentSnapshot<Object?> agenData;
  final List expertiseAgent;
  final List reviews;
  final String ratings;
  final int lenghtRating;

  @override
  State<ConsultantItemCard> createState() => _ConsultantItemCardState();
}

class _ConsultantItemCardState extends State<ConsultantItemCard>
    with SingleTickerProviderStateMixin {
  bool isLogin = false;
  AnimationController? _animationController;

  blinkinStatus() async {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void checkLogin() async {
    await CacheUtil.getBoolean(cacheIsLogin).then((value) {
      if (value!) {
        isLogin = value;
      }
    });
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
    blinkinStatus();
  }

  @override
  Widget build(BuildContext context) {
    // print('isLogin build = $isLogin');
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProfileConsultant(
                expertise: widget.expertiseAgent,
                imgUrl: widget.agenData['img_url'],
                name: widget.agenData['fullname'],
                title: widget.agenData['title'],
                rating: widget.ratings,
                lenghtRating: widget.lenghtRating,
                oldPrice: widget.agenData['rate'],
                price: widget.agenData['promo'] == 0
                    ? widget.agenData['rate']
                    : widget.agenData['promo'],
                uuid: widget.agenData['img_url'],
                reviews: widget.reviews,
                promo: widget.agenData['promo'],
                status: widget.agenData['status'],
              ),
            ),
          );
        },
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: widget.agenData['img_url'] != ''
                            ? CachedNetworkImage(
                                imageUrl: '${widget.agenData['img_url']}',
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              )
                            : const Icon(
                                Icons.broken_image,
                                size: 70,
                                color: greyColor,
                              ),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: FadeTransition(
                          opacity: _animationController!,
                          child: Icon(
                            Icons.circle,
                            size: 16,
                            color: widget.agenData['status'] == true
                                ? redColor
                                : greenColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.agenData['fullname'],
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          children: widget.expertiseAgent.map((data) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  color: softGreyColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Wrap(
                                      children: [
                                        Text(
                                          data,
                                          style: darkTextStyle.copyWith(
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: yellowColor,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(widget.ratings),
                          ],
                        ),
                        widget.agenData['promo'] == 0
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  color: blueColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      widget.agenData['rate'] == 0
                                          ? 'Free'
                                          : 'Rp. ${widget.agenData['rate']}',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 11, fontWeight: bold),
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      color: greyColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          'Rp. ${widget.agenData['rate']}',
                                          style: whiteTextStyle.copyWith(
                                            fontSize: 11,
                                            fontWeight: bold,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      color: blueColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          'Rp. ${widget.agenData['promo']}',
                                          style: whiteTextStyle.copyWith(
                                            fontSize: 11,
                                            fontWeight: bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (isLogin) {
                      if (widget.agenData['status']) {
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
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailBayarChat(
                                    agentData: widget.agenData,
                                  )),
                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailBayarChat(
                        //       price: int.parse(widget.data.data['promo'] == 0
                        //           ? '${widget.data.data['rate']}'
                        //           : '${widget.data.data['promo']}'),
                        //       namaAgent: '${widget.data.data['fullname']}',
                        //       title: '${widget.data.data['title']}',
                        //       uuid: '${widget.data.data['uid']}',
                        //       uid: widget.userName,
                        //       userId: widget.userID,
                        //       promo: int.parse('${widget.data.data['promo']}'),
                        //       imgUrl: '${widget.data.data['img_url']}',
                        //       fcmKey: '${widget.data.data['fcm_key']}',
                        //     ),
                        //   ),
                        // );
                      }
                    } else {
                      AlertLogin().onCheckLogin(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(redColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Chat',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

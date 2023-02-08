import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:new_ukm_desk/constants/format.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/services/data_model/product/product_response.dart';

class ItemProduct extends StatelessWidget {
  final Product product;
  const ItemProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: MediaQuery.of(context).size.height * 0.62,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: product.productId % 2 == 0 ? whiteColor : navyColor,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.65,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  product.productName == 'UKM Desk Medium'
                      ? Row(
                          children: [
                            const Spacer(),
                            Container(
                                child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle_outline,
                                      color: greenColor,
                                    ),
                                    Text(
                                      'TERBAIK',
                                      style: whiteTextStyle.copyWith(
                                          fontWeight: bold),
                                    )
                                  ],
                                ),
                              ),
                            )),
                          ],
                        )
                      : const SizedBox(
                          height: 30,
                        ),
                  Text(
                    product.productName,
                    style: product.productId % 2 == 0
                        ? darkTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                          )
                        : whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                          ),
                  ),
                  Text(
                    '(Omset s.d. Rp. 4,8 Miliar)',
                    style: product.productId % 2 == 0
                        ? darkTextStyle.copyWith(
                            fontSize: 9,
                          )
                        : whiteTextStyle.copyWith(
                            fontSize: 9,
                          ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    formatValue(int.parse(product.productPrice)),
                    style: product.productId % 2 == 0
                        ? darkTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          )
                        : whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                  ),
                  Text(
                    '(Gunakan Kode Promo SMALL500)',
                    style: product.productId % 2 == 0
                        ? darkTextStyle.copyWith(
                            fontSize: 9,
                          )
                        : whiteTextStyle.copyWith(
                            fontSize: 9,
                          ),
                    textAlign: TextAlign.center,
                  ),
                  Html(
                      data: product.productContent,
                      style: product.productId % 2 == 0
                          ? {
                              "h3": Style(
                                color: darkColor,
                              ),
                              "li": Style(
                                color: darkColor,
                              ),
                            }
                          : {
                              "h3": Style(
                                color: Colors.white,
                              ),
                              "li": Style(
                                color: Colors.white,
                              ),
                            }),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(redColor),
                    ),
                    child: Text(
                      'Beli Paket',
                      style: whiteTextStyle.copyWith(
                          fontSize: 10, fontWeight: semiBold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

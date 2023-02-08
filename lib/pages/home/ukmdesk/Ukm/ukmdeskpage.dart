import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ukm_desk/constants/string_tax.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/cubit/product/product_cubit.dart';
import 'package:new_ukm_desk/pages/home/ukmdesk/widget/item_product.dart';

class UkmDeskPage extends StatefulWidget {
  const UkmDeskPage({super.key});

  @override
  State<UkmDeskPage> createState() => _UkmDeskPageState();
}

class _UkmDeskPageState extends State<UkmDeskPage> {
  Future<void> onRefresh() async {
    await context.read<ProductCubit>().getProduct();
  }

  @override
  void initState() {
    onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Apa yang kami \ntawarkan?',
              style: darkTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              textSubUkm,
              style: darkTextStyle,
            ),
          ],
        ),
      );
    }

    Widget paket() {
      return BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          print(state);
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoaded) {
            final product = state.productResponse.data;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: product.map((dataProduct) {
                  return ItemProduct(
                    product: dataProduct,
                  );
                }).toList(),
              ),
            );
          }
          return const SizedBox();
        },
      );
    }

    Widget caraKerja() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset(
                    'assets/new/umkm_langkah_1.png',
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      caraKerja1,
                      style: darkTextStyle.copyWith(fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset(
                    'assets/new/umkm_langkah_2.png',
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      caraKerja2,
                      style: darkTextStyle.copyWith(fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset(
                    'assets/new/umkm_langkah_3.png',
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      caraKerja3,
                      style: darkTextStyle.copyWith(fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset(
                    'assets/new/umkm_langkah_4.png',
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      caraKerja4,
                      style: darkTextStyle.copyWith(fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset(
                    'assets/new/umkm_langkah_5.png',
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      caraKerja5,
                      style: darkTextStyle.copyWith(fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('UKM Desk'),
        backgroundColor: redColor,
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          children: [
            header(),
            Text(
              'Kami bantu usaha Anda #naikkelas',
              style: darkTextStyle.copyWith(
                fontSize: 15,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            paket(),
            Text(
              'Cara Kerja UKM Desk',
              style: darkTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            ),
            caraKerja(),
          ],
        ),
      ),
    );
  }
}

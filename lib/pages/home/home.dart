import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/cubit/content/content_cubit.dart';
import 'package:new_ukm_desk/cubit/profile/profile_cubit.dart';
import 'package:new_ukm_desk/pages/widget/content_widget.dart';
import 'package:new_ukm_desk/pages/widget/event_widget.dart';
import 'package:new_ukm_desk/pages/widget/icon_home.dart';
import 'package:new_ukm_desk/pages/widget/search_nav.dart';
import 'package:new_ukm_desk/pages/widget/tax_tools_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final LocalAuthentication auth = LocalAuthentication();
  // final String _resultText = "Tekan FAB untuk melakukan autentikasi";
  // Color _resultColor = Colors.black;
  Future<void> getProfile(BuildContext context) {
    return context.read<ProfileCubit>().getProfile();
  }

  Future<void> getContent(BuildContext context) {
    return context.read<ContentCubit>().getContent();
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
    getContent(context);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => getProfile(context),
      child: ListView(
        children: [
          const SearchNav(),
          BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProfileLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat datang, ',
                            style: darkTextStyle.copyWith(fontSize: 12),
                          ),
                          Text(
                            state.profileResponse.dataUser.nama,
                            style: darkTextStyle.copyWith(
                                fontSize: 24, fontWeight: bold),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Wrap(
              children: [
                IconHome(
                  image: 'assets/new/chatconsul.png',
                  label: 'Chat Consultant',
                  onPressed: () {
                    Navigator.pushNamed(context, '/chatconsultant');
                  },
                ),
                IconHome(
                  image: 'assets/new/ukmdesk.png',
                  label: 'UKM Desk',
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                ),
                IconHome(
                  image: 'assets/new/meterai.png',
                  label: 'E-Meterai',
                  onPressed: () {},
                ),
                IconHome(
                  image: 'assets/new/training.png',
                  label: 'Training & Development',
                  onPressed: () {},
                ),
                IconHome(
                  image: 'assets/new/digitaltax.png',
                  label: 'Digital Tax',
                  onPressed: () {},
                ),
                IconHome(
                  image: 'assets/new/fdi.png',
                  label: 'FDI & Expatriates',
                  onPressed: () {},
                ),
                IconHome(
                  image: 'assets/new/digitaltax.png',
                  label: 'Tax Services',
                  onPressed: () {},
                ),
                IconHome(
                  image: 'assets/new/publication.png',
                  label: 'Publication',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const TaxToolWidget(),
          BlocBuilder<ContentCubit, ContentState>(
            builder: (context, state) {
              if (state is ContentLoaded) {
                final dataContent = state.contentResponse.data[0];
                return ContentWidget(
                  title: dataContent.titleId,
                );
              }
              return const SizedBox();
            },
          ),
          const EventWidget(),
        ],
      ),
    );
  }
}

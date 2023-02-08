import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ukm_desk/constants/cache_utils.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/cubit/profile/profile_cubit.dart';
import 'package:new_ukm_desk/pages/widget/loading_utils.dart';
import 'package:new_ukm_desk/pages/widget/more_item.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  Future<void> getProfile(BuildContext context) {
    return context.read<ProfileCubit>().getProfile();
  }

  @override
  void initState() {
    super.initState();
    getProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          'More',
          style: darkTextStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help_outline_rounded,
              color: darkColor,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: redColor,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, top: 21, bottom: 21, right: 16),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: const CircleAvatar(
                      backgroundColor: whiteColor,
                      child: Icon(
                        Icons.person,
                        size: 35,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProfileLoaded) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.profileResponse.dataUser.nama,
                            style: whiteTextStyle.copyWith(
                                fontSize: 24, fontWeight: bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            state.profileResponse.dataUser.npwp,
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                MoreItem(
                  icon: Icons.business_center_outlined,
                  label: 'Daftar Perusahaan',
                  onPressed: () {
                    const LoadingIndicate();
                  },
                ),
                MoreItem(
                  icon: Icons.pin_drop_outlined,
                  label: 'Daftar Alamat',
                  onPressed: () {},
                ),
                MoreItem(
                  icon: Icons.support_agent,
                  label: 'Info PIC',
                  onPressed: () {},
                ),
                MoreItem(
                  icon: Icons.history_outlined,
                  label: 'History',
                  onPressed: () {},
                ),
                MoreItem(
                  icon: Icons.build_outlined,
                  label: 'Tax Tools',
                  onPressed: () {},
                ),
                MoreItem(
                  icon: Icons.download_outlined,
                  label: 'Downloads',
                  onPressed: () {},
                ),
                MoreItem(
                  icon: Icons.vpn_key_outlined,
                  label: 'Ubah kata sandi',
                  onPressed: () {},
                ),
                MoreItem(
                  icon: Icons.help_center_outlined,
                  label: 'Help',
                  onPressed: () {},
                ),
                MoreItem(
                  icon: Icons.group_outlined,
                  label: 'Privacy and Terms',
                  onPressed: () {},
                ),
                MoreItem(
                  icon: Icons.logout,
                  label: 'Logout',
                  onPressed: () {
                    Alert(
                        context: context,
                        title: 'Konfirmasi',
                        desc: 'Anda yakin ingin keluar dari aplikasi?',
                        buttons: [
                          DialogButton(
                              color: Colors.red,
                              child: const Text(
                                'Yes',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                CacheUtil.clear();
                                await Navigator.pushNamedAndRemoveUntil(
                                    context, '/signin', (route) => false);
                              }),
                          DialogButton(
                              color: Colors.red,
                              child: const Text(
                                'No',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              }),
                        ]).show();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

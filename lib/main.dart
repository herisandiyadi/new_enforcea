import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:new_ukm_desk/cubit/auth/auth_cubit.dart';
import 'package:new_ukm_desk/cubit/content/content_cubit.dart';
import 'package:new_ukm_desk/cubit/product/product_cubit.dart';
import 'package:new_ukm_desk/cubit/profile/profile_cubit.dart';
import 'package:new_ukm_desk/pages/authentication/signinpage.dart';
import 'package:new_ukm_desk/pages/authentication/signuppage.dart';
import 'package:new_ukm_desk/pages/home/chatconsultant/chat_consultant_page.dart';
import 'package:new_ukm_desk/pages/home/homepage.dart';
import 'package:new_ukm_desk/pages/home/ukmdesk/Ukm/ukmdeskpage.dart';
import 'package:new_ukm_desk/pages/home/ukmdesk/dashboard_page.dart';
import 'package:new_ukm_desk/pages/home/ukmdesk/upload/upload_page.dart';
import 'package:new_ukm_desk/pages/splashscreen.dart';
import 'package:new_ukm_desk/services/repository/auth/auth_repository.dart';
import 'package:new_ukm_desk/services/repository/content/content_repository.dart';
import 'package:new_ukm_desk/services/repository/product/product_repository.dart';
import 'package:new_ukm_desk/services/repository/profile/profile_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            AuthRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(
            ProfileRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => ContentCubit(
            ContentRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => ProductCubit(
            ProductRepository(),
          ),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins'),
          home: const SplashScreenPage(),
          routes: {
            '/homepage': (context) => HomePage(),
            '/signin': (context) => const SigninPage(),
            '/signup': (context) => const SignupPage(),
            '/chatconsultant': (context) => const ChatConsultantPage(),
            '/dashboard': (context) => const DashboardPage(),
            '/ukmdesk': (context) => const UkmDeskPage(),
            '/upload': (context) => const UploadPage(),
          }),
    );
  }
}

import 'package:bhattimandu/components/liquor_card/liqour_detail.dart';
import 'package:bhattimandu/components/loader/bhatti_loader.dart';
import 'package:bhattimandu/database/authentication.dart';
import 'package:bhattimandu/firebase_options.dart';
import 'package:bhattimandu/model/user_model.dart';
import 'package:bhattimandu/pages/bottom_navigation/seller_navigation.dart';
import 'package:bhattimandu/pages/seller/add-liquor.dart';
import 'package:bhattimandu/pages/flashing_page.dart';
import 'package:bhattimandu/pages/seller/seller.dart';
import 'package:bhattimandu/pages/seller/view_liquor.dart';
import 'package:bhattimandu/pages/session/sign_in.dart';
import 'package:bhattimandu/pages/session/sign_up.dart';
import 'package:bhattimandu/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    return StreamProvider<UserModel?>.value(
      value:AuthenticationService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // scaffoldBackgroundColor: const Color(0xff1C1C2E),
          scaffoldBackgroundColor:  Colors.black,
          cardColor: const Color(0xff1C1C2E),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedLabelStyle: TextStyle(fontFamily:'lovelo',fontSize: 11, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontFamily:'lovelo',fontSize: 10),

          ),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Color(0xffF5F5DC),
            ),
            bodyMedium: TextStyle(
              color: Color(0xffF5F5DC),
            ),
            bodySmall: TextStyle(
              color: Color(0xffF5F5DC),
            ),

          ),
        ),

        routes: {
          '/': (context) => const BhattiFlashingPage(),
          '/add_liquor': (context) => const SellerNavigation(index: 2),
          '/orders': (context) => const SellerNavigation(index: 3),
          '/liquors': (context) => const SellerNavigation(index: 1),
          '/seller_account': (context) => const SellerNavigation(index: 4),
          '/wrapper': (context) => const Wrapper(),
          '/bhatti': (context) => const BhattiFlashingPage(),
          '/detail': (context) => const LiqourDetail(),
          '/sign_in': (context) => const SignIn(),
          '/sign_up': (context) => const SignUp()
        },
      ),
    );

  }
}

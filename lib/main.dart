import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/models/user.dart';
import 'package:spotify_clone/screens/auth_screens/common_screens/confirm_create_account.dart';
import 'package:spotify_clone/screens/auth_screens/login_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/date_of_birth_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/email_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/gender_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/password_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_link_screens/link_send_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_link_screens/login_without_password_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/confirm_phone_number_code_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/country_codes_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/phone_number_auth_screen.dart';
import 'package:spotify_clone/screens/main_screens/home_screen.dart';
import 'package:spotify_clone/screens/splash_screen.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SpotifyUserProvider>(
          create: (_) => SpotifyUserProvider(),
        ),
      ],
      child: MaterialApp(
        /**
         * Overscroll notification to disable the glow
         */
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'Spotify Clone',
        theme: ThemeData(
          fontFamily: "Proxima-Nova",
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
            ),
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(16, 16, 16, 1),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color.fromRGBO(16, 16, 16, 1),
            ),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(16, 16, 16, 1),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          primaryIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
            ),
          ),
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme(
              primary: Colors.white,
              primaryVariant: Colors.white,
              secondary: Colors.grey.shade700,
              secondaryVariant: Colors.grey.shade700,
              surface: Colors.red,
              background: Colors.red,
              error: Colors.red,
              onPrimary: Colors.white,
              onSecondary: Colors.grey,
              onSurface: Colors.red,
              onBackground: Colors.red,
              onError: Colors.red,
              brightness: Brightness.dark,
            ),
            textTheme: ButtonTextTheme.primary,
          ),
          /**
           * No splash on clicking buttons
           */
          splashFactory: NoSplash.splashFactory,
          backgroundColor: const Color.fromRGBO(16, 16, 16, 1),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
            caption: TextStyle(
              color: Colors.white,
            ),
            button: TextStyle(
              color: Colors.white,
            ),
            overline: TextStyle(
              color: Colors.white,
            ),
            subtitle1: TextStyle(
              color: Colors.white,
            ),
            subtitle2: TextStyle(
              color: Colors.white,
            ),
            headline1: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            headline5: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            headline6: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          disabledColor: Colors.grey[600],
          primarySwatch: const MaterialColor(
            0xFF1ed75f,
            <int, Color>{
              50: Color.fromRGBO(30, 215, 96, .05),
              100: Color.fromRGBO(30, 215, 96, .1),
              200: Color.fromRGBO(30, 215, 96, .2),
              300: Color.fromRGBO(30, 215, 96, .3),
              400: Color.fromRGBO(30, 215, 96, .4),
              500: Color.fromRGBO(30, 215, 96, .5),
              600: Color.fromRGBO(30, 215, 96, .6),
              700: Color.fromRGBO(30, 215, 96, .7),
              800: Color.fromRGBO(30, 215, 96, .8),
              900: Color.fromRGBO(30, 215, 96, .9),
              1000: Color.fromRGBO(30, 215, 96, 1),
            },
          ),
          errorColor: Colors.red[300],
        ),
        home: HomeScreen(),
        // home: FutureBuilder(
        //   future: Firebase.initializeApp(),
        //   builder: (ctx, snapshot) {
        //     if (snapshot.hasError == false &&
        //         snapshot.connectionState == ConnectionState.done) {
        //       return StreamBuilder<User?>(
        //         stream: FirebaseAuth.instance.authStateChanges(),
        //         builder: (ctx, snapshot) {
        //           if (snapshot.hasError == false &&
        //               snapshot.connectionState != ConnectionState.waiting &&
        //               snapshot.data?.uid != null) {
        //             return const HomeScreen();
        //           } else if (snapshot.connectionState !=
        //                   ConnectionState.waiting &&
        //               snapshot.data?.uid == null) {
        //             return const AuthScreen();
        //           }
        //           return const SplashScreen();
        //         },
        //       );
        //     }
        //     return const SplashScreen();
        //   },
        // ),
        routes: {
          SplashScreen.route: (ctx) => const SplashScreen(),
          HomeScreen.route: (ctx) => const HomeScreen(),

          // auth_screens/signup_with_email_screens
          SignUpEmailScreen.route: (ctx) => const SignUpEmailScreen(),
          SignupPasswordScreen.route: (ctx) => const SignupPasswordScreen(),
          SignupDateOfBirthScreen.route: (ctx) =>
              const SignupDateOfBirthScreen(),
          SignupGenderScreen.route: (ctx) => const SignupGenderScreen(),
          SignupConfirmCreateAccount.route: (ctx) =>
              const SignupConfirmCreateAccount(),

          // auth_screens/signup_with_link_screens
          LoginScreen.route: (ctx) => const LoginScreen(),
          LoginWithoutPassword.route: (ctx) => const LoginWithoutPassword(),
          LinkSendScreen.route: (ctx) => const LinkSendScreen(),

          // auth_screens/signup_with_phone_number_screens
          PhoneNumberAuth.route: (ctx) => const PhoneNumberAuth(),
          CountryCodeScreen.route: (ctx) => const CountryCodeScreen(),
          ConfirmPhoneNumberCode.route: (ctx) => const ConfirmPhoneNumberCode(),
        },
        // initialRoute: '/splashScreen',
      ),
    );
  }
}

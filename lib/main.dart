import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project_2/providers/products_provider.dart';
import 'package:flutter_project_2/screens/profile_screen.dart';
import 'package:flutter_project_2/screens/register_screen.dart';
import 'package:flutter_project_2/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_details_screen.dart';
import 'screens/cart_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider()..fetchProducts(),
        ),
      ],
      child: MaterialApp(
        title: 'Local Shop App',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
          '/product-details': (context) => ProductDetailsScreen(),
          '/cart': (context) => CartScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}

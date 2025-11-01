import 'package:flutter/material.dart';
import 'models/shop.dart';
import 'pages/cart_page.dart';
import 'pages/intro_page.dart';
import 'pages/shop_page.dart';
import 'themes/dark_mode.dart';
import 'themes/light_mode.dart';
import 'package:provider/provider.dart';

import 'themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Minimal Ecommerce App',
          home: const IntroPage(),
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: themeProvider.mode,
          routes: {
            '/intro_page': (context) => const IntroPage(),
            '/shop_page': (context) => const ShopPage(),
            '/cart_page': (context) => const CartPage(),
          },
        );
      },
    );
  }
}

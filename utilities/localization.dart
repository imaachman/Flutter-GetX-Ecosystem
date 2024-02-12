import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class TranslationData extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'greeting': 'Greetings, %s %s!',
          'welcome': 'Welcome to the app, @name!',
          'status': 'Your account status is: @status',
          'product': 'Product',
          'products': 'I have @count products',
        },
        'de_DE': {
          'greeting': 'Herzlich willkommen, %s!',
          'welcome': 'Willkommen in der App, @name!',
          'status': 'Ihr Kontostatus lautet: @status',
          'product': 'Produkt',
          'products': 'Ich habe @count Produkte',
        },
        'fr_FR': {
          'greeting': 'Salutations, %s!',
          'welcome': 'Bienvenue dans l\'application, @name!',
          'status': 'Votre statut de compte est: @status',
          'product': 'Produit',
          'products': 'J\'ai @count produits',
        },
        'es_ES': {
          'greeting': '¡Saludos, %s!',
          'welcome': 'Bienvenido/a a la aplicación, @name!',
          'status': 'El estado de tu cuenta es: @status',
          'product': 'Producto',
          'products': 'Tengo @count productos',
        },
        'ja_JP': {
          'greeting': 'こんにちは、%s %sさん!',
          'welcome': 'アプリへようこそ、@nameさん!',
          'status': 'アカウントのステータスは: @statusです',
          'product': '製品',
          'products': '私は@count個の製品を持っています',
        },
        // Add more languages if needed
        // 'it_IT': {
        //   'greeting': 'Saluti, %s!',
        //   'welcome': 'Benvenuto nell\'app, @name!',
        //   'status': 'Lo stato del tuo account è: @status',
        //   'product': 'Prodotto',
        //   'products': 'Ho @count prodotti',
        // },
      };

  // @override
  // Map<String, Map<String, String>> get keys => {
  //       'en_US': {
  //         'hello': 'Hello %s World',
  //         'logged_in': 'logged in as @name with email @email',
  //         'fruit': 'Apple',
  //         'fruits': 'I have @count apples',
  //       },
  //       'de_DE': {
  //         'hello': 'Hallo Welt',
  //         'logged_in': 'iniciado sesión como @name con e-mail @email',
  //         'fruit': 'Apple',
  //         'fruits': 'I have @count apples',
  //       }
  //     };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: TranslationData(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueBuilder<MapEntry<String, String>?>(
      initialValue: MapEntry('John Doe', 'john@gmail.com'),
      builder: (value, updater) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: Center(
              child: Text(
                // 'greeting'.trArgs(['Aachman', 'Garg']),
                // 'welcome'.trParams({'name': 'Aachman'}),
                'product'.trPlural('products', 1, ['four']),
                // 'product'.trPluralParams('products', 4, {'count': 'four'}),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.updateLocale(Locale('ja', 'JP'));
                // updater(MapEntry('Aachman', 'imaachman@gmail.com'));
              },
              child: Icon(Icons.switch_left),
            ));
      },
    );
  }
}

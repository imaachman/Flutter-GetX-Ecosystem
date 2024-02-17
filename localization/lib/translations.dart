import 'package:get/get.dart';

class TranslationData extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'greeting': 'Greetings, %s!',
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
          'greeting': 'こんにちは、%sさん!',
          'welcome': 'アプリへようこそ、@nameさん!',
          'status': 'アカウントのステータスは: @statusです',
          'product': '製品',
          'products': '私は@count個の製品を持っています',
        },
      };
}

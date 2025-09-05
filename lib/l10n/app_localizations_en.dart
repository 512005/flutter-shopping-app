// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get ourProducts => 'Our Products';

  @override
  String get hotOffers => 'Hot Offers';

  @override
  String get itemAddedToCart => 'Item added to the cart';

  @override
  String get cart => 'Cart';

  @override
  String get cartEmpty => 'Your cart is empty.';

  @override
  String get total => 'Total';

  @override
  String get checkout => 'Checkout';

  @override
  String get orderPlaced => 'Order placed';

  @override
  String get orderSuccess => 'Your order was placed successfully.';

  @override
  String get ok => 'OK';
}

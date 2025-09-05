// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get ourProducts => 'منتجاتنا';

  @override
  String get hotOffers => 'العروض الساخنة';

  @override
  String get itemAddedToCart => 'تم إضافة المنتج إلى العربة';

  @override
  String get cart => 'العربة';

  @override
  String get cartEmpty => 'سلة التسوق فارغة.';

  @override
  String get total => 'الإجمالي';

  @override
  String get checkout => 'إتمام الشراء';

  @override
  String get orderPlaced => 'تم إرسال الطلب';

  @override
  String get orderSuccess => 'تم إرسال طلبك بنجاح.';

  @override
  String get ok => 'حسناً';
}

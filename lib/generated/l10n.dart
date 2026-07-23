// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get title {
    return Intl.message('Hello', name: 'title', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Welcome to`
  String get welcome_to {
    return Intl.message('Welcome to', name: 'welcome_to', desc: '', args: []);
  }

  /// `Search and Shop`
  String get search_and_shop {
    return Intl.message(
      'Search and Shop',
      name: 'search_and_shop',
      desc: '',
      args: [],
    );
  }

  /// `Start Shopping`
  String get start_shopping {
    return Intl.message(
      'Start Shopping',
      name: 'start_shopping',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and get the best offers and high quality.`
  String get on_boarding_title_1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and get the best offers and high quality.',
      name: 'on_boarding_title_1',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the finest carefully selected fruits. View details, photos, and reviews to ensure you choose the perfect fruit.`
  String get on_boarding_title_2 {
    return Intl.message(
      'We offer you the finest carefully selected fruits. View details, photos, and reviews to ensure you choose the perfect fruit.',
      name: 'on_boarding_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Login with Google`
  String get login_with_google {
    return Intl.message(
      'Login with Google',
      name: 'login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get login_with_facebook {
    return Intl.message(
      'Login with Facebook',
      name: 'login_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Sign Up`
  String get sing_up {
    return Intl.message('Sign Up', name: 'sing_up', desc: '', args: []);
  }

  /// `Enter your password`
  String get enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get enter_your_email_address {
    return Intl.message(
      'Enter your email address',
      name: 'enter_your_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get got_it {
    return Intl.message('Got it', name: 'got_it', desc: '', args: []);
  }

  /// `Enter your Name`
  String get enter_your_name {
    return Intl.message(
      'Enter your Name',
      name: 'enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to our `
  String get by_continuing_you_agree_to_our {
    return Intl.message(
      'By creating an account, you agree to our ',
      name: 'by_continuing_you_agree_to_our',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_an_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Please accept terms and conditions`
  String get please_accept_terms_and_conditions {
    return Intl.message(
      'Please accept terms and conditions',
      name: 'please_accept_terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong. Please try again',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is incorrect`
  String get invalid_credentials {
    return Intl.message(
      'The email or password is incorrect',
      name: 'invalid_credentials',
      desc: '',
      args: [],
    );
  }

  /// `This account has been disabled`
  String get user_disabled {
    return Intl.message(
      'This account has been disabled',
      name: 'user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `No account found with this email address`
  String get user_not_found {
    return Intl.message(
      'No account found with this email address',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `The password is incorrect`
  String get wrong_password {
    return Intl.message(
      'The password is incorrect',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `This email address is already in use`
  String get email_already_in_use {
    return Intl.message(
      'This email address is already in use',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak`
  String get weak_password {
    return Intl.message(
      'The password is too weak',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get check_your_internet_connection {
    return Intl.message(
      'Please check your internet connection',
      name: 'check_your_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please try again later`
  String get too_many_requests {
    return Intl.message(
      'Too many attempts. Please try again later',
      name: 'too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `This operation is currently unavailable`
  String get operation_not_allowed {
    return Intl.message(
      'This operation is currently unavailable',
      name: 'operation_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `Please sign in again and try again`
  String get requires_recent_login {
    return Intl.message(
      'Please sign in again and try again',
      name: 'requires_recent_login',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again`
  String get unexpected_error {
    return Intl.message(
      'An unexpected error occurred. Please try again',
      name: 'unexpected_error',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to perform this operation`
  String get permission_denied {
    return Intl.message(
      'You don\'t have permission to perform this operation',
      name: 'permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `The requested data was not found`
  String get data_not_found {
    return Intl.message(
      'The requested data was not found',
      name: 'data_not_found',
      desc: '',
      args: [],
    );
  }

  /// `The data already exists`
  String get data_already_exists {
    return Intl.message(
      'The data already exists',
      name: 'data_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `The service is currently unavailable`
  String get service_unavailable {
    return Intl.message(
      'The service is currently unavailable',
      name: 'service_unavailable',
      desc: '',
      args: [],
    );
  }

  /// `The request timed out. Please try again`
  String get connection_timeout {
    return Intl.message(
      'The request timed out. Please try again',
      name: 'connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `The operation was cancelled`
  String get operation_cancelled {
    return Intl.message(
      'The operation was cancelled',
      name: 'operation_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `The resource limit has been exceeded`
  String get resource_exhausted {
    return Intl.message(
      'The resource limit has been exceeded',
      name: 'resource_exhausted',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while accessing the database`
  String get database_error {
    return Intl.message(
      'An error occurred while accessing the database',
      name: 'database_error',
      desc: '',
      args: [],
    );
  }

  /// `The file was not found`
  String get file_not_found {
    return Intl.message(
      'The file was not found',
      name: 'file_not_found',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to access this file`
  String get file_access_denied {
    return Intl.message(
      'You don\'t have permission to access this file',
      name: 'file_access_denied',
      desc: '',
      args: [],
    );
  }

  /// `The storage quota has been exceeded`
  String get storage_quota_exceeded {
    return Intl.message(
      'The storage quota has been exceeded',
      name: 'storage_quota_exceeded',
      desc: '',
      args: [],
    );
  }

  /// `The operation failed. Please try again`
  String get operation_failed_retry {
    return Intl.message(
      'The operation failed. Please try again',
      name: 'operation_failed_retry',
      desc: '',
      args: [],
    );
  }

  /// `The file is corrupted`
  String get file_corrupted {
    return Intl.message(
      'The file is corrupted',
      name: 'file_corrupted',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while uploading or downloading the file`
  String get storage_error {
    return Intl.message(
      'An error occurred while uploading or downloading the file',
      name: 'storage_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get please_enter_a_valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'please_enter_a_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get please_enter_a_valid_password {
    return Intl.message(
      'Please enter a valid password',
      name: 'please_enter_a_valid_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid name`
  String get please_enter_a_valid_name {
    return Intl.message(
      'Please enter a valid name',
      name: 'please_enter_a_valid_name',
      desc: '',
      args: [],
    );
  }

  /// `Sign In Now`
  String get sign_in_now {
    return Intl.message('Sign In Now', name: 'sign_in_now', desc: '', args: []);
  }

  /// `Welcome `
  String get welcome {
    return Intl.message('Welcome ', name: 'welcome', desc: '', args: []);
  }

  /// `to Fruit Hub`
  String get to_fruit_hub {
    return Intl.message(
      'to Fruit Hub',
      name: 'to_fruit_hub',
      desc: '',
      args: [],
    );
  }

  /// `Google sign-in was cancelled.`
  String get google_sign_in_cancelled {
    return Intl.message(
      'Google sign-in was cancelled.',
      name: 'google_sign_in_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Facebook sign-in was cancelled.`
  String get facebook_sign_in_cancelled {
    return Intl.message(
      'Facebook sign-in was cancelled.',
      name: 'facebook_sign_in_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `An account with this email already exists. Please sign in using your previous login method.`
  String get account_exists_with_different_credential {
    return Intl.message(
      'An account with this email already exists. Please sign in using your previous login method.',
      name: 'account_exists_with_different_credential',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get no_internet_connection {
    return Intl.message(
      'No internet connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection and try again`
  String get no_internet_connection_message {
    return Intl.message(
      'Please check your internet connection and try again',
      name: 'no_internet_connection_message',
      desc: '',
      args: [],
    );
  }

  /// `Timeout`
  String get request_timeout {
    return Intl.message('Timeout', name: 'request_timeout', desc: '', args: []);
  }

  /// `Watermelon`
  String get watermelon {
    return Intl.message('Watermelon', name: 'watermelon', desc: '', args: []);
  }

  /// `EGP`
  String get currency {
    return Intl.message('EGP', name: 'currency', desc: '', args: []);
  }

  /// `kg`
  String get kg {
    return Intl.message('kg', name: 'kg', desc: '', args: []);
  }

  /// `Feature Item`
  String get feature_item {
    return Intl.message(
      'Feature Item',
      name: 'feature_item',
      desc: '',
      args: [],
    );
  }

  /// `Offer`
  String get offer {
    return Intl.message('Offer', name: 'offer', desc: '', args: []);
  }

  /// `Shop Now`
  String get shop_now {
    return Intl.message('Shop Now', name: 'shop_now', desc: '', args: []);
  }

  /// `See All`
  String get see_all {
    return Intl.message('See All', name: 'see_all', desc: '', args: []);
  }

  /// `Search for ...`
  String get search_for {
    return Intl.message(
      'Search for ...',
      name: 'search_for',
      desc: '',
      args: [],
    );
  }

  /// `Most Popular`
  String get most_popular {
    return Intl.message(
      'Most Popular',
      name: 'most_popular',
      desc: '',
      args: [],
    );
  }

  /// `Products screen`
  String get products_view {
    return Intl.message(
      'Products screen',
      name: 'products_view',
      desc: '',
      args: [],
    );
  }

  /// `Cart screen`
  String get cart_view {
    return Intl.message('Cart screen', name: 'cart_view', desc: '', args: []);
  }

  /// `Profile screen`
  String get profile_view {
    return Intl.message(
      'Profile screen',
      name: 'profile_view',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Product`
  String get product {
    return Intl.message('Product', name: 'product', desc: '', args: []);
  }

  /// `Fruits`
  String get fruits {
    return Intl.message('Fruits', name: 'fruits', desc: '', args: []);
  }

  /// `Results`
  String get results {
    return Intl.message('Results', name: 'results', desc: '', args: []);
  }

  /// `Pay`
  String get pay {
    return Intl.message('Pay', name: 'pay', desc: '', args: []);
  }

  /// `You have`
  String get you_have {
    return Intl.message('You have', name: 'you_have', desc: '', args: []);
  }

  /// `items in cart`
  String get items_in_cart {
    return Intl.message(
      'items in cart',
      name: 'items_in_cart',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Product is added to cart`
  String get product_is_added_to_cart {
    return Intl.message(
      'Product is added to cart',
      name: 'product_is_added_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Product is removed from cart`
  String get product_is_removed_from_cart {
    return Intl.message(
      'Product is removed from cart',
      name: 'product_is_removed_from_cart',
      desc: '',
      args: [],
    );
  }

  /// `Cart is empty`
  String get cart_is_empty {
    return Intl.message(
      'Cart is empty',
      name: 'cart_is_empty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

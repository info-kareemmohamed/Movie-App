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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `App Language`
  String get settings_language {
    return Intl.message(
      'App Language',
      name: 'settings_language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get settings_ar {
    return Intl.message(
      'Arabic',
      name: 'settings_ar',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get settings_en {
    return Intl.message(
      'English',
      name: 'settings_en',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_settings {
    return Intl.message(
      'Settings',
      name: 'settings_settings',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get settings_profile {
    return Intl.message(
      'Profile',
      name: 'settings_profile',
      desc: '',
      args: [],
    );
  }

  /// `Mode`
  String get settings_mode {
    return Intl.message(
      'Mode',
      name: 'settings_mode',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get settings_notification {
    return Intl.message(
      'Notification',
      name: 'settings_notification',
      desc: '',
      args: [],
    );
  }

  /// `Allow Notification`
  String get settings_allow_notification {
    return Intl.message(
      'Allow Notification',
      name: 'settings_allow_notification',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get settings_logout {
    return Intl.message(
      'Logout',
      name: 'settings_logout',
      desc: '',
      args: [],
    );
  }

  /// `Light & Dark Mode`
  String get settings_light_dark {
    return Intl.message(
      'Light & Dark Mode',
      name: 'settings_light_dark',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite_favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite_favourite',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_hinttxt_email {
    return Intl.message(
      'Email',
      name: 'login_hinttxt_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_hinttxt_password {
    return Intl.message(
      'Password',
      name: 'login_hinttxt_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get login_hinttxt_forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'login_hinttxt_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get login_button_signin {
    return Intl.message(
      'Sign in',
      name: 'login_button_signin',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account?`
  String get login_dont_have_account {
    return Intl.message(
      'Don\'t have account?',
      name: 'login_dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get login_register {
    return Intl.message(
      'Register',
      name: 'login_register',
      desc: '',
      args: [],
    );
  }

  /// `Sorry Not Found`
  String get app_sorry_not_found {
    return Intl.message(
      'Sorry Not Found',
      name: 'app_sorry_not_found',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get register_hinttxt_user_name {
    return Intl.message(
      'User Name',
      name: 'register_hinttxt_user_name',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get register_hinttxt_email_address {
    return Intl.message(
      'Email Address',
      name: 'register_hinttxt_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get register_hinttxt_password {
    return Intl.message(
      'Password',
      name: 'register_hinttxt_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get register_hinttxt_confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'register_hinttxt_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get register_txt_create_account {
    return Intl.message(
      'Create Account',
      name: 'register_txt_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get register_already_have_account {
    return Intl.message(
      'Already have an account? ',
      name: 'register_already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get register_signin {
    return Intl.message(
      'Sign in',
      name: 'register_signin',
      desc: '',
      args: [],
    );
  }

  /// `By logging.you agree to our`
  String get register_by_logging_you_agree_to_our {
    return Intl.message(
      'By logging.you agree to our',
      name: 'register_by_logging_you_agree_to_our',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get register_terms_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'register_terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `and `
  String get register_and {
    return Intl.message(
      'and ',
      name: 'register_and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get register_privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'register_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get register_toptext_create_account {
    return Intl.message(
      'Create Account',
      name: 'register_toptext_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Register now and start exploring all that our app has to offer. We’re excited to welcome you to our community!`
  String get register_toptext {
    return Intl.message(
      'Register now and start exploring all that our app has to offer. We’re excited to welcome you to our community!',
      name: 'register_toptext',
      desc: '',
      args: [],
    );
  }

  /// `Latest Movies`
  String get home_latest_movies {
    return Intl.message(
      'Latest Movies',
      name: 'home_latest_movies',
      desc: '',
      args: [],
    );
  }

  /// `Watch it`
  String get home_watch_it {
    return Intl.message(
      'Watch it',
      name: 'home_watch_it',
      desc: '',
      args: [],
    );
  }

  /// `Show More`
  String get details_show_more {
    return Intl.message(
      'Show More',
      name: 'details_show_more',
      desc: '',
      args: [],
    );
  }

  /// `More Like This`
  String get details_more_like_this {
    return Intl.message(
      'More Like This',
      name: 'details_more_like_this',
      desc: '',
      args: [],
    );
  }

  /// `EPISODES`
  String get details_EPISODES {
    return Intl.message(
      'EPISODES',
      name: 'details_EPISODES',
      desc: '',
      args: [],
    );
  }

  /// `TRAILERS`
  String get details_TRAILERS {
    return Intl.message(
      'TRAILERS',
      name: 'details_TRAILERS',
      desc: '',
      args: [],
    );
  }

  /// `CASTS`
  String get details_CASTS {
    return Intl.message(
      'CASTS',
      name: 'details_CASTS',
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

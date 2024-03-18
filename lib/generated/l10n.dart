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

  /// `Sorry Not Found`
  String get App_sorry_not_found {
    return Intl.message(
      'Sorry Not Found',
      name: 'App_sorry_not_found',
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

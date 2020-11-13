import 'package:flutter/material.dart';
import 'package:otu_companion/src/event_finder/event_finder_main.dart';
import 'package:otu_companion/src/event_finder/views/event_form.dart';
import 'package:otu_companion/src/home_page/home_page_main.dart';
import 'package:otu_companion/src/profile/profile_page_main.dart';
import 'package:otu_companion/src/room_finder/room_finder_main.dart';
import 'package:otu_companion/src/settings/settings_main.dart';
import 'package:otu_companion/src/settings/views/appearance_settings_page.dart';

class Routes {
  // Login

  // Home
  static const homeMain = "/homeMain";
  // Event Finder
  static const eventFinderMain = "/eventFinderMain";
  static const eventForm = "/eventForm";
  // Classroom Finder
  static const roomFinderMain = "/roomFinderMain";

  // Settings
  static const settingMain = "/settingMain";
  static const appearanceSettingPage = "/appearanceSettingPage";

  // Profile
  static const profileMain = "/profileMain";

  // Others

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeMain:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                HomePageMain(title: 'Dash Board'));
      case eventFinderMain:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                EventFinderMain(title: 'Event Finder'));
      case eventForm:
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  EventFormPage(title: 'Event Form', event: settings.arguments));
      case roomFinderMain:
        return MaterialPageRoute(builder: (BuildContext context) =>
            RoomFinderMain(title: 'Empty Room Finder'));
      case settingMain:
        return MaterialPageRoute(
            builder: (BuildContext context) => SettingMain(title: 'Settings'));
      case appearanceSettingPage:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                AppearanceSettingPage(title: 'Appearance'));
      case profileMain:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProfilePageMain(title: 'Profile'));
      case roomFinderMain:
        return MaterialPageRoute(builder: (BuildContext context) =>
            RoomFinderMain(title: 'Empty Room Finder'));
    }

    return null;
  }
}

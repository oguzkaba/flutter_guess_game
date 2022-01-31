import 'package:get/get.dart';

import 'package:flutter_game1/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_game1/app/modules/home/views/home_view.dart';
import 'package:flutter_game1/app/modules/leaderboard/bindings/leaderboard_binding.dart';
import 'package:flutter_game1/app/modules/leaderboard/views/leaderboard_view.dart';
import 'package:flutter_game1/app/modules/playgame/bindings/playgame_binding.dart';
import 'package:flutter_game1/app/modules/playgame/views/playgame_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => LeaderboardView(),
      binding: LeaderboardBinding(),
    ),
    GetPage(
      name: _Paths.PLAYGAME,
      page: () => PlaygameView(),
      binding: PlaygameBinding(),
    ),
  ];
}

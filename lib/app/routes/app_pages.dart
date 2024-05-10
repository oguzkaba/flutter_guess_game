import 'package:flutter_guess_game/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_guess_game/app/modules/home/views/home_view.dart';
import 'package:flutter_guess_game/app/modules/leaderboard/bindings/leaderboard_binding.dart';
import 'package:flutter_guess_game/app/modules/leaderboard/views/leaderboard_view.dart';
import 'package:flutter_guess_game/app/modules/playgame/bindings/playgame_binding.dart';
import 'package:flutter_guess_game/app/modules/playgame/views/playgame_view.dart';
import 'package:flutter_guess_game/app/modules/set_player/bindings/set_player_binding.dart';
import 'package:flutter_guess_game/app/modules/set_player/views/set_player_view.dart';
import 'package:get/get.dart';

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
    GetPage(
      name: _Paths.SETPLAYER,
      page: () => SetPlayerView(),
      binding: SetPlayerBinding(),
    ),
  ];
}

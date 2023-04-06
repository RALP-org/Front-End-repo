import 'package:flutter/material.dart';
import 'package:ralp/ui/root_page/root_page.dart';


abstract class Routes {
  Routes._();

  static const ROOT_ROUTE = "RootPage";
  static const REGISTER_ROUTE = "RegisterPage";
  static const LOGIN_ROUTE = "LoginPage";
  static const HOME_ROUTE = "HomePage";
  static const SEARCH_ROUTE = "SearchPage";

  static const rootPage = RootView();
  // static const registerPage = SignUpView();
  // static const loginPage = SignInView();
  // static const homePage = HomeView();
  // static const searchPage = SearchView();

  static Route generator(RouteSettings settings) {
    switch (settings.name) {
      case ROOT_ROUTE:
        return MaterialPageRoute(builder: (context) => rootPage);

      // case REGISTER_ROUTE:
      //   return MaterialPageRoute(builder: (context) => registerPage);

      // case LOGIN_ROUTE:
      //   return MaterialPageRoute(builder: (context) => loginPage);

      // case HOME_ROUTE:
      //   return MaterialPageRoute(builder: (context) => homePage);

      // case SEARCH_ROUTE:
      //   return MaterialPageRoute(builder: (context) => searchPage);

      default:
        return MaterialPageRoute(builder: (context) => rootPage);
    }
  }
}

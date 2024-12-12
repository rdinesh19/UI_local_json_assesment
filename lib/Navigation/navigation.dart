import 'package:flutter_modular/flutter_modular.dart';

import '../view/landing_page.dart';

class Navigation extends Module{
static const String singInPage="/singInPage";

@override
  void routes(r){
  r.child(Modular.initialRoute, child:(_)=> const LandingPage());

}
}
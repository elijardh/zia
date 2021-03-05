import 'package:flutter/material.dart';

void navigateReplace(BuildContext context, Widget route, {bool isDialog = false}) =>
    Navigator.pushReplacement(context, MaterialPageRoute<dynamic>(
        fullscreenDialog: isDialog,
        builder: (BuildContext context) => route,
      ),
    );

void navigate(BuildContext context, Widget route, {bool isDialog = false}) =>
    Navigator.push(context, MaterialPageRoute<dynamic>(
        fullscreenDialog: isDialog,
        builder: (BuildContext context) => route,
      ),
    );

void pushUntil(BuildContext context, Widget route) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute<dynamic>(
    builder: (BuildContext context) {
    return route;
  }), (Route<dynamic> route) => false);

}

void popToFirst(BuildContext context) =>
    Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);


void popView(BuildContext context) => Navigator.pop(context);

dynamic navigateTransparentRoute(BuildContext context, Widget route) {
  return Navigator.push(context, TransparentRoute(
      builder: (BuildContext context) => route,
    ),
  );
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final Widget result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}
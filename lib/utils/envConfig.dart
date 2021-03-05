import 'package:meta/meta.dart';

enum BuildFlavor { production, development, staging }

BuildEnvironment get env => _env;
BuildEnvironment _env;

class BuildEnvironment {

  final String APIKey;
  final BuildFlavor flavor;

  BuildEnvironment._init({this.flavor, this.APIKey});

  static void init({@required flavor, APIKey}) {

      if (flavor == BuildFlavor.development) {

        _env ??= BuildEnvironment._init(flavor: flavor, APIKey: "");

      } else if ( flavor == BuildFlavor.production) {


      } else if ( flavor == BuildFlavor.staging ) {

        _env ??= BuildEnvironment._init(flavor: flavor, APIKey: "");

      }
  }

}
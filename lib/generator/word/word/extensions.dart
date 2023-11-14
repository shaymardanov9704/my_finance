extension MyList on List {
  String dartContent() {
    var text = "$this";
    text = text.substring(1, text.length - 1);

    return """
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:open_budget/core/firebase/remote/my_remote_config.dart';

extension MyWords on Words {
  String tr([dynamic key]) {
    final wordKey = "\$name\${key == null ? "" : "\\\$\$key"}";
    return MyRemoteConfig.words()[wordKey] ?? wordKey.tr();
  }
}

enum Words {$text}""";
  }
}

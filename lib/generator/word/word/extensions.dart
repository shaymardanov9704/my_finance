extension MyList on List {
  String dartContent() {
    var text = "$this";
    text = text.substring(1, text.length - 1);

    return """
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';

extension MyWords on Words {
  String tr([dynamic key]) {
    final wordKey = "\$name\${key == null ? "" : "\\\$\$key"}";
    return  wordKey.tr();
  }
}

enum Words {$text}""";
  }
}

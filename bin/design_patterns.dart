import 'package:args/args.dart';
import 'package:design_patterns/design_patterns.dart';

void main(List<String> arguments) {
  final parser = buildArgs();
  try {
    final results = parser.parse(arguments);
    if (results["help"]) {
      print(parser.usage);
    }
  } catch (_) {
    print(parser.usage);
  }
}

void execute(String? value, Function runWith) =>
    value != null ? runWith(value) : () {};

ArgParser buildArgs() => ArgParser()
  ..addFlag("help",
      abbr: "h", negatable: false, help: "Mostra o texto de ajuda")
  ..addOption(
    "transport",
    abbr: "t",
    help: "Creational > Factory > Transporte",
    allowedHelp: {
      "land": "Transporte terrestre",
      "sea": "Transporte marítimo",
      "air": "Transporte aéreo"
    },
    callback: (type) => execute(type, factoryMethod),
  )
  ..addOption(
    "file",
    abbr: "f",
    help: "Creational > Abstract Factory > File Manager",
    allowedHelp: {"win": "Windows File Manager", "lin": "Linux File Manager"},
    callback: (type) => execute(type, abstractFactory),
  )
  ..addOption(
    "bike",
    abbr: "b",
    help: "Creational > Builder > Bike",
    allowedHelp: {"u": "Urban bike", "e": "Eletric bike"},
    callback: (type) => execute(type, builder),
  );

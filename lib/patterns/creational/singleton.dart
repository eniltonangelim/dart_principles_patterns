import 'dart:math';

class Singleton {
  static final Map<String, Singleton> _singletonInstances = {};
  final String name;

  Singleton._({required this.name});

  factory Singleton.instanceByName({required String name}) =>
      _singletonInstances.putIfAbsent(name, () {
        return Singleton._(name: name);
      });

  Singleton get intance => Singleton.instanceByName(name: name);

  @override
  String toString() =>
      "Singleton of $name | Cached: ${_singletonInstances.keys}";
}

void init() {
  Singleton.instanceByName(name: "default");
  Singleton.instanceByName(name: "db");
  Singleton.instanceByName(name: "httpClient");
  Singleton.instanceByName(name: "encrypt");
}

void singleton(String? value) {
  init();
  return switch (value) {
    "d" => print(Singleton.instanceByName(name: "default")),
    "db" => print(Singleton.instanceByName(name: "db")),
    "e" => print(Singleton.instanceByName(name: "encrypt")),
    _ => print("Tipo não identificado. Use -h/--help")
  };
}

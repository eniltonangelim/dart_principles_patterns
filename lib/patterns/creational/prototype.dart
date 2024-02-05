// Prototype

enum BodyWork { sedan, hatchback, suv }

abstract class Vehicle {
  late BodyWork bodyWork;
  late String color;

  Vehicle([Vehicle? source]) {
    if (source != null) {
      bodyWork = source.bodyWork;
      color = source.color;
    }
  }

  Vehicle clone();
}

class SUVCar extends Vehicle {
  final String engine;

  SUVCar(this.engine) : super();

  SUVCar.fromSource(SUVCar source)
      : engine = source.engine,
        super(source);

  @override
  Vehicle clone() => SUVCar.fromSource(this);

  @override
  String toString() => "SUVCar {engine: $engine, color: ${super.color} }";
}

class SedanCar extends Vehicle {
  final String engine;

  SedanCar(this.engine) : super();

  SedanCar.fromSource(SedanCar source)
      : engine = source.engine,
        super(source);

  @override
  Vehicle clone() => SedanCar.fromSource(this);

  @override
  String toString() => "SedanCar {engine: $engine, color: ${super.color} }";
}

void prototype(String? value) => switch (value) {
      "suv" => () {
          SUVCar suv = SUVCar("Motor Turbo  4.8 V8");
          suv.bodyWork = BodyWork.suv;
          suv.color = "Red";
          print("Clone of ${suv.clone()}");
        }(),
      "sed" => () {
          SedanCar sedan = SedanCar("6.6 V12 Biturbo");
          sedan.bodyWork = BodyWork.sedan;
          sedan.color = "Black";
          print("Clone of ${sedan.clone()}");
        }(),
      _ => print("Tipo não identificado. Use -h/--help")
    };

// Principles
// Single Responsibility Principle :: Você pode isolar um código de construção complexo da lógica de negócio
// do produto.

class Bike {
  late final String _quadro;
  late final String _equipamento;
  late final String _estrutura;
  String? _motor;

  Bike();

  set quadro(String value) => _quadro = value;

  set estrutura(String value) => _estrutura = value;

  set equipamento(String value) => _equipamento = value;

  set motor(String value) => _motor = value;

  @override
  String toString() {
    if (_motor != null) {
      return "Eletric Bike - quadro: $_quadro, equipamento: $_equipamento, estrutura: $_estrutura, motor: $_motor";
    }

    return "Urban bike - quadro: $_quadro, equipamento: $_equipamento, estrutura: $_estrutura";
  }
}

abstract class BikeBuilder {
  void reset();
  void buildQuadro(String quadro);
  void buildEquipamento(String equipamento);
  void buildEstrutura(String estrutura);
  void buildMotor(String motor);
}

class CustomBikeBuilder implements BikeBuilder {
  late Bike _bike;

  CustomBikeBuilder() {
    reset();
  }

  @override
  void buildEquipamento(String equipamento) => _bike.equipamento = equipamento;

  @override
  void buildQuadro(String quadro) => _bike.quadro = quadro;

  @override
  void reset() => _bike = Bike();

  @override
  void buildEstrutura(String estrutura) => _bike.estrutura = estrutura;

  @override
  void buildMotor(String motor) => _bike.motor = motor;

  Bike getResult() {
    final produto = _bike;
    reset();
    return produto;
  }
}

class BikeDirector {
  void makeSimpleBike(BikeBuilder builder) {
    builder.buildQuadro("urbano");
    builder.buildEstrutura("padrão para bike urbana");
    builder.buildEquipamento("para-lamas, bagageiro e iluminação integrada");
  }

  void makeEletricBike(BikeBuilder builder) {
    builder.buildQuadro("reforçado para suportar o sistema elétrico");
    builder.buildEstrutura("reforçada para bateria elétrica");
    builder.buildEquipamento("bateria, luzes LED");
    builder.buildMotor("Bosch Perfomance Line CS");
  }
}

void builder(String value) => switch (value) {
      "u" => () {
          CustomBikeBuilder builder = CustomBikeBuilder();
          BikeDirector director = BikeDirector();
          director.makeSimpleBike(builder);
          print(builder.getResult());
        }(),
      "e" => () {
          CustomBikeBuilder builder = CustomBikeBuilder();
          BikeDirector director = BikeDirector();
          director.makeEletricBike(builder);
          print(builder.getResult());
        }(),
      _ => print("Tipo não identificado. Use -h/--help")
    };

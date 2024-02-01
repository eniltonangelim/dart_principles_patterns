// Principles
// Single Responsibility Principle :: Você pode mover o código de criação do produto
//    para um local no programa, facilitando o suporte do código.
// Open/Closed Principle :: Você pode introduzir novos tipos de produtos no programa
//    sem quebrar o código do cliente existente

// Logistic APP

abstract interface class Transport {
  void deliver();
}

class TruckTransport implements Transport {
  @override
  void deliver() => print("Entrega por via terrestre");
}

class ShipTransport implements Transport {
  @override
  void deliver() => print("Entrega por via marítima");
}

class PlaneTransport implements Transport {
  @override
  void deliver() => print("Entrega por via aérea");
}

// Factory

abstract interface class Logistic {
  Transport create();
}

class LandLogistic implements Logistic {
  @override
  Transport create() => TruckTransport();
}

class SeaLogistic implements Logistic {
  @override
  Transport create() => ShipTransport();
}

class AirLogistic implements Logistic {
  @override
  Transport create() => PlaneTransport();
}

// Main > Logistic => TypedLogistic
void factoryMethod(String? type) => switch (type) {
      "air" => AirLogistic().create().deliver(),
      "land" => LandLogistic().create().deliver(),
      "sea" => SeaLogistic().create().deliver(),
      _ => print("Tipo não identificado. Use -h/--help")
    };

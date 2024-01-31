class Bike {
  late final String _quadro;
  late final String _equipamento;

  Bike();

  set quadro(String value) => _quadro = value;

  set equipamento(String value) => _equipamento = value;

  @override
  String toString() =>
      "Bicicleta com quadro $_quadro e equipamento $_equipamento";
}

class Manual {
  late final String _descricao;

  Manual();

  set descricao(String value) => _descricao = value;

  @override
  String toString() =>
      "Manual da bicicleta: $_descricao";

}

abstract class Builder {}

// Principles
// Single Responsibility Principle :: Você pode extrair o código de criação do produto
//    em um só lugar, facilitando o suporte do código.
// Open/Closed Principle :: Você pode introduzir novas variantes de produtos
//    sem quebrar o código do cliente existente.

// Interface do produto

interface class File {
  void open() {}
  void close() {}
}

// Implementação concreta do produto para diferentes sistemas operacionais

class WindowsFile implements File {
  @override
  void close() => print("Win :: Arquivo fechado");

  @override
  void open() => print("Win :: Arquivo aberto");
}

class LinuxFile implements File {
  @override
  void close() => print("Lin :: Arquivo fechado");

  @override
  void open() => print("Lin :: Arquivo aberto");
}

// Interface Abstract Factory

abstract class OSFactory {
  File createFile();
}

// Implementação concreta do {Abstract Factory} para diferentes sistemas operacionais

class WindowsFactory implements OSFactory {
  @override
  File createFile() => WindowsFile();
}

class LinuxFactory implements OSFactory {
  @override
  File createFile() => LinuxFile();
}

// Cliente

class FileManage {
  final OSFactory _osFactory;
  late final File _file;

  FileManage(this._osFactory) {
    _file = _osFactory.createFile();
  }

  void operateFile() {
    _file.open();
    _file.close();
  }
}

// Main > OSFactory => TypedOSFactory

void abstractFactory(String? type) => switch (type) {
      "win" => FileManage(WindowsFactory()).operateFile(),
      "lin" => FileManage(LinuxFactory()).operateFile(),
      _ => print("Tipo não identificado. Use -h/--help")
    };

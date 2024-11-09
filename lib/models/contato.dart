class TipoContato {
  final String nome;

  TipoContato(this.nome);

  Map<String, dynamic> toJson() => {'nome': nome};

  factory TipoContato.fromJson(Map<String, dynamic> json) {
    return TipoContato(json['nome'] as String);
  }
}

class Contato {
  final String? id;
  final String? nome;
  final String? email;
  final String? endereco;
  final List<TipoContato>? tipos;

  Contato({
    this.id,
    this.nome,
    this.email,
    this.endereco,
    this.tipos,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'email': email,
        'endereco': endereco,
        'tipos': tipos?.map((tipo) => tipo.toJson()).toList(),
      };

  factory Contato.fromJson(Map<String, dynamic> json) {
    return Contato(
      id: json['id'] as String?,
      nome: json['nome'] as String?,
      email: json['email'] as String?,
      endereco: json['endereco'] as String?,
      tipos: (json['tipos'] as List<dynamic>?)
          ?.map((tipoJson) =>
              TipoContato.fromJson(tipoJson as Map<String, dynamic>))
          .toList(),
    );
  }
}

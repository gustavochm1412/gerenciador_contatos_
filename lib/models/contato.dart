
class TipoContato {
  final String nome;

  TipoContato(this.nome);

  Map<String, dynamic> toJson() => {'nome': nome};

  factory TipoContato.fromJson(Map<String, dynamic> json) {
    return TipoContato(json['nome']);
  }
}

class Contato {
  final String nome;
  final String email;
  final String endereco;
  final List<TipoContato> tipos; 

  Contato({
    required this.nome,
    required this.email,
    required this.endereco,
    required this.tipos,
  });

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'email': email,
        'endereco': endereco,
        'tipos': tipos.map((tipo) => tipo.toJson()).toList(), 
      };

  factory Contato.fromJson(Map<String, dynamic> json) {
    return Contato(
      nome: json['nome'],
      email: json['email'],
      endereco: json['endereco'],
      tipos: List<TipoContato>.from(json['tipos'].map((json) => TipoContato.fromJson(json))), 
    );
  }
}

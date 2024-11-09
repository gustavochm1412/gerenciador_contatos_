import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AbstractCrudService<T> {
  final http.Client client;

  AbstractCrudService(this.client);

  String getComplemento();
  T getInstance(Map<String, dynamic> item);

  String url = "http://localhost:3040";

  Future<List<T>> findAll() async {
    http.Response retorno =
        await client.get((Uri.parse('$url/${getComplemento()}')));

    if (retorno.statusCode == 200) {
      List<Map<String, dynamic>> listData =
          List<Map<String, dynamic>>.from(jsonDecode(retorno.body));
      List<T> loadedItems = [];
      for (Map<String, dynamic> item in listData) {
        loadedItems.add(getInstance(item));
      }
      return loadedItems;
    } else {
      throw Exception('Erro ao carregar lista de itens');
    }
  }

  Future<T> findById(int id) async {
    http.Response retorno =
        await client.get((Uri.parse('$url/${getComplemento()}/$id')));

    if (retorno.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(retorno.body);
      return getInstance(data);
    } else {
      throw Exception('Erro ao carregar item com ID $id');
    }
  }

  Future<void> save(Map<String, dynamic> body) async {
    http.Response response = await client.post(
      (Uri.parse('$url/${getComplemento()}')),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode != 201) {
      throw Exception('Erro ao salvar');
    }
  }

  Future<void> update(int id, Map<String, dynamic> body) async {
    http.Response response = await client.put(
      (Uri.parse('$url/${getComplemento()}/$id')),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao editar');
    }
  }

  Future<void> delete(int id) async {
    http.Response response =
        await client.delete((Uri.parse('$url/${getComplemento()}/$id')));

    if (response.statusCode != 204) {
      throw Exception('Erro ao deletar');
    }
  }
}

class ContatoService extends AbstractCrudService<Contato> {
  ContatoService(http.Client client) : super(client);

  @override
  String getComplemento() => "contatos";

  @override
  Contato getInstance(Map<String, dynamic> item) {
    return Contato.fromJson(item);
  }
}

class Contato {
  final int id;
  final String nome;
  final String email;
  final String endereco;
  final List<Map<String, dynamic>> tipos;

  Contato(
      {required this.id,
      required this.nome,
      required this.email,
      required this.endereco,
      required this.tipos});

  factory Contato.fromJson(Map<String, dynamic> json) {
    return Contato(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      endereco: json['endereco'],
      tipos: List<Map<String, dynamic>>.from(json['tipos']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'endereco': endereco,
      'tipos': tipos,
    };
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:temperos_app/models/contato.dart';

class RequisitionService {
  String url = "http://localhost:3000";

  Future<Response> save({
    required String nome,
    required String email,
    required String tipo,
    required String endereco,
  }) async {
    var body = {
      'nome': nome,
      'email': email,
      'endereco': endereco,
      'tipos': [
        {
          'nome': tipo,
        }
      ]
    };

    final response = await http.post(
      Uri.parse('$url/contatos'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );

    if (response.statusCode != 201) {
      print(response.statusCode);
      throw Exception('Erro ao salvar');
    }
    return response;
  }

  Future<List<Contato>> findTodo() async {
    final response = await http.get(
      Uri.parse('$url/contatos'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body);
      List<Contato> contatos = responseData
          .map((dynamic item) => Contato.fromJson(item as Map<String, dynamic>))
          .toList();

      return contatos;
    } else {
      throw Exception(
          'Erro no retorno da api, status code: ${response.statusCode}');
    }
  }

  Future<Response> delete({
    required String id,
  }) async {
    final response = await http.delete(
      Uri.parse('$url/contatos/$id'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Exception('Erro ao salvar');
    }
    return response;
  }

  Future<Response> update({
    required String id,
    required String nome,
    required String email,
    required String tipo,
    required String endereco,
  }) async {
    var body = {
      'nome': nome,
      'email': email,
      'endereco': endereco,
      'tipos': [
        {
          'nome': tipo,
        }
      ]
    };

    final response = await http.put(
      Uri.parse('$url/contatos/$id'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );

    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Exception('Erro ao salvar');
    }
    return response;
  }
}

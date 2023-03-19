class Fisioterapeuta {
  late String matricula;
  late String nome;
  late String email;
  late String senha;
  late dynamic instituicao;
  late dynamic id;

  Fisioterapeuta(
      {required this.matricula,
      required this.nome,
      required this.email,
      required this.senha,
      this.instituicao,
      required this.id});

  factory Fisioterapeuta.fromJson(Map json) {
    return Fisioterapeuta(
        matricula: json['matricula'] ?? '',
        nome: json['nome'] ?? '',
        email: json['email'] ?? '',
        senha: json['senha'] ?? '',
        instituicao: json['instituicao'] ?? '',
        id: json['matricula'] ?? '');
  }
}

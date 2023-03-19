class Pacientes {
  late String matricula;
  late String nome;
  late String cpf;
  late String telefone;
  late String dataNascimento;
  late double altura;
  late double peso;
  late double imc;
  late String email;
  late String senha;

  Pacientes(
      {required this.matricula,
      required this.nome,
      required this.cpf,
      required this.dataNascimento,
      required this.telefone,
      required this.altura,
      required this.peso,
      required this.imc,
      required this.email,
      required this.senha});

  factory Pacientes.fromJson(Map<String, dynamic> json) {
    return Pacientes(
      matricula: json['matricula'] ?? '',
      nome: json['nome'] ?? '',
      dataNascimento: json['data_nascimento'],
      telefone: json['telefone'],
      cpf: json['cpf'] ?? '',
      altura: json['altura'] ?? '',
      peso: json['peso'] ?? '',
      imc: json['imc'] ?? '',
      email: json['email'] ?? '',
      senha: json['senha'] ?? '',
    );
  }
}

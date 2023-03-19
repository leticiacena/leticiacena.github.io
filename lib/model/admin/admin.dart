class Administrador {
  late String email;
  late String senha;
  late int id;

  Administrador({required this.email, required this.senha, required this.id});

  factory Administrador.fromJson(Map<String, dynamic> json) {
    return Administrador(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      senha: json['senha'] ?? '',
    );
  }
}

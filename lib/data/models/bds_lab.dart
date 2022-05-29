import 'dart:convert';

class BdsLab {
  final String id;
  final String email;
  final String name;
  final String address;
  final String telephone;
  BdsLab({
    required this.id,
    required this.email,
    required this.name,
    required this.address,
    required this.telephone,
  });

  BdsLab copyWith({
    String? id,
    String? email,
    String? name,
    String? address,
    String? telephone,
  }) {
    return BdsLab(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      telephone: telephone ?? this.telephone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'address': address,
      'telephone': telephone,
    };
  }

  factory BdsLab.fromMap(Map<String, dynamic> map) {
    return BdsLab(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      telephone: map['telephone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BdsLab.fromJson(String source) => BdsLab.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BdsLab(id: $id, email: $email, name: $name, address: $address, telephone: $telephone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BdsLab &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.address == address &&
        other.telephone == telephone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        address.hashCode ^
        telephone.hashCode;
  }
}

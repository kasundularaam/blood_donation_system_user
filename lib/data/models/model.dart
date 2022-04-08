import 'dart:convert';

class BdsUser {
  final String nic;
  final String uid;
  final String email;
  final String name;
  final String address;
  final String bloodGroup;
  final int dobTimeStamp;
  BdsUser({
    required this.nic,
    required this.uid,
    required this.email,
    required this.name,
    required this.address,
    required this.bloodGroup,
    required this.dobTimeStamp,
  });

  BdsUser copyWith({
    String? nic,
    String? uid,
    String? email,
    String? name,
    String? address,
    String? bloodGroup,
    int? dobTimeStamp,
  }) {
    return BdsUser(
      nic: nic ?? this.nic,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      dobTimeStamp: dobTimeStamp ?? this.dobTimeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nic': nic,
      'uid': uid,
      'email': email,
      'name': name,
      'address': address,
      'bloodGroup': bloodGroup,
      'dobTimeStamp': dobTimeStamp,
    };
  }

  factory BdsUser.fromMap(Map<String, dynamic> map) {
    return BdsUser(
      nic: map['nic'] ?? '',
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
      dobTimeStamp: map['dobTimeStamp']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BdsUser.fromJson(String source) =>
      BdsUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BdsUser(nic: $nic, uid: $uid, email: $email, name: $name, address: $address, bloodGroup: $bloodGroup, dobTimeStamp: $dobTimeStamp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BdsUser &&
        other.nic == nic &&
        other.uid == uid &&
        other.email == email &&
        other.name == name &&
        other.address == address &&
        other.bloodGroup == bloodGroup &&
        other.dobTimeStamp == dobTimeStamp;
  }

  @override
  int get hashCode {
    return nic.hashCode ^
        uid.hashCode ^
        email.hashCode ^
        name.hashCode ^
        address.hashCode ^
        bloodGroup.hashCode ^
        dobTimeStamp.hashCode;
  }
}

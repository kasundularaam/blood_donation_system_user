import 'dart:convert';

class BdsUser {
  final String nic;
  final String uid;
  final String type;
  final String email;
  final String name;
  final String address;
  final String bloodGroup;
  final int dobTimeStamp;
  final bool status;
  BdsUser({
    required this.nic,
    required this.uid,
    required this.type,
    required this.email,
    required this.name,
    required this.address,
    required this.bloodGroup,
    required this.dobTimeStamp,
    required this.status,
  });

  BdsUser copyWith({
    String? nic,
    String? uid,
    String? type,
    String? email,
    String? name,
    String? address,
    String? bloodGroup,
    int? dobTimeStamp,
    bool? status,
  }) {
    return BdsUser(
      nic: nic ?? this.nic,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      dobTimeStamp: dobTimeStamp ?? this.dobTimeStamp,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nic': nic,
      'uid': uid,
      'type': type,
      'email': email,
      'name': name,
      'address': address,
      'bloodGroup': bloodGroup,
      'dobTimeStamp': dobTimeStamp,
      'status': status,
    };
  }

  factory BdsUser.fromMap(Map<String, dynamic> map) {
    return BdsUser(
      nic: map['nic'] ?? '',
      uid: map['uid'] ?? '',
      type: map['type'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
      dobTimeStamp: map['dobTimeStamp']?.toInt() ?? 0,
      status: map['status'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BdsUser.fromJson(String source) =>
      BdsUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BdsUser(nic: $nic, uid: $uid, type: $type, email: $email, name: $name, address: $address, bloodGroup: $bloodGroup, dobTimeStamp: $dobTimeStamp, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BdsUser &&
        other.nic == nic &&
        other.uid == uid &&
        other.type == type &&
        other.email == email &&
        other.name == name &&
        other.address == address &&
        other.bloodGroup == bloodGroup &&
        other.dobTimeStamp == dobTimeStamp &&
        other.status == status;
  }

  @override
  int get hashCode {
    return nic.hashCode ^
        uid.hashCode ^
        type.hashCode ^
        email.hashCode ^
        name.hashCode ^
        address.hashCode ^
        bloodGroup.hashCode ^
        dobTimeStamp.hashCode ^
        status.hashCode;
  }
}

import 'dart:convert';

class BdsUser {
  final String nic;
  final String uid;
  final String type;
  final String email;
  final String img;
  final String name;
  final String address;
  final String bloodGroup;
  final int dob;
  final String hospital;
  final bool status;
  final String mobile;
  final String gender;
  final int lastTestedDate;
  final String donationAbility;
  BdsUser({
    required this.nic,
    required this.uid,
    required this.type,
    required this.email,
    required this.img,
    required this.name,
    required this.address,
    required this.bloodGroup,
    required this.dob,
    required this.hospital,
    required this.status,
    required this.mobile,
    required this.gender,
    required this.lastTestedDate,
    required this.donationAbility,
  });

  BdsUser copyWith({
    String? nic,
    String? uid,
    String? type,
    String? email,
    String? img,
    String? name,
    String? address,
    String? bloodGroup,
    int? dob,
    String? hospital,
    bool? status,
    String? mobile,
    String? gender,
    int? lastTestedDate,
    String? donationAbility,
  }) {
    return BdsUser(
      nic: nic ?? this.nic,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      email: email ?? this.email,
      img: img ?? this.img,
      name: name ?? this.name,
      address: address ?? this.address,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      dob: dob ?? this.dob,
      hospital: hospital ?? this.hospital,
      status: status ?? this.status,
      mobile: mobile ?? this.mobile,
      gender: gender ?? this.gender,
      lastTestedDate: lastTestedDate ?? this.lastTestedDate,
      donationAbility: donationAbility ?? this.donationAbility,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nic': nic,
      'uid': uid,
      'type': type,
      'email': email,
      'img': img,
      'name': name,
      'address': address,
      'bloodGroup': bloodGroup,
      'dob': dob,
      'hospital': hospital,
      'status': status,
      'mobile': mobile,
      'gender': gender,
      'lastTestedDate': lastTestedDate,
      'donationAbility': donationAbility,
    };
  }

  factory BdsUser.fromMap(Map<String, dynamic> map) {
    return BdsUser(
      nic: map['nic'] ?? '',
      uid: map['uid'] ?? '',
      type: map['type'] ?? '',
      email: map['email'] ?? '',
      img: map['img'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
      dob: map['dob']?.toInt() ?? 0,
      hospital: map['hospital'] ?? '',
      status: map['status'] ?? false,
      mobile: map['mobile'] ?? '',
      gender: map['gender'] ?? '',
      lastTestedDate: map['lastTestedDate']?.toInt() ?? 0,
      donationAbility: map['donationAbility'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BdsUser.fromJson(String source) =>
      BdsUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BdsUser(nic: $nic, uid: $uid, type: $type, email: $email, img: $img, name: $name, address: $address, bloodGroup: $bloodGroup, dob: $dob, hospital: $hospital, status: $status, mobile: $mobile, gender: $gender, lastTestedDate: $lastTestedDate, donationAbility: $donationAbility)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BdsUser &&
        other.nic == nic &&
        other.uid == uid &&
        other.type == type &&
        other.email == email &&
        other.img == img &&
        other.name == name &&
        other.address == address &&
        other.bloodGroup == bloodGroup &&
        other.dob == dob &&
        other.hospital == hospital &&
        other.status == status &&
        other.mobile == mobile &&
        other.gender == gender &&
        other.lastTestedDate == lastTestedDate &&
        other.donationAbility == donationAbility;
  }

  @override
  int get hashCode {
    return nic.hashCode ^
        uid.hashCode ^
        type.hashCode ^
        email.hashCode ^
        img.hashCode ^
        name.hashCode ^
        address.hashCode ^
        bloodGroup.hashCode ^
        dob.hashCode ^
        hospital.hashCode ^
        status.hashCode ^
        mobile.hashCode ^
        gender.hashCode ^
        lastTestedDate.hashCode ^
        donationAbility.hashCode;
  }
}

class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? uid;
  String? number;
  String? location;
  String? bloodgroup;
  String? gender;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.uid,
    this.number,
    this.location,
    this.bloodgroup,
    this.gender,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      firstName: map['firstName'],
      lastName: map['userName'],
      email: map['email'],
      uid: map['uid'],
      number: map['number'],
      location: map['location'],
      bloodgroup: map['bloodgroup'],
      gender: map['gender'],
    );
  }

//sending
  Map<String, dynamic> tomap() {
    return {
      'firstName': firstName,
      'userName': lastName,
      'email': email,
      'uid': uid,
      'number': number,
      'location': location,
      'bloodgroup': bloodgroup,
      'gender': gender,
    };
  }
}

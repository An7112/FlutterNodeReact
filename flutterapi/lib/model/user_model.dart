// class UserModel {
//   String? uid;
//   String? email;
//   String? firstName;
//   String? secondName;
//   String? ethnic;
//   String? CMND;
//   String? SDT;
//   UserModel(
//       {this.uid,
//       this.email,
//       this.firstName,
//       this.secondName,
//       this.ethnic,
//       this.CMND,
//       this.SDT});

//   // nhận dữ liệu từ server
//   factory UserModel.fromMap(map) {
//     return UserModel(
//         uid: map['uid'],
//         email: map['email'],
//         firstName: map['firstName'],
//         secondName: map['secondName'],
//         ethnic: map['ethnic'],
//         CMND: map['CMND'],
//         SDT: map['SDT']);
//   }

//   // gửi dữ liệu đến máy chủ
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'email': email,
//       'firstName': firstName,
//       'secondName': secondName,
//       'ethnic': ethnic,
//       'CMND': CMND,
//       'SDT': SDT
//     };
//   }
// }

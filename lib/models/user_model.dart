// class UserModel {
//   final String? email;
//   final String? id;
//   final String? name;
//   final PictureModel? pictureModel;
//
//   const UserModel({this.name, this.pictureModel, this.email, this.id});
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//       email: json['email'],
//       id: json['id'] as String?,
//       name: json['name'],
//       pictureModel: PictureModel.fromJson(json['picture']['data']));
// }
//
// class PictureModel {
//   final String? url;
//   final int? width;
//   final int? height;
//
//   const PictureModel({this.width, this.height, this.url});
//
//   factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(
//       url: json['url'], width: json['width'], height: json['height']);
// }

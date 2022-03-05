class Post {
  String id;
  String fullname;
  String mobile;


  Post({this.id, this.fullname, this.mobile});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullname = json['fullname'],
         mobile = json['mobile'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullname': fullname,
    'mobile': mobile,

  };
}
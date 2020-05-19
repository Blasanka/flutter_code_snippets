class User {
  final String user;
  final String token;

  User(this.user, this.token);

  // here because of user object is too long Im storing it as string
  // and that is actually not a good way to do this because of when you want to
  // fetch user and handle information it will be very hard to do those and also when testing
  // please map other properties in your json to model and that's the best way.
  User.fromJson(dynamic obj)
      : this.user = obj['user'].toString(),
        this.token = obj['token'];

  String get getUser => user;
  String get getToken => token;

  Map<String, dynamic> toMap() => {'user': user, 'token': token};
}

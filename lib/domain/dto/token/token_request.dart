class AccessTokenRequest{
  String? grant_type;
  String? client_id;
  String? client_secret;
  String? username;
  String? password;

  AccessTokenRequest({
    this.grant_type,
    this.client_id,
    this.client_secret,
    this.username,
    this.password,
  });

  factory AccessTokenRequest.fromJson(Map<String, dynamic> json) => AccessTokenRequest(
    grant_type: json["grant_type"],
    client_id: json["client_id"],
    client_secret: json["client_secret"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "grant_type": grant_type,
    "client_id": client_id,
    "client_secret": client_secret,
    "username": username,
    "password": password,
  };
}

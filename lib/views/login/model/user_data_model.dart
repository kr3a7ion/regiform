class DisplayUserData {
  String? userName;
  String? email;

  DisplayUserData({required this.userName, required this.email});

  // Factory method to create a UserModel from a Map
  factory DisplayUserData.fromMap(Map<String, dynamic> data) {
    return DisplayUserData(
      userName: data['username'] ?? 'No username',
      email: data['email'] ?? 'No email',
    );
  }
}

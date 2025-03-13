class CheckInData {
  final String imagePath;
  final String address;
  final String timestamp;

  CheckInData({
    required this.imagePath,
    required this.address,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {'imagePath': imagePath, 'address': address, 'timestamp': timestamp};
  }

  factory CheckInData.fromJson(Map<String, dynamic> json) {
    return CheckInData(
      imagePath: json['imagePath'],
      address: json['address'],
      timestamp: json['timestamp'],
    );
  }
}

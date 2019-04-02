class GetUserList {
  String id;
  String loginId;
  String password;
  String roleId;
  String name;
  String email;
  String mobileNo;
  String address;
  String deviceType;
  String deviceToken;
  String deviceId;
  String gpsStatus;
  String latitude;
  String longitude;
  String batteryStatus;
  String movingStatus;
  String lastLocationServiceHitTime;
  String status;
  String created;

  GetUserList(
      {this.id,
        this.loginId,
        this.password,
        this.roleId,
        this.name,
        this.email,
        this.mobileNo,
        this.address,
        this.deviceType,
        this.deviceToken,
        this.deviceId,
        this.gpsStatus,
        this.latitude,
        this.longitude,
        this.batteryStatus,
        this.movingStatus,
        this.lastLocationServiceHitTime,
        this.status,
        this.created});

  GetUserList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loginId = json['login_id'];
    password = json['password'];
    roleId = json['role_id'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    address = json['address'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    deviceId = json['device_id'];
    gpsStatus = json['gps_status'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    batteryStatus = json['battery_status'];
    movingStatus = json['moving_status'];
    lastLocationServiceHitTime = json['last_location_service_hit_time'];
    status = json['status'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login_id'] = this.loginId;
    data['password'] = this.password;
    data['role_id'] = this.roleId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['address'] = this.address;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['device_id'] = this.deviceId;
    data['gps_status'] = this.gpsStatus;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['battery_status'] = this.batteryStatus;
    data['moving_status'] = this.movingStatus;
    data['last_location_service_hit_time'] = this.lastLocationServiceHitTime;
    data['status'] = this.status;
    data['created'] = this.created;
    return data;
  }
}
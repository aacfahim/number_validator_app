class JsonModel {
  String? phone;
  bool? valid;
  Format? format;
  Country? country;
  String? location;
  String? type;
  String? carrier;

  JsonModel(
      {this.phone,
      this.valid,
      this.format,
      this.country,
      this.location,
      this.type,
      this.carrier});

  JsonModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    valid = json['valid'];
    format =
        json['format'] != null ? new Format.fromJson(json['format']) : null;
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    location = json['location'];
    type = json['type'];
    carrier = json['carrier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['valid'] = this.valid;
    if (this.format != null) {
      data['format'] = this.format!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['location'] = this.location;
    data['type'] = this.type;
    data['carrier'] = this.carrier;
    return data;
  }
}

class Format {
  String? international;
  String? local;

  Format({this.international, this.local});

  Format.fromJson(Map<String, dynamic> json) {
    international = json['international'];
    local = json['local'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['international'] = this.international;
    data['local'] = this.local;
    return data;
  }
}

class Country {
  String? code;
  String? name;
  String? prefix;

  Country({this.code, this.name, this.prefix});

  Country.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    prefix = json['prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['prefix'] = this.prefix;
    return data;
  }
}

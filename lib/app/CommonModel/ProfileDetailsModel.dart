class ProfileDetailsModel {
  String? name;
  String? mobileNumber;
  String? email;
  String? city;
  String? about;
  String? portfolioLink;
  String? languages;

  ProfileDetailsModel(
      {this.name,
        this.mobileNumber,
        this.email,
        this.city,
        this.about,
        this.portfolioLink,
        this.languages});

  ProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    city = json['city'];
    about = json['about'];
    portfolioLink = json['portfolioLink'];
    languages = json['languages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    data['city'] = this.city;
    data['about'] = this.about;
    data['portfolioLink'] = this.portfolioLink;
    data['languages'] = this.languages;
    return data;
  }
}

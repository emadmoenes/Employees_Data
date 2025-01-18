class Employee {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String image;
  final Address address;
  final Company company;

  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.image,
    required this.address,
    required this.company,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] ?? 0,
      firstName: json['firstName'] ?? 'Unknown',
      lastName: json['lastName'] ?? 'Unknown',
      username: json['username'] ?? 'Unknown',
      email: json['email'] ?? 'No Email',
      phone: json['phone'] ?? 'No Phone',
      website: json['website'] ?? 'No Website',
      image: json['image'] ?? 'https://via.placeholder.com/150',
      address: Address.fromJson(json['address'] ?? {}),
      company: Company.fromJson(json['company'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
      'image': image,
      'address': address.toJson(),
      'company': company.toJson(),
    };
  }

  String get fullName => '$firstName $lastName';
}

class Address {
  final String street;
  final String city;
  final String postalCode;
  final String state;

  Address({
    required this.street,
    required this.city,
    required this.postalCode,
    required this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['address'] ?? 'Unknown Street',
      city: json['city'] ?? 'Unknown City',
      postalCode: json['postalCode'] ?? 'No Postal Code',
      state: json['state'] ?? 'No State',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'postalCode': postalCode,
      'state': state,
    };
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] ?? 'Unknown Company',
      catchPhrase: json['catchPhrase'] ?? 'No Catch Phrase',
      bs: json['bs'] ?? 'No BS',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }
}

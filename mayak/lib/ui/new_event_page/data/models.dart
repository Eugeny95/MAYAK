// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressData {
  String street = '';
  String house = '';
  int flat = 0;
  int entrance = 0;
  int floor = 0;
  String doorphone = '';
  String city;
  double deliveryCost = 0.0;
  AddressData(
      {required this.street,
      required this.house,
      required this.flat,
      required this.entrance,
      required this.floor,
      required this.doorphone,
      required this.deliveryCost,
      required this.city});
}

import 'package:intellitrack/Model/city.dart';
import 'package:intellitrack/Model/type.dart';

class Warehouse{
    final int id;
    final City city;
    final String address;
    final double capacity;
    final Type type;
    final double costPerM3;

  Warehouse(this.id, this.city, this.address, this.capacity, this.type, this.costPerM3);
}
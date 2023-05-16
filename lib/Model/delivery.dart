class Delivery{
  Delivery(this.id, this.origin, this.destination, this.departureDate, this.arriveDate, this.costPerTon, this.travelCost, this.status, this.type, this.idDriver, this.nit, this.comments, this.products);
  final int id;
  final String origin;
  final String destination;
  final String departureDate;
  final String arriveDate;
  final double costPerTon;
  final double travelCost;
  final String status;
  final String type;
  final int idDriver;
  final String nit;
  late final String comments;
  final List<Product> products;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'origin': origin,
      'destination': destination,
      'departureDate': departureDate,
      'arriveDate': arriveDate,
      'costPerTon': costPerTon,
      'travelCost': travelCost,
      'status': status,
      'type': type,
      'idDriver': idDriver,
      'nit': nit,
      'comments': comments,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}

class Product{
  Product(this.id, this.category, this.weight, this.volume, this.name);
  final int id;
  final String category;
  final double weight;
  final double volume;
  final String name;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'weight': weight,
      'volume': volume,
      'name': name,
    };
  }
}

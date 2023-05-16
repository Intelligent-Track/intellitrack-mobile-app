import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intellitrack/Model/city.dart';
import 'package:intellitrack/Model/type.dart';
import 'package:intellitrack/Model/warehouse.dart';

import '../../Model/environment.dart';
import '../../Controller/warehouse_service.dart';

var warehouseService = WarehouseService();
var  loading = false;

class WarehouseListPage extends StatefulWidget {
  const WarehouseListPage({Key? key}) : super(key: key);

  @override
  _WarehouseListPageState createState() => _WarehouseListPageState();
}

class _WarehouseListPageState extends State<WarehouseListPage> {
  List<Warehouse> warehouses = [];

  @override
  void initState() {
    super.initState();
    loading = false;
     warehouseService.fetchWarehouses().then((value) => {
      setState((){
        warehouses = value;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading? Center(child: CircularProgressIndicator(color: Colors.red,),):Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white,
            elevation: 1,
            centerTitle: true,
          title: const Text('Bodegas', style: TextStyle(color: Colors.black),),
        ),
      body: ListView.builder(
        itemCount: warehouses.length,
        itemBuilder: (context, index) {
          final warehouse = warehouses[index];
          return ListTile(
            leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Image/warehouse.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
            title: Text('Warehouse ID: ${warehouse.id}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ciudad: ${warehouse.city.name}'),
                Text('Direccion: ${warehouse.address}'),
                Text('Tipo: ${warehouse.type.name}'),
                Text('Costo por m^3: ${warehouse.costPerM3}'),
              ],
            ),
            trailing: Expanded(
              child: Text('Capacidad: ${warehouse.capacity}'),
            ),
          );
        },
      ),
    );
  }
}
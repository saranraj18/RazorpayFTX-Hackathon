import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:razorpay_user/Models/food_model.dart';

class FoodItems with ChangeNotifier {
  List<FoodModel> _items = [];

  List<FoodModel> get items {
    return [..._items];
  }

  List<FoodModel> get breakfastItems {
    return [..._items.where((food) => food.type == 'Breakfast')];
  }

  List<FoodModel> get lunchItems {
    return [..._items.where((food) => food.type == 'Lunch')];
  }

  List<FoodModel> get dinnerItems {
    return [..._items.where((food) => food.type == 'Dinner')];
  }

  List<FoodModel> get specialItems {
    return [..._items.where((food) => food.type == 'Special')];
  }

  FoodModel findById(String id) {
    return _items.firstWhere((order) => order.id == id);
  }

  bool verifyFood(String id) {
    if (_items.indexWhere((order) => order.id == id) >= 0) {
      return true;
    } else {
      return false;
    }
  }

  bool _listFetched = false;
  bool get listFetched => _listFetched;

  final CollectionReference _foodStore =
      FirebaseFirestore.instance.collection('FoodItems');

  Future<void> fetchItems() async {
    try {
      QuerySnapshot querySnap = await _foodStore.get();
      final List<FoodModel> loadedItems = [];
      for (var doc in querySnap.docs) {
        final data = doc.data() as Map;

        loadedItems.add(
          FoodModel(
            id: data['id'],
            title: data['title'],
            description: data['description'],
            price: data['price'],
            availability: data['availability'],
            imageUrl: data['imageUrl'],
            type: data['type'],
            combo: data['combo'] ?? false,
            comboDocs: data['comboDocs'],
            comboItems: [],
          ),
        );
      }

      for (var food in loadedItems) {
        if (food.combo == true) {
          List<FoodModel> _comboItems = [];
          for (int i = 0; i < food.comboDocs!.length; i++) {
            final _ind = loadedItems.indexWhere(
                (element) => element.id == food.comboDocs![i].toString());

            if (_ind > -1) {
              _comboItems.add(loadedItems[_ind]);
            }
          }
          food.comboItems = _comboItems;
        }

        if (food.comboItems!.isNotEmpty) {
          food.combo = false;
        }
      }

      _items = loadedItems;
      _listFetched = true;

      notifyListeners();
    } catch (error) {
      // print(error);
      rethrow;
    }
  }

  void editItems(String id, int quantity) {
    final food = findById(id);

    food.availability = food.availability! - quantity;

    notifyListeners();
  }
}

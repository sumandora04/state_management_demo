import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/providers/cart.dart';
import 'package:state_management_demo/providers/product.dart';
import 'package:state_management_demo/providers/products.dart';
import 'package:state_management_demo/screens/cart_screen.dart';
import 'package:state_management_demo/widgets/badge.dart';
import 'package:state_management_demo/widgets/product_grid_tile.dart';

enum FilterOption { Favourite, ShowAll }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFav = false;

  @override
  Widget build(BuildContext context) {
    // final productContainer = Provider.of<Products>(context, listen: true);
    print("Widget Created - ProductOverviewScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOption selectedItem) {
                setState(() {
                  if (selectedItem == FilterOption.Favourite) {
                    // productContainer.showFavouriteOnly();
                    _showOnlyFav = true;
                  } else {
                    // productContainer.showAll();
                    _showOnlyFav = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("Only Favourite"),
                      value: FilterOption.Favourite,
                    ),
                    PopupMenuItem(
                      child: Text("Show All"),
                      value: FilterOption.ShowAll,
                    ),
                  ]),
          Consumer<Cart>(
            builder: (BuildContext context, cart, _child) => Badge(
              child: _child!,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: ProductGridTile(_showOnlyFav),
    );
  }
}

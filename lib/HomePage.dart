import 'dart:convert';

import 'package:cocktail/DrinkDetail.dart';
import 'package:cocktail/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(Uri.parse(api));
    drinks = jsonDecode(res.body)["drinks"];

    print(drinks.toString());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Cocktail App",
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return ListTile(
                      leading: Hero(
                        tag: drink["idDrink"],
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            drink["strDrinkThumb"] ??
                                "data:image/png;base64,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",
                          ),
                        ),
                      ),
                      title: Text(
                        "${drink["strDrink"]}",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      subtitle: Text(
                        "${drink["idDrink"]}",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DrinkDetails(drink: drink)),
                        );
                      },
                    );
                  },
                )
              : CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
        ),
      ),
    );
  }
}

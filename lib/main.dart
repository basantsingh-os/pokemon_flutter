import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokemon/pokemon.dart';
import 'package:pokemon/pokemon_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PokeHub pokeHub;
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  @override
  void initState() {
    fetchData();
    print("2nd word");
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodedJson);
    
    setState(() {
      
    
    });

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Pokemon app"),
      ),
      body: pokeHub == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
                crossAxisCount: 2,
                children: pokeHub.pokemon
                    .map((poke) => InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>PokeDetail(pokemon:poke)));
                      },
                                 child: Hero(
                                   tag:poke.img,
                                                                    child: Card(
                            elevation: 28,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(poke.img))),
                                ),
                                Text(
                                    poke.name,
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                                 ),
                    ))
                    .toList()),
          ),
      drawer: Drawer(
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0),
    );
  }
}

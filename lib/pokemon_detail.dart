import 'package:flutter/material.dart';
import 'package:pokemon/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  bodyWidget(BuildContext context)=>Stack(
    children: <Widget>[
      
         Positioned(
          height:MediaQuery.of(context).size.height/1.5,
          width:MediaQuery.of(context).size.width -20,
          left:10,
          top:MediaQuery.of(context).size.height*0.1,


                  child: Card(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 52)),

                Text(pokemon.name,style:TextStyle(fontWeight: FontWeight.bold, fontSize:22)),
                Text("Height ${pokemon.height}",style: TextStyle(fontSize: 18)),
                Text("Weight ${pokemon.weight}",style: TextStyle(fontSize: 18)),
                Text("Types",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type.map((t)=>
                FilterChip(
                  backgroundColor: Colors.amber,
                  label: Text(t,style:TextStyle(color:Colors.white)),onSelected: (b){},)
                ).toList()),
                Text("weakness",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses.map((t)=>
                FilterChip(
                  backgroundColor: Colors.red,
                  label: Text(t,style:TextStyle(color:Colors.white)),onSelected: (b){},)
                ).toList()),
                Text("Next Evolution",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution.map((n)=>
                FilterChip(backgroundColor: Colors.green,label: Text(n.name,style:TextStyle(color:Colors.white)),onSelected: (b){},)
                ).toList())
              ],
            ),
          ),
        ),
        Align(alignment: Alignment.topCenter,
        child:Hero(tag:pokemon.img,child:Container(
          height:200,
          width:200,
          decoration: BoxDecoration(
            image:DecorationImage(
              fit: BoxFit.cover,
              image:NetworkImage(pokemon.img))
          ),
        ))
        )
        
        
        

      
      
    ],
  );

  const PokeDetail({ this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        
        title:Text(pokemon.name),

      ),

      body:bodyWidget(context)
    );
  }
}
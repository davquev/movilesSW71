import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

//void main() => runApp(MyApp()) otra forma

//presionando stless + enter
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'App Name Generator!!',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: RandomWords(),
        );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> suggestions = <WordPair>[];
  final TextStyle biggerFont = TextStyle(fontSize: 18);
  final Set<WordPair> saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name Generator!!!'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: pushSaved),
        ],
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions(){
    return ListView.builder(
      padding: EdgeInsets.all(30),
      itemBuilder: (BuildContext context, int i){
        if(i.isOdd){
          return Divider();
        }
        final int index = i ~/ 2;

        if (index >= suggestions.length){
          suggestions.addAll(generateWordPairs().take(10));
        }
        return buildRow(suggestions[index]);
      },
    );
  }

  Widget buildRow(WordPair pair) {
    final bool alreadySaved = saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          alreadySaved ? saved.remove(pair) : saved.add(pair);
        });
      },
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
     MaterialPageRoute<void>(
       builder: (BuildContext context){
         final Iterable<ListTile> tiles = saved.map(
             (WordPair pair){
               return ListTile(
                 title: Text(
                   pair.asPascalCase,
                   style: biggerFont,
                 ),
               );
             }
         );
         final List<Widget> divided = ListTile.divideTiles(
           context: context,
           tiles: tiles,
         )
         .toList();
         return Scaffold(
           appBar: AppBar(
             title: Text('Saved suggestions!!!'),
           ),
           body: ListView(children: divided),
         );
       }
     )
    );
  }
}



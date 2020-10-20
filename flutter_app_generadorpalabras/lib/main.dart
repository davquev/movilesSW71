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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name Generator!!!'),
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions(){
    return ListView.builder(
      padding: EdgeInsets.all(16),
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
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
    );
  }
}



import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  Widget __buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    return Text.rich(
      TextSpan(text: 'Word ', children: <TextSpan>[
        TextSpan(
            text: wordPair.toString() + ' ',
            style: const TextStyle(color: Colors.blue)),
        TextSpan(
            text: wordPair.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ]),
      style: const TextStyle(fontSize: 24.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return __buildSuggestions();
  }
}

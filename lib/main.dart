import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        buttonColor: Colors.blueGrey[100],
        buttonTheme: const  ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        )
      ),
      home: const MyHomePage(),
    );
  }
}
class Kitten{
  const Kitten({required this.name, required this.description, required this.age, required this.imageUrl});

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";

final List<Kitten> _kittens = <Kitten>[
  Kitten(
      name: 'Mittens',
      description: 'Says meow meow',
      age: 1,
      imageUrl: 'https://static.toiimg.com/photo/msid-68523832/68523832.jpg?1137762'),
  Kitten(
      name: 'Meowdy',
      description: 'Box? who said box <3',
      age: 2,
      imageUrl: 'https://static.toiimg.com/photo/msid-68523832/68523832.jpg?1137762'),
  Kitten(
      name: 'Meowy',
      description: 'Are we still reading this? ohh',
      age: 3,
      imageUrl: 'https://static.toiimg.com/photo/msid-68523832/68523832.jpg?1137762'),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);

    return SimpleDialog(children: [Image.network(
      kitten.imageUrl,
      fit: BoxFit.fill,
    ),
      Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              kitten.name,
              style: localTheme.textTheme.headline4,
            ),
            Text(''
                '${kitten.age} months old',
              style: localTheme.textTheme.subtitle1!.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 16),
            Text(kitten.description,
                style: localTheme.textTheme.bodyText2),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  FlatButton(onPressed: () {},
                    child: const Text('I\'M ALLERGIC'),),
                  RaisedButton(onPressed: () {},
                    child: const Text('ADOPT'),)
                ],
              ),
            ),
          ],
        ),
      ),
    ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return new GestureDetector(
      onTap: () =>
          showDialog(
              context: context,
              builder: (context) => _dialogBuilder(context, _kittens[index])),
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        child: Text(_kittens[index].name,
            style: Theme
                .of(context)
                .textTheme
                .headline),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kittens available for Adoptions'),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,),

      floatingActionButton: FloatingActionButton.extended(
        label: Text('Louveee'),
        backgroundColor: Colors.blueGrey[400], onPressed: () {},
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'database_helper.dart';

void main() {
  runApp(MyApp());
}

/*----------------------------PRINCIPAL---------------------------------------*/

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Inici()

    );
  }
}

class Inici extends StatefulWidget {


  @override
  _IniciState createState() => _IniciState();
}

class _IniciState extends State<Inici> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: <Widget>[
            SizedBox(height: 80),
            Column(
              children: <Widget>[
                Image.asset('assets/nom.PNG'),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 30,),
            MaterialButton(
              height: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnadirReceta()),
                );
              },
              color: Colors.blue,
              child: Text('Añadir receta',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 20,),
            MaterialButton(
              height: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EliminarReceta()),
                );
              },
              color: Colors.blue,
              child: Text('Eliminar receta',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 20,),
            MaterialButton(
              height: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModificarReceta()),
                );
              },
              color: Colors.blue,
              child: Text('Modificar receta',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 40),
            Column(
              children: <Widget>[
                Image.asset('assets/decoracio.PNG'),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*----------------------------AÑADIR-RECETA-----------------------------------*/

class AnadirReceta extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Anadir()

    );
  }
}

class Anadir extends StatefulWidget {


  @override
  _AnadirState createState() => _AnadirState();
}

class _AnadirState extends State<Anadir> {
  final dbHelper = DatabaseHelper.instance;
  TextEditingController autorController = TextEditingController();
  TextEditingController recetaController = TextEditingController();
  TextEditingController ingredienteController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: <Widget>[
            SizedBox(height: 60),
            Column(
              children: <Widget>[
                Image.asset('assets/fons_nom.PNG'),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 40,),
            TextField(
              controller: autorController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre autor',
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: recetaController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre receta',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: ingredienteController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Ingredientes',
              ),
            ),
            SizedBox(height: 40,),
            MaterialButton(
              height: 50,
              color: Colors.blue,
              onPressed: () {
                String autor = autorController.text;
                String receta = recetaController.text;
                String ingrediente = ingredienteController.text;
                _insert(autor, receta, ingrediente);
              },
              child: Text('Añadir',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 10,),
            MaterialButton(
              height: 50,
              color: Colors.blue,
              onPressed: _query,
              child: Text('Query',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }

  void _insert(autor, receta, ingrediente) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnAutor: autor,
      DatabaseHelper.columnReceta: receta,
      DatabaseHelper.columnIngrediente: ingrediente,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('Estas són las recetas disponibles:');
    allRows.forEach(print);
  }

}

/*----------------------------ELIMINAR-RECETA---------------------------------*/

class EliminarReceta extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Eliminar()

    );
  }
}

class Eliminar extends StatefulWidget {


  @override
  _EliminarState createState() => _EliminarState();
}

class _EliminarState extends State<Eliminar> {
  final dbHelper = DatabaseHelper.instance;
  TextEditingController idDeleteController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: <Widget>[
            SizedBox(height: 90),
            Column(
              children: <Widget>[
                Image.asset('assets/fons_nom.PNG'),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 50,),
            TextField(
              controller: idDeleteController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Id receta',
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre autor',
              ),
            ),
            SizedBox(height: 60,),
            MaterialButton(
              height: 50,
              color: Colors.blue,
              onPressed: () {
                int id = int.parse(idDeleteController.text);
                _delete(id);
              },
              child: Text('Eliminar',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 10,),
            MaterialButton(
              height: 50,
              color: Colors.blue,
              onPressed: _query,
              child: Text('Query',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }

  void _delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final idDeleted = await dbHelper.delete(id!);
    print('deleted $idDeleted row(s): row $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('Estas són las recetas disponibles:');
    allRows.forEach(print);
  }

}

/*----------------------------MODIFICAR-RECETA--------------------------------*/

class ModificarReceta extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Modificar()

    );
  }
}

class Modificar extends StatefulWidget {


  @override
  _ModificarState createState() => _ModificarState();
}

class _ModificarState extends State<Modificar> {
  final dbHelper = DatabaseHelper.instance;
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController autorUpdateController = TextEditingController();
  TextEditingController recetaUpdateController = TextEditingController();
  TextEditingController ingredienteUpdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: <Widget>[
            SizedBox(height: 50),
            Column(
              children: <Widget>[
                Image.asset('assets/fons_nom.PNG'),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 20,),
            TextField(
              controller: idUpdateController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Id receta',
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: autorUpdateController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre autor',
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: recetaUpdateController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre receta',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: ingredienteUpdateController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Ingredientes',
              ),
            ),
            SizedBox(height: 40,),
            MaterialButton(
              height: 50,
              color: Colors.blue,
              onPressed: () {
                int id = int.parse(idUpdateController.text);
                String autor = autorUpdateController.text;
                String receta = recetaUpdateController.text;
                String ingrediente = ingredienteUpdateController.text;
                _update(id, autor, receta, ingrediente);
              },
              child: Text('Modificar',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 10,),
            MaterialButton(
              height: 50,
              color: Colors.blue,
              onPressed: _query,
              child: Text('Query',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }

  void _update(id, autor, receta, ingrediente) async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnAutor: autor,
      DatabaseHelper.columnReceta: receta,
      DatabaseHelper.columnIngrediente: ingrediente
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('Estas són las recetas disponibles:');
    allRows.forEach(print);
  }

}
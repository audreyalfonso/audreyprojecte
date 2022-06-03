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
          padding: EdgeInsets.symmetric(horizontal: 50),
          children: <Widget>[
            SizedBox(height: 70),
            Column(
              children: <Widget>[
                Image.asset('assets/fons_nom.PNG'),
                SizedBox(height: 50),
              ],
            ),
            MaterialButton(
              minWidth: 100,
              height: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IniciSessio()),
                );
              },
              color: Colors.blue,
              child: Text('Iniciar Sesión',style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 30,),
            MaterialButton(
              minWidth: 100,
              height: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registrarse()),
                );
              },
              color: Colors.grey,
              child: Text('Registrarse', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                Image.asset('assets/decoracioInici.PNG'),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*----------------------------INICI-SESSIÓ------------------------------------*/

class IniciSessio extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: inicisessioPage()

    );
  }
}

class inicisessioPage extends StatefulWidget {


  @override
  _inicisessioPageState createState() => _inicisessioPageState();
}

class _inicisessioPageState extends State<inicisessioPage> {


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
                Image.asset('assets/logo.png'),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre / Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 70,),
            MaterialButton(
              height: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrimeraPagina()),
                );
              },
              color: Colors.blue,
              child: Text('Iniciar Sessión',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

/*----------------------------REGISTRARSE-------------------------------------*/

class Registrarse extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Registre()

    );
  }
}

class Registre extends StatefulWidget {


  @override
  _RegistreState createState() => _RegistreState();
}

class _RegistreState extends State<Registre> {


  // TODO: Add text editing controllers (101)
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
                Image.asset('assets/logo.png'),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 60,),
            MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                height: 50,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrimeraPagina()),
                  );
                },
                child: Text('Registrarse',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

/*----------------------------PRIMERA-PÀGINA----------------------------------*/

class PrimeraPagina extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Primera()

    );
  }
}

class Primera extends StatefulWidget {


  @override
  _PrimeraState createState() => _PrimeraState();
}

class _PrimeraState extends State<Primera> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: <Widget>[
            SizedBox(height: 100),
            Column(
              children: <Widget>[
                Image.asset('assets/nom.PNG'),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 60,),
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
            SizedBox(height: 70),
            Column(
              children: <Widget>[
                Image.asset('assets/nomesNom.PNG'),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 30,),
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
    print('query all rows:');
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


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: <Widget>[
            SizedBox(height: 70),
            Column(
              children: <Widget>[
                Image.asset('assets/nomesNom.PNG'),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 30,),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre autor',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre receta',
              ),
            ),
            SizedBox(height: 50,),
            MaterialButton(
              height: 50,
              onPressed: () {

              },
              color: Colors.blue,
              child: Text('Eliminar',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 20),
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
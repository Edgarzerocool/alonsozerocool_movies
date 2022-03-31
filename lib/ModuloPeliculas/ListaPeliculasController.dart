import 'package:alonsozerocoolmovies/ModuloPeliculas/ListaPeliculasContract.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/ListaPeliculasPresenter.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/Modelos/nowplaying.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/Modelos/popular.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListaPeliculasController extends StatefulWidget {
  ListaPeliculasController({Key key, this.tipoLista}) : super(key: key);
  final String tipoLista;

  @override
  ListaPeliculasControllerState createState() =>
      ListaPeliculasControllerState(tipoLista);
  }

class ListaPeliculasControllerState extends State<ListaPeliculasController>
    implements ListaPeliculasView {
  ListaPeliculasPresenter presenter;
  String tipoLista;

  /*static popular listaPeliculasPopulares;
  nowplaying listaPeliculasMasVistas;*/

  ListaPeliculasControllerState(String tipoLista){
    this.presenter = ListaPeliculasPresenter(this);
    this.tipoLista = tipoLista;
  }

  @override
  void iniState(){
    super.initState();
    didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var listaPeliculasPopulares;
    var listaPeliculasMasVistas;
    if(tipoLista == "Populares"){
      Future.delayed(Duration.zero, () {
         listaPeliculasPopulares = presenter.getListaPeliculasPopulares();
      });
    }else{
      Future.delayed(Duration.zero, () {
         listaPeliculasMasVistas = presenter.getListaPeliculasMasVistas();
      });
    }
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Lista de peliculas "+ tipoLista),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lista de peliculas:',
            ),
            ListView.builder(
              itemCount: listaPeliculasMasVistas.totalResults,
                itemBuilder: (context, index){
                  return Text(listaPeliculasMasVistas.results[index].title);
                }
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  
}


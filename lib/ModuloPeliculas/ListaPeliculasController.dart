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
    with WidgetsBindingObserver
    implements ListaPeliculasView {
  ListaPeliculasPresenter presenter;
  String tipoLista;

  popular listaPeliculasPopulares;
  nowplaying listaPeliculasMasVistas;
  var lista;
  bool finalizoServicio = false;
  ScrollController scroll = ScrollController();

  ListaPeliculasControllerState(String tipoLista){
    this.presenter = ListaPeliculasPresenter(this);
    this.tipoLista = tipoLista;
  }

  @override
  void iniState(){
    WidgetsBinding.instance.addObserver(this);
    recuperarListaPeliculas();
    super.initState();
  }

  recuperarListaPeliculas() async {
    if(tipoLista == "Populares"){
      listaPeliculasPopulares = await presenter.getListaPeliculasPopulares();
      lista = listaPeliculasPopulares;
    }else{
      listaPeliculasMasVistas = await presenter.getListaPeliculasMasVistas();
      lista = listaPeliculasMasVistas;
    }
    if(lista != null){
      setState(() {
        finalizoServicio = true;
      });
    }
  }

  Widget loading(){
    return Center(
      child: Text("sin datos"),
    );
  }

  Widget vistaListaPeliculas(){
    return Container(
      child: ListView.builder(
        itemCount: lista.results.length,
        itemBuilder: (context, index) {
          return Text(lista.results[index].title);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(!finalizoServicio){
      recuperarListaPeliculas();
    }
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Lista de peliculas "+ tipoLista),
      ),
      body: finalizoServicio ? vistaListaPeliculas() : loading(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  
}


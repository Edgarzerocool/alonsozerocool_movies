import 'package:alonsozerocoolmovies/ModuloPeliculas/ListaPeliculasContract.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/ListaPeliculasController.dart';

class ListaPeliculasRouter implements ListaPeliculasWireFrame {

  ListaPeliculasControllerState view;

  ListaPeliculasRouter(ListaPeliculasControllerState view){
    this.view = view;
  }
}
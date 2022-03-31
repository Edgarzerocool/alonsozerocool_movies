import 'package:alonsozerocoolmovies/ModuloPeliculas/ListaPeliculasContract.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/ListaPeliculasController.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/ListaPeliculasInteractor.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/ListaPeliculasRouter.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/Modelos/nowplaying.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/Modelos/popular.dart';

class ListaPeliculasPresenter implements ListaPeliculasPresentation, ListaPeliculasInteractorOutput {
  ListaPeliculasControllerState view;
  ListaPeliculasInteractor interactor;
  ListaPeliculasRouter router;

  ListaPeliculasPresenter(ListaPeliculasControllerState view){
    this.view = view;
    this.interactor = new ListaPeliculasInteractor(this, view);
    this.router = new ListaPeliculasRouter(view);
  }

  Future<popular> getListaPeliculasPopulares() async {
    return await interactor.getListaPeliculasPopulares();
  }

  Future<nowplaying> getListaPeliculasMasVistas() async {
    return await interactor.getListaPeliculasMasVistas();
  }


}
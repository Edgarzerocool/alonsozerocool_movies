import 'dart:convert';
import 'package:alonsozerocoolmovies/ModuloPeliculas/ListaPeliculasContract.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/ListaPeliculasController.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/Modelos/popular.dart';
import 'package:alonsozerocoolmovies/ModuloPeliculas/Modelos/nowplaying.dart';
import 'package:http/http.dart' as http;

class ListaPeliculasInteractor implements ListaPeliculasUseCase {
  ListaPeliculasInteractorOutput output;
  ListaPeliculasControllerState view;

  ListaPeliculasInteractor(ListaPeliculasInteractorOutput output, ListaPeliculasControllerState view){
    this.output = output;
    this.view = view;
  }

  Future<popular> getListaPeliculasPopulares() async {
    final response = await http.get('https://api.themoviedb.org/3/movie/popular?api_key=<APIKEY>&language=es-MX&page=1');
    print(response.statusCode);
    if (response != null) {
      if (response.body != null && response.body.isNotEmpty) {
        if (response.statusCode == 200) {
          print(response.body);
          var respuestaPeliculasPopulares = popular.fromJson(jsonDecode(response.body));
          print(respuestaPeliculasPopulares);
          return respuestaPeliculasPopulares;
        }else if (response.statusCode == 401) {
          print("error");
          return null;
        }
      }
    }
  }

  Future<nowplaying> getListaPeliculasMasVistas() async {
    final response = await http.get('https://api.themoviedb.org/3/movie/now_playing?api_key=<APIKEY>&language=es-MX&page=1');
    print(response.statusCode);
    if (response != null) {
      if (response.body != null && response.body.isNotEmpty) {
        if (response.statusCode == 200) {
          print(response.body);
          var respuestaPeliculasMasVistas = nowplaying.fromJson(jsonDecode(response.body));
          print(respuestaPeliculasMasVistas);
          return respuestaPeliculasMasVistas;
        }else if (response.statusCode == 401) {
          print("error");
          return null;
        }
      }
    }
  }

}
import 'package:firebase_auth/firebase_auth.dart';

import '../../Views/Platform/PlatformData.dart';
import '../FbAdmin.dart';
import '../Perfil.dart';
import '../Room.dart';


class DataHolder{

  static final DataHolder _dataHolder = new DataHolder._internal();

  String COLLECTION_ROOMS_NAME="rooms";
  String COLLECTION_PERFILES_NAME="perfiles";

  String mensaje=" ";
  Perfil perfil= Perfil();
  Room selectedChatRoom = Room();
  Perfil selectedPerfil = Perfil();
  FBAdmin fbAdmin = FBAdmin();

  double SCREEN_WIDTH=0;
  double SCREEN_HEIGHT=0;

  late PlatformAdmin platformAdmin;

  DataHolder._internal() {
    //text.value = "Lorem ipsum";
    mensaje = "Lorem ipsum";
    platformAdmin=PlatformAdmin();
  }

  factory DataHolder(){
    return _dataHolder;
  }

  /**
   * @param: none
   * @return Funcion que espera la descarga del perfil y lo guardo en la clase DataHolder
   */
  Future<void> descargarMIPerfil() async{
    perfil=await fbAdmin.descargarPerfil(FirebaseAuth.instance.currentUser?.uid) as Perfil;
  }


  Future<void> descargarPerfilGenerico(String? idPerfil) async{
    await fbAdmin.descargarPerfil(idPerfil) as Perfil;
  }
  bool isPerfilDownloaded(){
    return perfil!=null;
  }
}
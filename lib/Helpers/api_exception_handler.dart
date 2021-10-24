import 'package:dio/dio.dart';
import 'package:instagramfinder/Helpers/custom_exceptions.dart';


class ApiHandler{




 static Future handle(Response httpResponse )async{
      
      switch (httpResponse.statusCode) {
      case 200:
      
        return httpResponse;
      case 400:
        throw BadRequestException("");
      case 401:
      case 403:
        throw UnauthorisedException("");
      case 500:
      // snackbarService.showCustomSnackBar(message: "Veri akışınız yavaşlandı",variant: SnackbarType.first);
        throw BadRequestException("");
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode: ${httpResponse.statusCode}');
    }
  }
}
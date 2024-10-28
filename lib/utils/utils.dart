import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

openUrl()async{
  //SHOW POPUP WITH ALL THE AVAILABLE PHONE NUMBERS TO CHOOSE FROM THEN CALL THE SELECTED ONE
  final Uri url= Uri.parse(sourceURL);
  if(await canLaunchUrl(url)){
    await launchUrl(url);
  }
}
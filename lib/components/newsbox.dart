import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:technews_app/utils/colors.dart';
import 'package:technews_app/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(String url) async{
  if(await canLaunch(url)){
    await launch(url);
  }
  else{
    throw 'Could not launch $url';
  }
}
class NewsBox extends StatelessWidget {
  final String imageurl,title,time,description,url;
  const NewsBox({Key? key,required this.imageurl,required this.title
  ,required this.time,required this.description,required this.url}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: (){
            // showMyBottomSheet(context,title,description,imageurl,url);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5,right: 5,top: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(imageUrl: imageurl,
                imageBuilder: (context,imageProvider)=>Container(
                  width:60.0,height: 60.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,fit:BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow,
                  ),

                ),
                  placeholder: (context,url)=>CircularProgressIndicator(color: AppColors.primary,),
                  errorWidget: (context,url,error)=>Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfId1JtxLoc7bKkkSfmxtlc9ti_2Hhhcpm_7cd5yWQZANmFi0pELuxzHUgf_bzo4NSAuM&usqp=CAU',width: 60.0,height: 60.0,),
                ),
                const SizedBox(width: 15.0,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: TextStyle(
                      // height: 40.0,
                        color: AppColors.white,
                        fontSize: 16.0
                    ),),
                    const SizedBox(height: 5.0,),
                    Text(time,style: TextStyle(
                      // height: 40.0,
                        color: AppColors.lightWhite,
                        fontSize: 12,
                    ),),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Read Full Article',
                          recognizer: TapGestureRecognizer()..onTap =(){
                            _launchURL(url);
                          },
                          style: TextStyle(
                            color: Colors.blue.shade500,
                          )
                        )
                      ]
                    )),
                  ],
                ))

              ],
            ),
          ),
        )
        // DividerWidget()
      ],
    );
  }
}

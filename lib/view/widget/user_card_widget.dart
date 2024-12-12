import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constats/color.dart';
import 'details_dialog.dart';

Widget userCardWidget(BuildContext context,firstName,lastName,image,city,contactNumber){
  return    Padding(
    padding: EdgeInsets.only(bottom:24.07.h),
    child: Card(
        key: ValueKey(firstName),
        color: ColorRes.white,
        // margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.84),
        ),
        elevation: 4,
        child:Padding(
          padding: const EdgeInsets.all(20.75),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.asset(
                  image,
                  width: 53.6.w, // Set width and height for the circular effect
                  height: 53.6.h,
                  fit: BoxFit.cover, // Ensures the image covers the entire circle
                ),
              ),
              Row(
                children: [
                  Text(firstName,style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                    color: ColorRes.black09,
                    fontSize: 27.67,
                    fontWeight: FontWeight.w600,
                  ),textAlign: TextAlign.start,),
                  SizedBox(width: 5.w,),
                  Text(lastName,style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                    color: ColorRes.black09,
                    fontSize: 27.67,
                    fontWeight: FontWeight.w600,
                  ),textAlign: TextAlign.start,),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/location.webp",
                    width:8.65.w, // Set width and height for the circular effect
                    height: 11.24.h,
                    fit: BoxFit.cover, // Ensures the image covers the entire circle
                  ),

                  SizedBox(width: 5.w,),
                  Text(city,style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                    color: ColorRes.lightBlueGrey42,
                    fontWeight: FontWeight.w500,
                    fontSize: 8.65,
                  ),textAlign: TextAlign.start,

                  ),
                ],
              ),
              SizedBox(height: 27.67.h,),
              const Divider(
                color: ColorRes.whiteF3,
                thickness: 1,
              ),
              SizedBox(height: 6.92.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/mobile.webp",
                            width:11.24.w, // Set width and height for the circular effect
                            height: 11.24.h,
                            fit: BoxFit.cover, // Ensures the image covers the entire circle
                          ),

                          SizedBox(width: 5.w,),
                          Text(contactNumber, style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                            fontSize: 10.38,
                            fontWeight: FontWeight.w600,
                          ),textAlign: TextAlign.start,),
                        ],
                      ),
                      SizedBox(height:4.32.h,),
                      Text("Available on phone", style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        color: ColorRes.lightGreyAF,
                        fontSize: 8.65,
                        fontWeight: FontWeight.w500,
                      ),textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      detailsDialog(
                        context,
                        {
                          'first_name':firstName,
                          'last_name':lastName,


                          'city':city,
                          'phone':contactNumber,
                          'image':image, // Image from assets
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 13.w,right: 13.w,top: 9.79.h,bottom: 9.79.h
                      ),
                      decoration: BoxDecoration(
                          color: ColorRes.black18,
                          borderRadius: BorderRadius.circular(6.92)
                      ),

                      child: Text('Fetch Details', style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        color:ColorRes.white,
                        fontSize: 12.11,
                        fontWeight: FontWeight.w500,
                      ),textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )


    ),
  );
}
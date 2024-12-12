import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constats/color.dart';

void detailsDialog(BuildContext context, Map<String, String> userData) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title Row with Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fetch Details',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                      color: ColorRes.black,
                      fontSize: 22.22,
                      fontWeight: FontWeight.w600,
                    ),textAlign: TextAlign.center,),

                  IconButton(
                    icon: const Icon(Icons.close,color: ColorRes.black,),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              ),

              Text(
                'Here are the details of the following employee.',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                  color: ColorRes.lightGrey71,
                  fontSize: 12.96,
                  fontWeight: FontWeight.w400,
                ),textAlign: TextAlign.start,),
              SizedBox(height: 14.h),
              Text(
                "Name: ${userData['first_name']!} ${userData['last_name']!}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                  color: ColorRes.black,
                  fontSize: 12.96,
                  fontWeight: FontWeight.w500,
                ),textAlign: TextAlign.start,),

              Text(
                "Location: ${userData['city']!}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                  color: ColorRes.black,
                  fontSize: 12.96,
                  fontWeight: FontWeight.w500,
                ),textAlign: TextAlign.start,),
              Text(
                "Contact Number: ${userData['phone']!}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                  color: ColorRes.black,
                  fontSize: 12.96,
                  fontWeight: FontWeight.w500,
                ),textAlign: TextAlign.start,),
              SizedBox(height: 9.26.h),
              Text(
                'Profile Image:',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                  color: ColorRes.black,
                  fontSize: 22.22,
                  fontWeight: FontWeight.w600,
                ),textAlign: TextAlign.center,),
              SizedBox(height: 14.81.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  userData['image']!, // Profile image from asset
                  height: 191.62.h,
                  width: 191.62.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 77.81.h),
            ],
          ),
        ),
      );
    },
  );
}
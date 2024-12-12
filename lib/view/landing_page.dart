import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled55/constats/color.dart';
import 'package:untitled55/view/widget/background_widget.dart';
import 'package:untitled55/view/widget/search_widget.dart';
import 'package:untitled55/view/widget/user_card_widget.dart';
import '../model/user_model.dart';
import '../providers/user_list_provider.dart';
import '../network/url_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  TextEditingController searchController = TextEditingController();

  // List of items in our dropdown menu
  var items = [
    'SEARCH',
    'WEBSITE',
    'LINKEDIN',
    'CONTACT',
  ];
  String selectedMenuItem = "search";
  String dropDownValue = 'SEARCH';

  // List that holds the filtered users
  List<UserModel> foundUsers = [];
  List<UserModel> allUsers = [];
  List<UserModel> results = [];
  bool search = false;

  @override
  void initState() {
    super.initState();
    ref.read(userListProvider.notifier).getData();
  }

  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      // If the search field is empty, display all users
      results = allUsers;
      foundUsers = [];
      search = false;
    } else {
      search = true;
      results = allUsers
          .where((user) => user.firstName!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final userData = ref.watch(userListProvider);

    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          backgroundWidget(context),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:
                      const BoxDecoration(color: ColorRes.white, boxShadow: [
                    BoxShadow(
                      color: ColorRes.black54, // Color with 40% opacity
                      offset: Offset(0, 1.41), // Offset of (x=10, y=10)
                      blurRadius: 5.43, // Blur radius of 30
                      spreadRadius: 0, // Spread radius of 0
                    ),
                  ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30.65.w,
                      ),
                      SizedBox(
                          width: 102.7,
                          height: 28.84.h,
                          child: Image.asset("assets/image/logo.webp")),
                      const Spacer(),
                      PopupMenuButton<String>(
                        offset: const Offset(10, 35),
                        // Moves the popup 50 pixels down (adjust as needed)
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color:ColorRes.white,
                        icon: SizedBox(
                            width: 14.w,
                            height: 10.h,
                            child: Image.asset(
                              "assets/image/menu_icon.webp",
                            )),
                        onSelected: (String value) {
                          setState(() {
                            selectedMenuItem =
                                value; // Update the selected menu item
                          });

                          switch (value) {
                            case 'SEARCH':
                              // Handle Search action
                              break;
                            case 'WEBSITE':
                              launchUrlWeb(
                                  'https://girmantech.com'); // Launch the website
                              break;
                            case 'LINKEDIN':
                              launchUrlWeb(
                                  'https://www.linkedin.com/company/girman-technologies'); // Launch LinkedIn
                              break;
                            case 'CONTACT':
                              launchEmail(
                                  'contact@girmantech.com'); // Open email client
                              break;
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'SEARCH',
                            child: Text(
                              'SEARCH',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedMenuItem == "search"
                                    ? ColorRes.lightBlue
                                    : ColorRes.black,
                                decoration: selectedMenuItem == "search"
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                                decorationColor: selectedMenuItem == "search"
                                    ? ColorRes.blue
                                    : ColorRes.black,
                              ),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'WEBSITE',
                            child: Text(
                              'WEBSITE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedMenuItem == "website"
                                    ? ColorRes.blue
                                    : ColorRes.black,
                                decoration: selectedMenuItem == "website"
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                                decorationColor: selectedMenuItem == "website"
                                    ? ColorRes.blue
                                    : ColorRes.black,
                              ),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'LINKEDIN',
                            child: Text(
                              'LINKEDIN',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedMenuItem == "linkedin"
                                    ? ColorRes.blue
                                    : ColorRes.black,
                                decoration: selectedMenuItem == "linkedin"
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                                decorationColor: selectedMenuItem == "linkedin"
                                    ? ColorRes.blue
                                    : ColorRes.black,
                              ),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'CONTACT',
                            child: Text(
                              'CONTACT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedMenuItem == "contact"
                                    ? ColorRes.blue
                                    : ColorRes.black,
                                decoration: selectedMenuItem == "contact"
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                                decorationColor: selectedMenuItem == "contact"
                                    ? ColorRes.blue
                                    : ColorRes.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.65.w,
                      ),
                    ],
                  ),
                ),
                search
                    ? SizedBox(
                        height: 10.h,
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 109.h,
                          ),
                          Center(
                            child: Container(
                                width: width,
                                height: 65.h,
                                margin:
                                    EdgeInsets.only(left: 35.w, right: 34.w),
                                child: Image.asset(
                                  "assets/image/search_page_logo.webp",
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ],
                      ),
                searchWidget(
                    search,
                    51,
                    12,
                    ColorRes.lightGreyD7,
                    "Search",
                    searchController,
                    const TextStyle(color: ColorRes.lightGrey71),
                    (value) => runFilter(searchController.text),
                    const Icon(
                      Icons.search,
                      color: ColorRes.lightGrey71,
                      size: 18,
                    ),
                    null),
                userData.when(data: (List<UserModel> data) {
                  setState(() {
                    allUsers = data;
                  });
                  return search
                      ? Expanded(
                          child: foundUsers.isNotEmpty
                              ? ListView.builder(
                                  padding: EdgeInsets.only(
                                      left: 50.w, right: 49.w, top: 15.h),
                                  itemCount: foundUsers.length,
                                  itemBuilder: (context, index) =>
                                      userCardWidget(
                                        context,
                                        foundUsers[index].firstName,
                                        foundUsers[index].lastName!,
                                        foundUsers[index].image!,
                                        foundUsers[index].city!,
                                        foundUsers[index].contactNumber!,
                                      ))
                              : Padding(
                                  padding:
                                      EdgeInsets.only(left: 51.w, right: 51.w),
                                  child: Image.asset(
                                    "assets/image/empty_list.webp",
                                    width: width,
                                    height: 248.36.h,
                                    //fit: BoxFit.contain,
                                  ),
                                ))
                      : const SizedBox();
                }, error: (Object error, StackTrace stackTrace) {
                  return const Expanded(
                    flex: 1,
                    child: Center(child: Text("No user's Data")),
                  );
                }, loading: () {
                  return Expanded(
                    flex: 1,
                    child: Center(
                        child: SizedBox(
                            width: 15.w,
                            height: 15.h,
                            child: const CircularProgressIndicator())),
                  );
                })
              ]),
        ],
      ),
    )));
  }
}

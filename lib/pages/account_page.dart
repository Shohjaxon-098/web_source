import 'package:web_source/utils/tools/file_importants.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final user = FirebaseAuth.instance.currentUser!;
  void signOut() {
    setState(() {
      FirebaseAuth.instance.signOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: w(context) * 0.9,
                height: h(context) * 0.08,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 24),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/Avatar.png"),
                        radius: 22,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Username Name',
                          style: TextStyle(
                            color: Color(0xFF374151),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        Text(
                          user.email!,
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset("assets/notification.svg"),
                          width: 40,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF9F9F9),
                            shape: OvalBorder(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 35, top: 8),
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: Color(0xFFF9F9F9),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          width: 15,
                          height: 15,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF24E4E),
                            shape: OvalBorder(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: w(context) * 0.9,
                height: h(context) * 0.08,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/account.svg",
                        height: 30,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        'Account setting',
                        style: TextStyle(
                          color: Color(0xFF374151),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        "assets/edit.svg",
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: w(context) * 0.9,
                height: h(context) * 0.3,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 27, left: 26, right: 24, bottom: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/language.svg",
                            height: 22,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            'Language',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff9CA3AF),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 27, left: 26, right: 24, bottom: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/feadback.svg",
                            height: 22,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            'Feedback',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff9CA3AF),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 27, left: 26, right: 24, bottom: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/rate.svg",
                            height: 22,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            'Rate us',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff9CA3AF),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 27, left: 26, right: 24, bottom: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/newversion.svg",
                            height: 22,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            'New Version',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff9CA3AF),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  signOut();
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffEB4646),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

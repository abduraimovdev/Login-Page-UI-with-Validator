import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool buttonDecoration = true;
  bool closeIconColor = false;
  bool closeIconColorTwo = false;
  bool passwordIcon = true;
  final regex = RegExp(r"([\w0-9]+[@]\w+\.\w+)");
  final regexPassword = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
  String? isEmail = null;
  String? isPassword = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(top: 40),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                ),
              ),
              // Button Login And Reg
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 55,
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (!buttonDecoration) {
                            buttonDecoration = true;
                            setState(() {});
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: buttonDecoration
                              ? BoxDecoration(
                                  color: const Color(0xFF262629),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.4),
                                      offset: const Offset(0, -0.5),
                                    ),
                                  ],
                                )
                              : const BoxDecoration(),
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: buttonDecoration
                                  ? Colors.white
                                  : const Color(0xFF575758),
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (buttonDecoration) {
                            buttonDecoration = false;
                            setState(() {});
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: buttonDecoration
                              ? const BoxDecoration()
                              : BoxDecoration(
                                  color: const Color(0xFF262629),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.4),
                                      offset: const Offset(0, -0.5),
                                    ),
                                  ],
                                ),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: buttonDecoration
                                  ? const Color(0xFF575758)
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email --------------------------------------------------------------------------------
                  const Text(
                    "Email Address",
                    style: TextStyle(
                      color: Color(0xFF575758),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: email,
                    autofocus: false,
                    style: const TextStyle(
                      color: Color(0xFF878787),
                      fontSize: 20,
                    ),
                    onChanged: (event) {
                      if(regex.hasMatch(event.characters.toString().trim())){
                        isEmail = null;
                      }else {
                        isEmail = "Invalid Email Address";
                      }
                      if (event.characters.toString().isNotEmpty) {
                        closeIconColor = true;
                      }
                      if (event.characters.toString().isEmpty) {
                        closeIconColor = false;
                      }
                      setState(() {});
                    },
                    cursorHeight: 30,
                    cursorColor: const Color(0xFF804CEF),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: isEmail == null ? const Color(0xFF262629) : Colors.red.withOpacity(0.2),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      hintText: "you@example.com",
                      hintStyle: const TextStyle(
                        color: Color(0xFF575758),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: isEmail != null ? const BorderSide(
                          color: Colors.red,
                          width: 0.4,
                        ) : BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.5),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      errorText: isEmail,
                      suffix: GestureDetector(
                        onTap: () {
                          debugPrint("Bosildi !");
                          email.clear();
                          setState(() {});
                        },
                        child: Icon(
                          Icons.close,
                          color: closeIconColor
                              ? Colors.white
                              : Colors.transparent,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Password ---------------------------------------------------------------------------------------------
                  const Text(
                    "Password",
                    style: TextStyle(
                      color: Color(0xFF575758),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: password,
                    autofocus: false,
                    cursorHeight: 30,
                    cursorColor: const Color(0xFF804CEF),
                    obscureText: passwordIcon,
                    style: const TextStyle(
                      color: Color(0xFF878787),
                      fontSize: 20,
                    ),
                    onChanged: (event) {
                      if(regexPassword.hasMatch(event.characters.toString().trim())){
                        isPassword = null;
                      }else {
                        isPassword = "Invalid Password";
                      }
                      if (event.characters.toString().isNotEmpty) {
                        closeIconColorTwo = true;
                      }
                      if (event.characters.toString().isEmpty) {
                        closeIconColorTwo = false;
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: isPassword == null ? const Color(0xFF262629) : Colors.red.withOpacity(0.2),
                      errorText: isPassword,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      hintText: "Your Password",
                      hintStyle: const TextStyle(
                        color: Color(0xFF575758),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: isPassword != null ? const BorderSide(
                          color: Colors.red,
                          width: 0.4,
                        ) : BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.5),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      suffixIcon: SizedBox(
                        width: 80,
                        height: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                debugPrint("Bosildi !");
                                password.clear();
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 0,
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: closeIconColorTwo
                                      ? Colors.grey
                                      : Colors.transparent,
                                  size: 20,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                passwordIcon = !passwordIcon;
                                setState(() {});
                              },
                              child: Icon(
                                passwordIcon
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xFF7339E5),
                    ),
                    onPressed: ()  {
                      showDialog(
                        barrierColor: const Color.fromRGBO(30, 30, 30, 0.75),
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Image(
                              image: AssetImage("assets/images/img_3.jpg"),
                              width: 65,
                              height: 64,
                            ),
                            content: const Text(
                              "Face Not Recognized",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: const Size(30, 50),
                                ),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 27),
                  const Center(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Color(0xFF804CEF),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Color(0xFF575758),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF262629),
                              minimumSize: Size(44, 44),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              "assets/images/apple.png",
                              width: 20,
                              height: 25,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF262629),
                              minimumSize: Size(44, 44),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              "assets/images/facebook.png",
                              width: 20,
                              height: 25,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF262629),
                              minimumSize: Size(44, 44),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                            onPressed: () {

                            },
                            child: Image.asset(
                              "assets/images/twitter.png",
                              width: 20,
                              height: 25,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

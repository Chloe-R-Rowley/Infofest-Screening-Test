import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stray_dog/drawer.dart';

class Login extends StatefulWidget {
  const Login(
      {required this.onItemTapped, required this.selectedIndex, super.key});
  final void Function(int) onItemTapped;
  final int selectedIndex;

  @override
  State<Login> createState() => _LoginState();
}

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment.centerLeft,
        height: 56,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        child: TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.black87,
          ),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black38,
              ),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      ),
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 56,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        child: TextField(
          controller: _passwordController,
          obscureText: true,
          style: const TextStyle(
            color: Colors.black87,
          ),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black38,
              ),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      ),
    ],
  );
}

Widget buildFgtPasswordBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: Container(
      padding: const EdgeInsets.only(right: 0),
      child: TextButton(
          onPressed: () {},
          child: const Text(
            "Forgot Password?",
            style: TextStyle(
              color: Color(0xff00A6A2),
              fontSize: 16,
            ),
          )),
    ),
  );
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _globalKey,
      appBar: AppBar(
        title: const Text("Stray Dogs"),
        backgroundColor: const Color(0x99fbc711),
      ),
      drawer: DrawerScreen(
          selectedIndex: widget.selectedIndex,
          onItemTapped: widget.onItemTapped),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x99fbc711),
                      // Color(0x66fbc711),
                      Color(0x1Afbc711),
                      Color(0x1Afbc711),
                      Color(0x1Afbc711),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign in ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        buildEmail(),
                        const SizedBox(
                          height: 16,
                        ),
                        buildPassword(),
                        const SizedBox(
                          height: 16,
                        ),
                        buildFgtPasswordBtn(),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff00A6A2),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("You dont have an account yet? "),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Color(0xff00A6A2),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}

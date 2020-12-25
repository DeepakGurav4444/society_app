import 'package:flutter/material.dart';
import 'package:society_app/blocs/login_signup_bloc.dart';
import 'package:society_app/loginregister/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = LoginSignUpBloc();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.navigate_before), onPressed: () {}
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => LoginScreen(),
            ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ) +
                    EdgeInsets.only(top: size.height * 0.15),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Text(
                  "Login to enter Society App",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.05,
                    horizontal: size.width * 0.05),
                child: StreamBuilder<String>(
                  stream: bloc.mobile,
                  builder: (context, snapshot) => TextField(
                    maxLength: 10,
                    controller: _mobileController,
                    keyboardType: TextInputType.number,
                    onChanged: bloc.mobileChanged,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                      errorText: snapshot.error,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Container(
                  width: size.width,
                  height: size.height * 0.065,
                  child: StreamBuilder<bool>(
                    stream: bloc.loginSubmitCheck,
                    builder: (context, snapshot) => RaisedButton(
                      color: Colors.greenAccent,
                      onPressed: snapshot.hasData
                          ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(
                                    mobileNumber: _mobileController.text,
                                  ),
                                ),
                              )
                          : null,
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: size.height * 0.25,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xffefd8bf),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: size.height * 0.25,
                          width: size.width * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                    vertical: size.height * 0.01),
                                child: Text(
                                  "Want to register\nyour society with\nSocietyApp?",
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.01),
                                child: Text(
                                  "Refer your society & earn Rs.2500\nOver 4000 people have earned",
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                    vertical: size.height * 0.01),
                                child: Text(
                                  "Register >",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * 0.25,
                          width: size.width * 0.4,
                          child:
                              Image.asset("assets/images/register_society.jpg"),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

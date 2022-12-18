import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shooping_app/auth/sigin_up.dart';
import 'package:shooping_app/core/presentation/resources/size_constants.dart';
import 'package:shooping_app/screen/product_detail_screen.dart';
import 'package:shooping_app/screen/products_overview_screen.dart';

import '../core/presentation/resources/ui_assets.dart';
import '../core/presentation/widget/forms/buttons.dart';
import '../core/presentation/widget/forms/textfields.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin:
              const EdgeInsets.symmetric(horizontal: SC.lW, vertical: SC.lH),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Container(
                  height: 70,
                  margin: const EdgeInsets.symmetric(
                      horizontal: SC.mW, vertical: SC.mH),
                  padding: const EdgeInsets.symmetric(
                      horizontal: SC.mW, vertical: SC.mH),
                  child: Image.asset(
                    UIAssets.getDummyImage('login.jpg'),
                  ),
                ),
              ),
              SBC.mH,
              Center(
                  child: Text(
                'Log in',
                style: Theme.of(context).textTheme.bodyText1,
              )),
              SBC.xLH,
              Text(
                'Your e-mail',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              PrimaryTextField(
                onSaved: (_) {},
                hintTxt: "john@gmail.com",
              ),
              SBC.mH,
              Text(
                'Password',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              PrimaryTextField(
                onSaved: (_) {},
                hintTxt: "Please enter your password",
                suffixIcon: const Icon(Icons.visibility_off),
              ),
              SBC.mH,
              Align(
                  alignment: Alignment.topRight,
                  child: PrimaryTextButton(
                      title: 'Forgot Password ?', onPressed: () {})),
              SBC.mH,
              Row(
                children: [
                  const Icon(Icons.check_box_outline_blank),
                  SBC.sW,
                  Text(
                    'Keep me logged in',
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
              SBC.xLH,
              PrimaryButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductsOverviewScreen()),
                    );
                  },
                  title: 'Log in'),
              SBC.xLH,
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Or Signin Using',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SBC.sH,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(UIAssets.getIcon('google_icon.svg')),
                        SBC.mW,
                        SvgPicture.asset(
                          UIAssets.getIcon('fb_icon.svg'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //todo add google fb icon
              SBC.xLH,
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'New User ? ',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    PrimaryTextButton(
                      title: 'Create Account',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

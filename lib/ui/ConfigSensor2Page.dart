import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:joya/bloc/bloc_provider.dart';
import 'package:joya/bloc/controller/RequestBloc.dart';
import 'package:joya/component/ButtonComponent.dart';
import 'package:joya/component/TextFieldComponent.dart';
import 'package:joya/enum/EnumerateCategoriesButton.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';
import 'package:joya/ui/ErrorPage.dart';

class ConfigSensor2 extends StatelessWidget {
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  ConfigSensor2(
      {required this.debugShowCheckedModeBanner, required this.isIOSPlatform});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RequestBloc>(context);
    if (this.isIOSPlatform) {
      return Scaffold(
        body: StreamBuilder<Map<String, dynamic>>(
            stream: bloc?.stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return ErrorPage(
                    errorMessage: 'Data is Null',
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    isIOSPlatform: isIOSPlatform);
              } else if (snapshot.hasData) {
                return Container(
                    color: MainColorPalettes.colorsThemeMultiple[5],
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 60, 40, 40), // TO DO
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonComponent(
                                text: MainTextPalettes.textFr[
                                "CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                                enumerateCategoriesButton:
                                EnumerateCategoriesButton
                                    .typeButtonIconOnly,
                                isIOSPlatform: isIOSPlatform,
                                methode: () =>
                                {Navigator.pushNamed(context, 'configSensor1')},
                                colorBorder:
                                MainColorPalettes.colorsThemeMultiple[5]!,
                                backgroundColorButton:
                                MainColorPalettes.colorsThemeMultiple[10]!,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 100,), // TODO
                        Center(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "\n${MainTextPalettes.textFr["CONFIG_PLANT"]}",
                                        style: TextStyle(
                                            fontFamily: "DMSans-Bold.ttf",
                                            fontSize: 40,
                                            color: MainColorPalettes.colorsThemeMultiple[10]
                                        ),
                                      ),
                                    ]
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(40, 55, 40, 5), // TODO
                            child: TextFieldComponent(
                              methode: "test",
                              text:
                              "${MainTextPalettes.textFr["NAME_PLANT"]}",
                              isValid: true,
                              isNotValidRenderText: 'test',
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(40, 5, 40, 5), // TODO
                            child: TextFieldComponent(
                              methode: "test",
                              text:
                              "${MainTextPalettes.textFr["LOCALISATION_PLANT"]}",
                              isValid: true,
                              isNotValidRenderText: 'test',
                            )),
                        ButtonComponent(
                          text: MainTextPalettes.textFr["VALIDER"],
                          enumerateCategoriesButton:
                          EnumerateCategoriesButton.typeButtonTextOnly,
                          isIOSPlatform: isIOSPlatform,
                          methode: () =>
                          {Navigator.pushNamed(context, 'newSensor')},
                          colorBorder:
                          MainColorPalettes.colorsThemeMultiple[5]!,
                          backgroundColorButton:
                          MainColorPalettes.colorsThemeMultiple[10]!,
                        ),
                        SizedBox(height: 15,), // TODO
                        Center(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${MainTextPalettes.textFr["PLUSINFO"]}",
                                        style: TextStyle(
                                            fontFamily: "DMSans-Regular",
                                            fontSize: 15,
                                            color: MainColorPalettes.colorsThemeMultiple[20]
                                        ),
                                      ),
                                      TextSpan(
                                        text: "\n${MainTextPalettes.textFr["CONDITIONURL"]}",
                                        style: TextStyle(
                                            fontFamily: "DMSans-Regular",
                                            fontSize: 15,
                                            color: MainColorPalettes.colorsThemeMultiple[10]
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {print("Condition");},
                                      ),
                                    ]
                                )
                            )
                        )
                      ],
                    ));
              } else {
                return ErrorPage(
                    errorMessage: 'Data is Bad',
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    isIOSPlatform: isIOSPlatform);
              }
            }),
      );
    } else {
      return Container();
    }
  }
}

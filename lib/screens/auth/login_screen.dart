import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:united_distributors_hr/services/global_methods.dart';
import '../../providers/auth_provider.dart';
import '../../resources/color_manager.dart';
import '../../resources/icon_manager.dart';
import '../../resources/route_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/values_manager.dart';
import '../../services/utils.dart';
import '../../widgets/loading_manager.dart';
import '../../widgets/screen_widget.dart';
import 'logo_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _codeTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obsecureText = true;

  bool _isLoading = false;

  void _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<AuthProvider>(context, listen: false).login(
          erpCode: _codeTextController.text,
          password: _passwordTextController.text,
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.homeRoute,
          ModalRoute.withName(Routes.loginRoute),
        );
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        GlobalMethods.errorDialog(subTitle: error.toString(), context: context);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _codeTextController.dispose();
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: ScreenWidget(
        child: LoadingManager(
          isLoading: _isLoading,
          child: ListView(
            children: [
              const LogoWidget(),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(AppSize.s18),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppPadding.p20,
                            right: AppPadding.p20,
                            top: AppPadding.p20,
                          ),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passwordFocusNode),
                            controller: _codeTextController,
                            keyboardType: TextInputType.number,
                            //! allows numbers only no special char. are allowed
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp("[0-9]"),
                              ),
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppString.emptyCode;
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                IconManager.user,
                                color: ColorManager.grey,
                              ),
                              labelText: AppString.erpCode,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppPadding.p20,
                            right: AppPadding.p20,
                            top: AppPadding.p20,
                          ),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            onEditingComplete: _submitForm,
                            controller: _passwordTextController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppString.emptyPassword;
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                IconManager.lock,
                                color: ColorManager.grey,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obsecureText = !_obsecureText;
                                  });
                                },
                                child: Icon(
                                  _obsecureText
                                      ? IconManager.visible
                                      : IconManager.visibiltyOff,
                                  color: ColorManager.grey,
                                ),
                              ),
                              labelText: AppString.password,
                            ),
                            obscureText: _obsecureText,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppPadding.p20,
                                right: AppPadding.p20,
                                top: AppPadding.p15,
                              ),
                              child: InkWell(
                                splashColor: ColorManager.grey,
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.forgetPasswordRoute);
                                },
                                child: Text(
                                  AppString.forgetPassword,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p20),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                primary: ColorManager.deepOrange,
                              ),
                              child: Text(
                                AppString.login,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: ColorManager.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

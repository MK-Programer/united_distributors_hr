import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../resources/color_manager.dart';
import '../../resources/icon_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/values_manager.dart';
import '../../services/utils.dart';
import '../../widgets/loading_manager.dart';
import '../../widgets/screen_widget.dart';
import 'logo_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _codeTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  void dispose() {
    super.dispose();
    _codeTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: ScreenWidget(
        child: LoadingManager(
          isLoading: _isLoading,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: AppMargin.m18,
                ),
                const BackButton(),
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
                              textInputAction: TextInputAction.done,
                              onEditingComplete: _submitForm,
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
                            padding: const EdgeInsets.all(AppPadding.p20),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  _submitForm();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: ColorManager.deepOrange,
                                ),
                                child: Text(
                                  AppString.submit,
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
      ),
    );
  }
}

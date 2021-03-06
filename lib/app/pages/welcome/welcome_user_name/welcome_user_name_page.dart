import 'package:be_better/app/pages/welcome/welcome_module.dart';
import 'package:be_better/app/pages/welcome/welcome_user_name/welcome_user_name_bloc.dart';
import 'package:be_better/app/shared/widgets/custom_form_field_widget.dart';
import 'package:flutter/material.dart';

class WelcomeUserNamePage extends StatefulWidget {
  @override
  _WelcomeUserNamePageState createState() => _WelcomeUserNamePageState();
}

class _WelcomeUserNamePageState extends State<WelcomeUserNamePage>
    with SingleTickerProviderStateMixin {
  final bloc = WelcomeModule.to.bloc<WelcomeUserNameBloc>();
  Tween<double> opacityTween = Tween<double>(begin: 0, end: 1.0);
  Animation<double> opacity1Animation;
  Animation<double> opacity2Animation;
  Animation<double> opacity3Animation;
  Animation<double> opacity4Animation;
  AnimationController _animationController;
  FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 10000),
    );
    opacity1Animation = opacityTween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.05, 0.3, curve: Curves.ease)));
    opacity2Animation = opacityTween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 0.65, curve: Curves.ease)));
    opacity3Animation = opacityTween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.75, 1, curve: Curves.ease)))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _focusNode.nextFocus();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 25,
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeTransition(
              opacity: opacity1Animation,
              child: Text(
                'Olá,',
                style: textStyle,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FadeTransition(
              child: Text(
                'Como devemos te chamar?',
                style: textStyle.copyWith(
                  fontSize: 24,
                ),
                textAlign: TextAlign.start,
                softWrap: true,
              ),
              opacity: opacity2Animation,
            ),
            FadeTransition(
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: CustomFormFieldWidget(
                  labelText: 'Nome',
                  onChanged: bloc.inName,
                  stream: bloc.outName,
                  focusNode: _focusNode,
                  onValidator: bloc.validateName,
                ),
              ),
              opacity: opacity3Animation,
            ),
          ],
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
          stream: bloc.outCanSubmit,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.data) {
              return FloatingActionButton(
                onPressed: snapshot.data ? _saveForm : null,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 6,
              );
            }
            return Container();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _saveForm() {
    print("Save form");
  }
}

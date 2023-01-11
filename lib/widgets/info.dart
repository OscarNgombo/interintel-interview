import 'package:flutter/material.dart';
import 'package:interintel_interview/widgets/design.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final _fncontroller = TextEditingController();
  final _srcontroller = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final String _text = '';

// on submit snackbar message
  final message = const SnackBar(
    content: Text("Your data is saved"),
    elevation: 12.0,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 3),
    margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
  );

  // screen transition on submit
  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Design(
        fName: _fncontroller.text,
        sName: _srcontroller.text,
        phone: _phoneController.hashCode,
        email: _emailController.text,
      ),
      transitionDuration: const Duration(milliseconds: 2000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutSine;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  // on submit method
  _submit() {
    if (_errorText == null) {
      // const xTime = Duration(seconds: 3);
      ScaffoldMessenger.of(context).showSnackBar(message);
      Navigator.of(context).push(createRoute());
    }
  }

  // text field validation
  String? get _emailErrorText {
    final text = _emailController.value.text;
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    if (text.isEmpty) {
      return null;
    }
    if (emailValid == false) {
      return 'Please enter correct email';
    }
    return null;
  }

  String? get _phoneErrorText {
    final text = _phoneController.value.text;
    if (text.isEmpty) {
      return null;
    }
    if (text.length < 10) {
      return 'Too shot for  a number';
    }
    if (text.length > 10) {
      return 'Too many digits';
    }
    return null;
  }

  String? get errorText {
    final firstName = _fncontroller.value.text;

    if (firstName.isEmpty) {
      return "Can't be empty";
    }
    return null;
  }

  String? get _errorText {
    final surname = _srcontroller.value.text;

    if (surname.isEmpty) {
      return "Can't be empty";
    }
    return null;
  }

  @override
  void dispose() {
    _fncontroller.dispose();
    _srcontroller.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(children: [
                      Flexible(
                        child: TextField(
                          onChanged: (text) => setState(() => _text),
                          controller: _srcontroller,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Surname',
                            errorText: _errorText,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextField(
                          onChanged: (text) => setState(() => _text),
                          controller: _fncontroller,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'First Name',
                            errorText: errorText,
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) => setState(() => _text),
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Phone Number',
                        errorText: _phoneErrorText,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) => setState(() => _text),
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Email',
                        errorText: _emailErrorText,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: (_srcontroller.value.text.isNotEmpty) &&
                        (_phoneController.value.text.isNotEmpty)
                    ? _submit
                    : null,
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}

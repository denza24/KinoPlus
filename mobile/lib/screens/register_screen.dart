import 'package:flutter/material.dart';
import 'package:mobile/utils/get_form_input_decoration.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  bool _isFirstPartCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registracija',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_isFirstPartCompleted)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Unesite vaše korisničko ime.';
                        }
                        return null;
                      },
                      decoration: getFormInputDecoration(
                          'Korisničko ime', Icons.account_circle),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Unesite vašu lozinku.';
                        }
                        return null;
                      },
                      decoration:
                          getFormInputDecoration('Lozinka', Icons.lock_outline),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Potvrdite vašu lozinku.';
                        }
                        if (value != _passwordController.text) {
                          return 'Lozinke se ne podudaraju.';
                        }
                        return null;
                      },
                      decoration: getFormInputDecoration(
                          'Potvrdi lozinku', Icons.lock_reset),
                    ),
                  ],
                ),
              if (_isFirstPartCompleted)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                        controller: _firstNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Unesite vaše ime.';
                          }
                          return null;
                        },
                        decoration: getFormInputDecoration(
                            'Ime', Icons.account_circle)),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _lastNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Unesite vaše prezime';
                        }
                        return null;
                      },
                      decoration: getFormInputDecoration(
                          'Prezime', Icons.account_circle),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                        controller: _phoneController,
                        decoration: getFormInputDecoration(
                            'Broj telefona', Icons.phone)),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Unesite vaš email.';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Unesite validan email.';
                        }
                        return null;
                      },
                      decoration: getFormInputDecoration('Email', Icons.email),
                    ),
                  ],
                ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: _isFirstPartCompleted
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end,
                children: [
                  if (_isFirstPartCompleted)
                    ElevatedButton.icon(
                      onPressed: () =>
                          setState(() => _isFirstPartCompleted = false),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Nazad'),
                    ),
                  _isFirstPartCompleted
                      ? ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE51937),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25)),
                          child: const Text(
                            'Završi',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() => _isFirstPartCompleted = true);
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Dalje'),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
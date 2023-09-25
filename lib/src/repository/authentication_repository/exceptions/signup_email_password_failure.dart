class SignupEmailPasswordFailure {
  final String message;

  const SignupEmailPasswordFailure(
      [this.message = 'An error occurred while signing up.']);

  factory SignupEmailPasswordFailure.code(String code) {
    switch (code) {
      case '':
        return const SignupEmailPasswordFailure('');

      case 'email-already-in-use':
        return const SignupEmailPasswordFailure('Email already in use');
      case 'invalid-email':
        return const SignupEmailPasswordFailure('Invalid email');
      case 'operation-not-allowed':
        return const SignupEmailPasswordFailure('Operation not allowed');
      case 'weak-password':
        return const SignupEmailPasswordFailure('Weak password');
      default:
        return const SignupEmailPasswordFailure();
    }
  }
}

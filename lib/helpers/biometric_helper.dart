import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> hasEnrolledBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();
    if (availableBiometrics.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> authenticate() async {
    final bool didAuthenticate = await _auth.authenticate(
      localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
      options: const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: true,
      ),
    );
    return didAuthenticate;
  }

  Future<bool> _cancelAuthentication() async {
    final bool cancelBiometric = await _auth.stopAuthentication();
    return cancelBiometric;
  }
}

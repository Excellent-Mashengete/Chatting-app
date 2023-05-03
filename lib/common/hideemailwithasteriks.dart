String maskEmail(String email){
  int atPosition = email.indexOf('@');
  int length = email.length;

  String maskedEmail = '';

  if (atPosition > 3) {
    maskedEmail += email.substring(0, 2);
    for (int i = 2; i < atPosition-3; i++) {
      maskedEmail += '*';
    }
  } else {
    maskedEmail += email.substring(0, atPosition);
  }

  maskedEmail += email.substring(atPosition, length);

  return maskedEmail;
}

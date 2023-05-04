String maskEmail(String email){
  int atPosition = email.indexOf('@');
  int length = email.length;

  String maskedEmail = '';

  if (atPosition > 1) {
    maskedEmail += email.substring(0, 1);
    for (int i = 1; i < atPosition; i++) {
      maskedEmail += '*';
    }
  } else {
    maskedEmail += email.substring(0, atPosition);
  }

  maskedEmail += email.substring(atPosition, length);

  return maskedEmail;
}

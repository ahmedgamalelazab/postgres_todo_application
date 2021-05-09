int checkErrorMessageWhenTokenUsed(String message) {
  if (message == "pleas verify ur account to use the service") {
    return 1;
  } else if (message == "INVALID TOKEN") {
    return 2;
  }
  return 0;
}

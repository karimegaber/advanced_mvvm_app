
/* Extension to check if the String is null it returns an empty String
    and if it is not null it returns the String.
    ( This Extension used to avoid null error when getting data from remote source (APIs) ).
    @karime.gaber
 */
import 'package:advanced_app/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

// Look at the above multi-line comment.
extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}


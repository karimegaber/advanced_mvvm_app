import 'package:advanced_app/app/constants.dart';
import 'package:advanced_app/app/extensions.dart';
import 'package:advanced_app/data/responses/responses.dart';
import 'package:advanced_app/domain/models/login_models.dart';

/*
  *-> Mappers are used to map some type to another type.
  *-> in this case I used mappers to assure that no value will be returned as null,
      so I transformed CustomerResponse (Nullable) to Customer (Not Nullable).
 */

extension CustomerResponseMapper on CustomerResponse? {
  // Transforms (CustomerResponse) which is nullable to (Customer) which in not null.
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numOfNotifications.orZero() ?? Constants.zero,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  // Transforms (ContactsResponse) which is nullable to (Contacts) which in not null.
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}

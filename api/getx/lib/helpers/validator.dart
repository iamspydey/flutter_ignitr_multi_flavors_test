import 'package:get/get.dart';

import 'str.dart';

/// A class that provides validation rules for form fields.
///
/// The `Validator` class contains methods to validate different types of
/// input fields such as required fields, email fields, etc. It stores
/// any validation errors in a map where the key is the field name and
/// the value is the error message.
///
///{@tool snippet}
/// Example usage:
///
/// ```dart
/// Validator('email', 'example@example.com')
///   .required()
///   .email()
///   .validate();
/// ```
///{@end-tool}
///
/// Methods:
/// - `required()`: Validates that the field is not empty.
/// - `email()`: Validates that the field contains a valid email address.
/// - `isEqual()`: Validates that the field is equal to a given value.
/// - `number()`: Validates that the field is a number.
/// - `min()`: Validates that the field has a minimum length.
/// - `max()`: Validates that the field has a maximum length.
/// - `between()`: Validates that the field has a length between two values.
/// - `specialCharacter()`: Validates that the field does not contain special characters.
/// - `validate()`: Returns the error message for the field if there is one.
///
class Validator {
  Map<String, String> errors = {};
  final String field;
  final String value;

  Validator(this.field, this.value);

  /// Rule: `required`
  Validator required() {
    if (GetUtils.isLengthLessOrEqual(value, 0)) {
      errors.assign(field, "${Str.of(field).ucFirst()} is required");
    }
    return this;
  }

  /// Rule: `email`
  Validator email() {
    if (!GetUtils.isEmail(value)) {
      errors.assign(field, "${Str.of(field).ucFirst()} needs to be an email!");
    }
    return this;
  }

  /// Rule: `isEqual`
  Validator isEqual(dynamic val, String fieldMatchWith) {
    if (value != val) {
      errors.assign(field,
          "${Str.of(fieldMatchWith).ucFirst()} and ${Str.of(field).ucFirst()} doesn't match!");
    }
    return this;
  }

  /// Rule: `number`
  Validator number() {
    if (!GetUtils.isNull(value)) {
      errors.assign(field, "${Str.of(field).ucFirst()} needs to be a number!");
    }
    return this;
  }

  /// Rule: `min`
  Validator min(int minLength) {
    if (value.length < minLength) {
      errors.assign(
          field, "${Str.of(field).ucFirst()} must be $minLength character!");
    }
    return this;
  }

  /// Rule: `max`
  Validator max(int maxLength) {
    if (GetUtils.isLengthGreaterThan(value, maxLength)) {
      errors.assign(field,
          "${Str.of(field).ucFirst()} must be less than or equal to $maxLength character!");
    }
    return this;
  }

  /// Rule: `between`
  Validator between(int minLength, int maxLength) {
    if (!GetUtils.isLengthBetween(value, minLength, maxLength)) {
      errors.assign(field,
          "${Str.of(field).ucFirst()} must be between $minLength and $maxLength character!");
    }
    return this;
  }

  /// Rule: `specialCharacter`
  Validator specialCharacter({String? allowed}) {
    if (value.contains(RegExp(r'[\s\-$&+,:;=?@#|<>\.^*()%!\\]'))) {
      errors.assign(field,
          "${Str.of(field).ucFirst()} not allow any special character except underscores (_)");
    }
    return this;
  }

  /// Returns the error message for the field if there is one.
  String? validate() {
    return errors[field];
  }
}

import 'package:test/test.dart';
import 'package:dart_gql_acsys/dart_gql_acsys.dart';

void main() {
  test("Test the `Status` type equality", () {
    expect(Status.SUCCESS, equals(Status.SUCCESS));
    expect(Status.SUCCESS, equals(Status.fromInt(0)));
    expect(Status.fromInt(0), equals(Status.fromInt(0)));

    expect(Status.SUCCESS, isNot(equals(Status.DPM_NO_SUCH_PROP)));
    expect(Status.SUCCESS, isNot(equals(Status.fromInt(1))));
    expect(Status.fromInt(0), isNot(equals(Status.fromInt(1))));
  });

  test("Test `Status` field access", () {
    expect(Status.SUCCESS.facility, equals(0));
    expect(Status.SUCCESS.error, equals(0));
    expect(Status.SUCCESS.success, equals(true));
    expect(Status.SUCCESS.warning, equals(false));
    expect(Status.SUCCESS.fatal, equals(false));

    expect(Status.DPM_PEND.facility, equals(17));
    expect(Status.DPM_PEND.error, equals(1));
    expect(Status.DPM_PEND.success, equals(true));
    expect(Status.DPM_PEND.warning, equals(true));
    expect(Status.DPM_PEND.fatal, equals(false));

    expect(Status.CAMACFE_NOQ.facility, equals(18));
    expect(Status.CAMACFE_NOQ.error, equals(-1));
    expect(Status.CAMACFE_NOQ.success, equals(false));
    expect(Status.CAMACFE_NOQ.warning, equals(false));
    expect(Status.CAMACFE_NOQ.fatal, equals(true));

    expect(Status.MOOC_NO_SUCH_OID.facility, equals(57));
    expect(Status.MOOC_NO_SUCH_OID.error, equals(-10));
    expect(Status.MOOC_NO_SUCH_OID.success, equals(false));
    expect(Status.MOOC_NO_SUCH_OID.warning, equals(false));
    expect(Status.MOOC_NO_SUCH_OID.fatal, equals(true));
  });
}

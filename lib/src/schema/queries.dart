const devicesRead = r"""
    query ReadDevices($devList: [String!]!) {
    acceleratorData(deviceList: $devList) {
        refId
        data {
            timestamp
            result {
                ... on StatusReply {
                    status
                }
                ... on Scalar {
                    scalarValue
                }
                ... on ScalarArray {
                    scalarArrayValue
                }
                ... on Raw {
                    rawValue
                }
                ... on Text {
                    textValue
                }
                ... on TextArray {
                    textArrayValue
                }
            }
        }
    }
""";

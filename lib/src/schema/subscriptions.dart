const devicesMonitor = r"""
  subscription StreamData($drfs: [String!]!) {
      acceleratorData(drfs: $drfs) {
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
  }
""";

const plotStart = r"""
  subscription StartPlot($drfList: [String!]!, $xMin: Float, $xMax: Float, $windowSize: Int, $updateDelay: Int, $nAcquisitions: Int, $triggerEvent: Int, $startTime: Float, $endTime: Float) {
    startPlot(drfList: $drfList, xMin: $xMin, xMax: $xMax, windowSize: $windowSize, updateDelay: $updateDelay, nAcquisitions: $nAcquisitions, triggerEvent: $triggerEvent, startTime: $startTime, endTime: $endTime) {
      plotId
      timestamp
      triggerTimestamp
      data {
        channelRate
        channelUnits
        channelStatus
        channelData {
          timestamp
          result {
            ... on Scalar {
              scalarValue
            }
            ... on ScalarArray {
              scalarArrayValue
            }
          }
        }
      }
    }
  }
""";

const deviceSet = r"""
  mutation SetDevice($device: String!, $value: DevValue!) 
    {
      setDevice(device: $device, value: $value) {
          status
      }
  }
""";

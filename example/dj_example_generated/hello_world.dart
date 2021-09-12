// Main entry point to this file!
void main() {
  print('Hello World!');
  if (1 == 2) {
    print('Its True! 1 equals 2 now!');
  } else if (2 == 1) {
    print('Its True! Apparently 2 equals 1 now!');
  } else {
    print('Its False!');
  }
}

class SampleClass {
  final bool isSample;

  SampleClass({
    this.isSample = true,
  });

  factory SampleClass.fromJson(Map<String, dynamic> json) {
    return SampleClass(
      isSample: json['isSample'] as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('isSample', isSample);
    return val;
  }
}


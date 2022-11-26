import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable(createToJson: true)
class Quote {
  @JsonKey(name: "quote")
  final String quote;

  Quote({
    required this.quote,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}

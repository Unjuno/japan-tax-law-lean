# Unit review — 航空機燃料税法 art.14(1) 第四号 (納付すべき税額)

Law `347AC0000000007`, revision `347AC0000000007_20250601_504AC0000000068`.
Source: `data/raw/347AC0000000007_20250601_504AC0000000068.law.json`, Article 14 / Paragraph 1 / Item 4.

Verbatim: 「第二号に掲げる航空機燃料税額から前号に掲げる航空機燃料税額を控除した金額に相当する航空機燃料税額（以下「納付すべき税額」という。）」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | Payable tax = second-item amount minus preceding-item amount, floored at zero; unit 円, domain Nat. |
| T | `transcription_audit.py` article-scoped needle + kernel boundary examples. |
| D | PASS — needle in scoped article; 0/100/40/99/100/101 boundaries agree. |
| C | The amounts of each item are caller-established; this unit only models the subtraction. |
| U | Filing/return procedures and the other items' computations are unhandled. |

## Model and proof

- Impl `JapanTaxLaw/AircraftFuelTaxPayable.lean`; spec `…Spec.lean` (`second - min second first`).
- Universal kernel theorem `agreePayable (second first : Money)`; 11 boundary examples.

Human legal review remains `LEGAL_REVIEW_PENDING`.

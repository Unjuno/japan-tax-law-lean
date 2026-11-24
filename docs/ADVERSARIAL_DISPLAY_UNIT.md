# Adversarial review — 施行規則 art. 22の4(2) 表示単位

Unit: `NORM|70d9948f3c285aa1bca4e2e5dc6a76fd82dede46f1b4739c742e85b5d838098c`
Verbatim: 「貸借対照表に係る事項の金額は、一円単位、千円単位又は百万円単位を
もつて表示するものとする。」

- **H**: the three units could be mis-scaled (千円 = 100, 百万円 = 10,000),
  or the statute's choice of unit could be silently treated as prescribed
  rather than caller-selected; or a rounding rule (四捨五入) could be invented.
- **T**: re-extract art. 22の4(2); parse 一円/千円/百万円 → [1,1000,1000000]
  (auditor D=PASS); inspect `unitDivisor`; check divisors 1/1000/1,000,000 and
  scaled examples; `#print axioms`.
- **D**: verbatim located; all three constants present in spec and impl. The
  chosen unit is a caller-established `DisplayUnit`; the model proves only the
  divisors. `scaledAmount` uses truncation, explicitly labelled a model choice
  — the statute's rounding rule is NOT asserted. All three theorems are
  axiom-free.
- **C**: a rounding-up interpretation is a competing reading; recorded, not
  silently adopted.
- **U**: which unit a filer selects and human legal review remain open.

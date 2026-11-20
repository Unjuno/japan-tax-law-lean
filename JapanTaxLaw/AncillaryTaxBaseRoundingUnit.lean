import JapanTaxLaw.TaxFinance

/-!
# AncillaryTaxBaseRoundingUnit — 国税通則法 art. 118(3) (附帯税の計算基礎)

Pinned source:
  law 337AC0000000066 (国税通則法), revision
  337AC0000000066_20261101_507AC0000000013, enforcement 2026-11-01,
  snapshot sha256 6f8b43e168652d228066cda3389a3bf6823900a9268e6bf97297cb6b25189dee.

Normative unit: NORM|9e261291735bf9c85ed10b49d93d05e9dedfe9dc41133fe3a6b94559edd0b301
Verbatim: 附帯税の額を計算する場合において、その計算の基礎となる税額に
一万円未満の端数があるとき、又はその税額の全額が一万円未満であるときは、
その端数金額又はその全額を切り捨てる。

This is a **new computable slice**: `TaxRounding.lean` models art. 118(1)
(千円未満, 課税標準, excluding 附帯税) and art. 119(1) (百円未満), and explicitly
records art. 118(2)/(3) as NOT MODELLED. This unit models art. 118(3) only.

Scope: the 10,000-yen truncation of the calculation base of 附帯税.
NOT modelled: the 附帯税 rate, the kinds of 附帯税, the determination of the
base tax amount, art. 118(1)/(2), art. 119(2)-(4), art. 120. Not an
article-level or law-level completion claim. Human legal review pending.

Independent original-text audit: docs/SOURCE_AUDIT_ANCILLARY_BASE_118_3.md
-/


namespace JapanTaxLaw.AncillaryTaxBaseRoundingUnit

open JapanTaxLaw.TaxFinance

/-- 一万円. Unit: yen (Money = Nat); domain: non-negative integers. -/
def roundingUnit : Money := 10000

/-- 附帯税の額の計算の基礎となる税額（一万円未満切り捨て）.
    全額が一万円未満なら零。 -/
def baseAmount (tax : Money) : Money :=
  tax / roundingUnit * roundingUnit

/-- 一円未満の端数がある場合の境界: 全額が単位未満なら零。 -/
theorem baseAmount_eq_zero_of_lt (tax : Money) (h : tax < roundingUnit) :
    baseAmount tax = 0 := by
  unfold baseAmount roundingUnit
  have h' : tax < 10000 := by simpa [roundingUnit] using h
  rw [Nat.div_eq_of_lt h']

end JapanTaxLaw.AncillaryTaxBaseRoundingUnit

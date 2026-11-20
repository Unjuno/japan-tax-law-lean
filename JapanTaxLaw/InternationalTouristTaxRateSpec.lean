import JapanTaxLaw.InternationalTouristTaxRate

/-!
# InternationalTouristTaxRateSpec — art.15 の独立形式仕様

This restates the statutory amount independently of the implementation
constant: the literal 3,000 is re-derived from the pinned original text
「三千円」 and written as a bare `Nat`, not by referencing `departureTaxRate`.

`agreeInternationalTouristTaxRate` is a decidable equality on this single
constant. It is NOT a universal claim and NOT a source-correspondence proof:
the spec-vs-original check is recorded separately in the evidence ledger.
-/

namespace JapanTaxLaw.InternationalTouristTaxRate

/-- 独立定式: 原文「三千円」を Nat で書き下した値。 -/
def specDepartureTaxRate : Nat := 3_000

example : specDepartureTaxRate = 3_000 := by decide

/-- 実装 ↔ 独立定式の一致（この定数 1 点のみ）。 -/
def agreeInternationalTouristTaxRate : Bool :=
  departureTaxRate == specDepartureTaxRate

example : agreeInternationalTouristTaxRate = true := by decide

end JapanTaxLaw.InternationalTouristTaxRate

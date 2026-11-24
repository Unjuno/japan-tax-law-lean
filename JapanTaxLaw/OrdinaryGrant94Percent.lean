import JapanTaxLaw.TaxFinance

/-!
# OrdinaryGrant94Percent — 地方交付税法 art. 6の2(2) 普通交付税 94%

Pinned source: law 325AC0000000211, revision
`325AC0000000211_20261102_508AC0000000062`, snapshot
`data/raw/325AC0000000211_20261102_508AC0000000062.law.json`.

Normative unit: `NORM|2485fde4475c83b98f617ad1f2d8f6543e766e59e6695c54c9cf94f7e1cc48c2`
Verbatim: 「毎年度分として交付すべき普通交付税の総額は、前条第二項の額の
百分の九十四に相当する額とする。」

This is a REFERENCE-kind norm: it refers to 前条第二項 for the base amount.
That base is caller-established (`Nat`, yen); this unit models only the 94%
derivation. Rounding of non-integral results is not specified in this sentence
and is a documented model choice (floor). The base computation in the previous
article is a separate unit.
-/
namespace JapanTaxLaw.OrdinaryGrant94Percent

open JapanTaxLaw.TaxFinance

/-- 百分の九十四 = 94/100 with a positivity-typed denominator. -/
def grantRate : TaxRate := ⟨94, 100, by decide⟩

/-- Ordinary grant total = 94% of the caller-established base. -/
def ordinaryGrantTotal (baseYen : Nat) : Nat :=
  grantRate.applyFloor baseYen

theorem rate_components : TaxRate.numDen grantRate = (94, 100) := by decide
theorem of_zero : ordinaryGrantTotal 0 = 0 := by decide
theorem of_100 : ordinaryGrantTotal 100 = 94 := by decide
theorem of_10_000 : ordinaryGrantTotal 10_000 = 9_400 := by decide

end JapanTaxLaw.OrdinaryGrant94Percent

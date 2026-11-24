import JapanTaxLaw.TaxFinance

/-!
# InterestRateFivePercent — 地方税法 art. 71の6 (利子割の税率 5%)

Pinned source: law 325AC0000000226, revision
`325AC0000000226_20261101_508AC0000000002`, snapshot
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.

Normative unit: `NORM|7e5f5d2a586ff79c2ee3e9c86d120d3180ba67a3d00fd8a4dba9ab376ba02b5a`
Verbatim: 「利子割の税率は、百分の五とする。」

Scope: the rate is represented as the fraction 5/100 with a positivity-typed
denominator (0 denominator is unrepresentable). `applyFloor` uses total Nat
division; the statute's rounding rule for non-integral results is NOT specified
in this unit and is caller-established. The tax base (利子割課税標準) is a
separate unit and is not modelled here.
-/
namespace JapanTaxLaw.InterestRateFivePercent

open JapanTaxLaw.TaxFinance

/-- 百分の五 = 5/100; denominator positivity is part of the type. -/
def interestRate : TaxRate := ⟨5, 100, by decide⟩

theorem rate_components : TaxRate.numDen interestRate = (5, 100) := by decide
theorem denominator_pos : 0 < interestRate.den := interestRate.den_pos

theorem zero_base : interestRate.applyFloor 0 = 0 := by decide
theorem exact_base : interestRate.applyFloor 1_000 = 50 := by decide
theorem small_base_floor : interestRate.applyFloor 1 = 0 := by decide

end JapanTaxLaw.InterestRateFivePercent

import JapanTaxLaw.InternationalTouristTaxUnit
import JapanTaxLaw.TaxGeneral

/-!
# InternationalTouristTaxUnitSpec — independent spec for 国際観光旅客税法 art. 15

The spec is deliberately written in a different form from the implementation:
the implementation multiplies the departure count by the rate, while the spec
expresses the tax as primitive-recursive repeated addition of ¥3,000. The
kernel proves their agreement for ALL departure counts (not a finite sample),
so the proof is not circular with the implementation.

Variable contract: `departures : Money` = 出国回数, unit 回, domain Nat.
Result unit: 円 (Money = Nat).
-/

namespace JapanTaxLaw.InternationalTouristTaxUnit

open JapanTaxLaw.TaxFinance

/-- Spec: 3,000円を出国回数だけ加算した額 (recursive formulation). -/
def specSum : Money → Money
  | 0 => 0
  | n + 1 => specSum n + 3_000

/-- Soundness/correspondence: implementation agrees with the independent spec
    for every departure count. Universal, kernel-checked; no `sorry`/`admit`. -/
theorem agree_international_tourist_tax (departures : Money) :
    taxForDepartures departures = specSum departures := by
  induction departures with
  | zero =>
      simp [taxForDepartures, specSum]
  | succ n ih =>
      unfold taxForDepartures at ih ⊢
      simp [ratePerDeparture] at ih
      simp [ratePerDeparture, specSum, Nat.succ_mul, ih]

/-- Boundary: no departure gives zero tax. -/
theorem specSum_zero : specSum 0 = 0 := rfl

/-- Boundary: one departure gives exactly ¥3,000. -/
example : specSum 1 = 3_000 := by decide

/-- Boundary: two departures give exactly ¥6,000. -/
example : specSum 2 = 6_000 := by decide

/-- Boundary: the tax is strictly positive for at least one departure. -/
theorem specSum_pos_of_pos (n : Money) (h : 0 < n) : 0 < specSum n := by
  cases n with
  | zero => contradiction
  | succ k => simp [specSum]

/-- Monotonicity: more departures never lower the tax. -/
theorem taxForDepartures_mono {a b : Money} (h : a ≤ b) :
    taxForDepartures a ≤ taxForDepartures b := by
  unfold taxForDepartures
  exact Nat.mul_le_mul_right 3_000 h

/-- Cross-law relation: the model's 国税通則法 art. 2(2) classifier returns true
    for `TaxKind.internationalTourismSpecialCollZei` (特別徴収に係る国際観光旅客税).
    The classifier is defined and source-pinned in `TaxGeneral.lean`; this
    theorem only evaluates it and does not re-derive the legal classification.
    This module models only the rate; 第十六条 / 第十七条 特別徴収 is NOT modelled. -/
theorem cross_law_source_collected :
    JapanTaxLaw.isSourceCollectedNationalTax
      JapanTaxLaw.TaxKind.internationalTourismSpecialCollZei = true := by
  decide

/-- Finite smoke check only; `agree_international_tourist_tax` is the proof. -/
def agreeInternationalTouristTax : Bool :=
  [0, 1, 2, 3, 10, 50].all fun n =>
    taxForDepartures n == specSum n

example : agreeInternationalTouristTax = true := by decide

end JapanTaxLaw.InternationalTouristTaxUnit

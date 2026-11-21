import JapanTaxLaw.CustomsTariffArt8PresumedDumpingCap

/-!
# CustomsTariffArt8PresumedDumpingCapSpec — independent spec for 関税定率法 第八条(9)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第八条(9) Item#1 不当廉売関税 — provisional duty at most the difference
         between 正常価格と推定される価格 and 不当廉売価格と推定される価格.
Normative unit: NORM|5cdae38077e32d914408ab1b404758a66e06527b3356598d85111dc8f185a9a5

The implementation uses saturating Nat subtraction (margin = normal - unfair)
and a ≤ cap. The independent spec uses an ADDITIVE formulation
`duty + unfair ≤ normal` under the dumping condition `unfair ≤ normal`, with an
explicit branch for the non-dumping case (`duty = 0`). Kernel proves full
agreement for all (prices, duty), axiom-free.

Only the cap relationship is modeled; the investigation method and the
正常価格 definition are separate norm units (NOT MODELED).

Not modelled: investigation method, 正常価格 definition, other articles, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt8PresumedDumpingCap

open JapanTaxLaw.TaxFinance

/-- Independent spec: additive form under the dumping condition; duty = 0 otherwise. -/
def specWithinCap (p : PresumedPrices) (duty : Money) : Prop :=
  if p.unfair ≤ p.normal then duty + p.unfair ≤ p.normal else duty = 0

/-- Implementation agrees with the independent spec, for all inputs. Axiom-free. -/
theorem agree_within_cap (p : PresumedPrices) (duty : Money) :
    withinCap p duty ↔ specWithinCap p duty := by
  unfold withinCap dumpingMargin specWithinCap
  by_cases h : p.unfair ≤ p.normal
  · simp [h, Nat.le_sub_iff_add_le h]
  · have hz : p.normal - p.unfair = 0 := Nat.sub_eq_zero_of_le (Nat.le_of_lt (Nat.lt_of_not_ge h))
    simp [h, hz]

/-- The dumping margin is zero when the unfair price is not below the normal price. -/
theorem margin_zero_when_no_dumping (p : PresumedPrices) (h : ¬ p.unfair < p.normal) :
    dumpingMargin p = 0 := by
  unfold dumpingMargin
  exact Nat.sub_eq_zero_of_le (Nat.le_of_not_gt h)

end JapanTaxLaw.CustomsTariffArt8PresumedDumpingCap

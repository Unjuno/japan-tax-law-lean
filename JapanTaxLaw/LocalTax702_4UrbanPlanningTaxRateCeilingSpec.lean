import JapanTaxLaw.LocalTax702_4UrbanPlanningTaxRateCeiling

/-
# LocalTax702_4UrbanPlanningTaxRateCeilingSpec — independent spec for 地方税法 Num 702_4(1)

Needle 「都市計画税の税率は、百分の〇・三を超えることができない。」.
The implementation uses `threshold < permille`; the independent spec states the same
strict bound as `Nat.succ 3 ≤ permille`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超え」 is STRICT: the threshold is excluded and one more qualifies.
-/
namespace JapanTaxLaw.LocalTax702_4UrbanPlanningTaxRateCeiling

open JapanTaxLaw.TaxFinance


/-- statutory rate basis 百分の〇・三 = 3 / 1000 (independent of impl). -/
def specRateDenominator : Nat := 1000
def specInScope (permille : Nat) : Prop := Nat.succ 3 ≤ permille

theorem agree_scope (permille : Nat) : inScope permille ↔ specInScope permille := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h
end JapanTaxLaw.LocalTax702_4UrbanPlanningTaxRateCeiling

import JapanTaxLaw.LocalTax28TwoAdjustmentParts

/- Independent spec for 「二以上の調整部分を有する宅地等で非調整部分を有しないもの」:
statutory literals only, no impl identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax28TwoAdjustmentParts

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax28TwoAdjustmentParts

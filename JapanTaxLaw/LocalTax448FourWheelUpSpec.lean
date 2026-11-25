import JapanTaxLaw.LocalTax448FourWheelUp

/- Independent spec for 「ハ　四輪以上のもの」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax448FourWheelUp

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 4

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax448FourWheelUp

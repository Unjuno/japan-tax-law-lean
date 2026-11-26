import JapanTaxLaw.LocalTax72_38_2DeferralCeiling6Years

/- Independent spec for 「ただし、その期間は、既に当該法人につき同項の規定により徴収を猶予した期間と合わせて六年を超えることができない。」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_38_2DeferralCeiling6Years

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≤ 6

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_38_2DeferralCeiling6Years

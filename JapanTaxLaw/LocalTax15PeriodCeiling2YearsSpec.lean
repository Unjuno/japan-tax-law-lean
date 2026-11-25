import JapanTaxLaw.LocalTax15PeriodCeiling2Years
/- Independent spec for 「ただし、その期間は、既にその者につき徴収の猶予をした期間と合わせて二年を超えることができない。」: statutory literal only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax15PeriodCeiling2Years
open JapanTaxLaw.TaxFinance
def specInScope (amount : Money) : Prop := amount <= 2
theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope ceiling
  rfl
end JapanTaxLaw.LocalTax15PeriodCeiling2Years

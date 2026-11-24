import JapanTaxLaw.LocalTax34Age16Plus
/- Independent spec for 「年齢十六歳以上の者」: 以上 is INCLUSIVE, so 16
qualifies. Statutory literals only, no impl identifier; universal rfl bridge;
boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34Age16Plus
open JapanTaxLaw.TaxFinance
def specInScope (amount : Money) : Prop := 16 ≤ amount
theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax34Age16Plus

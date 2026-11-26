import JapanTaxLaw.LocalTax51StandardRateCeiling2

/- Independent spec for 「ただし、標準税率を超える税率で課する場合においても、百分の二を超えることができない。」:
statutory literals only, no impl identifier. Universal axiom-free bridge; boundaries live in Tests.
The ceiling is INCLUSIVE: 「を超えることができない」 ⇒ amount ≤ 2. -/
namespace JapanTaxLaw.LocalTax51StandardRateCeiling2

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≤ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax51StandardRateCeiling2

import JapanTaxLaw.LocalTax72_54TwoPrefectures

/- Independent spec for 「二以上の道府県において事務所又は事業所を設けて事業を行う個人」:
statutory literals only, no impl identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_54TwoPrefectures

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_54TwoPrefectures

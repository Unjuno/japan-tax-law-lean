import JapanTaxLaw.LocalTax72_2_2ThreePrefectures

/- Independent spec for 「三以上の道府県において事務所又は事業所を設けて事業を行う固有法人で」:
statutory literals only, no impl identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_2_2ThreePrefectures

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 3

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_2_2ThreePrefectures

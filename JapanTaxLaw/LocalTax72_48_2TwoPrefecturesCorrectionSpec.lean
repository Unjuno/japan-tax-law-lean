import JapanTaxLaw.LocalTax72_48_2TwoPrefecturesCorrection

/- Independent spec for 「（二以上の道府県において事務所又は事業所を設けて事業を行う法人の課税標準額の総額の更正、決定等）」: statutory literals only, no implementation
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_48_2TwoPrefecturesCorrection

open JapanTaxLaw.TaxFinance

/-- Independently transcribed statutory condition (literals only). -/
def specInScope (amount : Nat) : Prop := 2 ≤ amount

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower threshold
  rfl

end JapanTaxLaw.LocalTax72_48_2TwoPrefecturesCorrection

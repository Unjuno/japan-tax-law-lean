import JapanTaxLaw.Customs123PeriodCeiling60Days
/- Independent spec for 「ただし、消去しないよう求める期間は、通じて六十日を超えることができない。」: statutory literal only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.Customs123PeriodCeiling60Days
open JapanTaxLaw.TaxFinance
def specInScope (amount : Money) : Prop := amount <= 60
theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope ceiling
  rfl
end JapanTaxLaw.Customs123PeriodCeiling60Days

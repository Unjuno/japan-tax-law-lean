import JapanTaxLaw.LocalTax53TwoPrefecturesNotice

/- Independent spec for 「二以上の道府県において事務所又は事業所を有する法人の主たる事務所又は事業所所在地の道府県知事は、当該法人から前項の規定による届出があつた場合には、その旨を関係道府県知事に通知しなければならない。」:
statutory literals only, no impl identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax53TwoPrefecturesNotice

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax53TwoPrefecturesNotice

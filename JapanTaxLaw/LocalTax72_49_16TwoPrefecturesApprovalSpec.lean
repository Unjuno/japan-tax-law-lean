import JapanTaxLaw.LocalTax72_49_16TwoPrefecturesApproval

/- Independent spec for 「前項の場合においては、その区分計算の方法について、事務所又は事業所所在地の道府県知事（二以上の道府県において事務所又は事業所を設けて事業を行う個人にあつては、主たる事務所又は事業所所在地の道府県知事）の承認を受けなければならない。」:
statutory literals only, no impl identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_49_16TwoPrefecturesApproval

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_49_16TwoPrefecturesApproval

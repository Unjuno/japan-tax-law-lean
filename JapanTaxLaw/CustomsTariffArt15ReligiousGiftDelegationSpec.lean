import JapanTaxLaw.CustomsTariffArt15ReligiousGiftDelegation

/-!
# CustomsTariffArt15ReligiousGiftDelegationSpec — independent spec 関税定率法 第十五条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十五条(1) — DELEGATION: religious-gift articles prescribed by 財務省令.
Normative unit: NORM|fa7a3092ac09ddfe08ed1fc2f6df6297910fd9d29f82ded988b0f644938c19fa

Verbatim source: 「儀式又は礼拝の用に直接供するため宗教団体に寄贈された物品で財務省令で定めるもの」

The implementation is the constant `prescriptionAuthority : Authority`. The
independent spec states it as a propositional predicate `SpecFinanceOrdinance`,
representationally distinct from the constant and equivalent when applied.
Axiom-free via rfl/cases/decide (no simp/propext).

Not modelled: ordinance content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt15ReligiousGiftDelegation

def SpecFinanceOrdinance (a : Authority) : Prop := a = Authority.financeMinistryOrdinance

theorem agree_prescription_authority : SpecFinanceOrdinance prescriptionAuthority := by
  rfl

theorem spec_not_cabinet : ¬ SpecFinanceOrdinance Authority.cabinetOrder := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt15ReligiousGiftDelegation

import JapanTaxLaw.CustomsTariffArt17ContainerDelegation

/-!
# CustomsTariffArt17ContainerDelegationSpec — independent spec 関税定率法 第十七条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十七条(1) — DELEGATION 「輸入貨物の容器で政令で定めるもの」: containers of imported goods prescribed by Cabinet Order.
Normative unit: NORM|eb942c04756a7ec5c979ef888fe65f217714c5600aa0b2fa2e3585c110e99644

The implementation is the constant `prescriptionAuthority : Authority`. The
independent spec states it as a propositional predicate `SpecCabinetOrder`,
representationally distinct from the constant and equivalent when applied.
Axiom-free via rfl/cases (no simp/propext).

Not modelled: Cabinet Order content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt17ContainerDelegation

def SpecCabinetOrder (a : Authority) : Prop := a = Authority.cabinetOrder

theorem agree_prescription_authority : SpecCabinetOrder prescriptionAuthority := by
  rfl

theorem spec_act_not_cabinet : ¬ SpecCabinetOrder Authority.act := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt17ContainerDelegation

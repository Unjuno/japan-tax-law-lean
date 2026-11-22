import JapanTaxLaw.CustomsTariffArt17ExportContainerDelegation

/-!
# CustomsTariffArt17ExportContainerDelegationSpec — independent spec 関税定率法 第十七条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十七条(1) — DELEGATION 「輸出貨物の容器として使用される貨物で政令で定めるもの」: goods used as export containers are prescribed by Cabinet Order.
Normative unit: NORM|733f9fe5fc4dde05006f326edbc48d871bf7c43510bcff1e2dc838d9270fa17b

The implementation is the constant `prescriptionAuthority : Authority`. The
independent spec states it as a propositional predicate `SpecCabinetOrder`,
representationally distinct from the constant and equivalent when applied.
Axiom-free via rfl/cases (no simp/propext).

Not modelled: Cabinet Order content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt17ExportContainerDelegation

def SpecCabinetOrder (a : Authority) : Prop := a = Authority.cabinetOrder

theorem agree_prescription_authority : SpecCabinetOrder prescriptionAuthority := by
  rfl

theorem spec_act_not_cabinet : ¬ SpecCabinetOrder Authority.act := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt17ExportContainerDelegation

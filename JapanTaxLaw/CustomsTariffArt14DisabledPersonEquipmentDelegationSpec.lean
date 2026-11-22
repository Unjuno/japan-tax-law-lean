import JapanTaxLaw.CustomsTariffArt14DisabledPersonEquipmentDelegation

/-!
# CustomsTariffArt14DisabledPersonEquipmentDelegationSpec — independent spec 関税定率法 第十四条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十四条(1) — DELEGATION 「身体障害者用に特に製作された器具その他これに類する物品で政令で定めるもの」: disabled-person equipment prescribed by Cabinet Order.
Normative unit: NORM|c8d2540f3dcbd0d71d4c31a4833f7616bb803940ef8c78479d752b2588172adc

The implementation is the constant `prescriptionAuthority : Authority`. The
independent spec states it as a propositional predicate `SpecCabinetOrder`,
representationally distinct from the constant and equivalent when applied.
Axiom-free via rfl/cases (no simp/propext).

Not modelled: Cabinet Order content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt14DisabledPersonEquipmentDelegation

def SpecCabinetOrder (a : Authority) : Prop := a = Authority.cabinetOrder

theorem agree_prescription_authority : SpecCabinetOrder prescriptionAuthority := by
  rfl

theorem spec_act_not_cabinet : ¬ SpecCabinetOrder Authority.act := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt14DisabledPersonEquipmentDelegation

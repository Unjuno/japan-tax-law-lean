import JapanTaxLaw.CustomsTariffArt14DisabledPersonEquipmentDelegationSpec

/-!
# CustomsTariffArt14DisabledPersonEquipmentDelegationTests — kernel-checked checks for 第十四条(1)

Verifies the DELEGATION 「身体障害者用に特に製作された器具その他これに類する物品で政令で定めるもの」: prescription by 政令.
-/

namespace JapanTaxLaw.CustomsTariffArt14DisabledPersonEquipmentDelegation

example : prescriptionAuthority = Authority.cabinetOrder := prescription_is_cabinet_order
example : GoodsClass.listed ≠ GoodsClass.other := listed_neq_other
example : SpecCabinetOrder prescriptionAuthority := agree_prescription_authority
example : ¬ SpecCabinetOrder Authority.act := spec_act_not_cabinet

end JapanTaxLaw.CustomsTariffArt14DisabledPersonEquipmentDelegation

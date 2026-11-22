import JapanTaxLaw.CustomsTariffArt17ContainerDelegationSpec

/-!
# CustomsTariffArt17ContainerDelegationTests — kernel-checked checks for 第十七条(1)

Verifies the DELEGATION 「輸入貨物の容器で政令で定めるもの」: prescription by 政令.
-/

namespace JapanTaxLaw.CustomsTariffArt17ContainerDelegation

example : prescriptionAuthority = Authority.cabinetOrder := prescription_is_cabinet_order
example : GoodsClass.listed ≠ GoodsClass.other := listed_neq_other
example : SpecCabinetOrder prescriptionAuthority := agree_prescription_authority
example : ¬ SpecCabinetOrder Authority.act := spec_act_not_cabinet

end JapanTaxLaw.CustomsTariffArt17ContainerDelegation

import JapanTaxLaw.CustomsTariffArt17ExportContainerDelegationSpec

/-!
# CustomsTariffArt17ExportContainerDelegationTests — kernel-checked checks for 第十七条(1)

Verifies the DELEGATION 「輸出貨物の容器として使用される貨物で政令で定めるもの」: prescription by 政令.
-/

namespace JapanTaxLaw.CustomsTariffArt17ExportContainerDelegation

example : prescriptionAuthority = Authority.cabinetOrder := prescription_is_cabinet_order
example : GoodsClass.listed ≠ GoodsClass.other := listed_neq_other
example : SpecCabinetOrder prescriptionAuthority := agree_prescription_authority
example : ¬ SpecCabinetOrder Authority.act := spec_act_not_cabinet

end JapanTaxLaw.CustomsTariffArt17ExportContainerDelegation

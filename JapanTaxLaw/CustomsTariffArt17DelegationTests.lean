import JapanTaxLaw.CustomsTariffArt17DelegationSpec

/-!
# CustomsTariffArt17DelegationTests — kernel-checked checks for 第十七条(1)

Verifies the DELEGATION 「加工される貨物又は加工材料となる貨物で政令で定めるもの」: prescription by 政令, and the
enumerated-item count extracted structurally (13 items).
-/

namespace JapanTaxLaw.CustomsTariffArt17Delegation

example : enumeratedItemCount = 13 := rfl
example : prescriptionAuthority = Authority.cabinetOrder := prescription_is_cabinet_order
example : GoodsClass.listed ≠ GoodsClass.other := listed_neq_other
example : SpecCabinetOrder prescriptionAuthority := agree_prescription_authority
example : ¬ SpecCabinetOrder Authority.act := spec_act_not_cabinet

end JapanTaxLaw.CustomsTariffArt17Delegation

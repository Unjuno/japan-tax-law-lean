import JapanTaxLaw.CustomsTariffArt14UnconditionalExemptionSpec

/-!
# CustomsTariffArt14UnconditionalExemptionTests — kernel-checked checks for 第十四条(1)

Verifies the DELEGATION 「次に掲げる貨物で輸入されるものについては、政令で定めるところにより、その関税を免除する。」: the exemption is prescribed by 政令,
and the enumerated-item count is extracted structurally (21 items).
-/

namespace JapanTaxLaw.CustomsTariffArt14UnconditionalExemption

example : enumeratedItemCount = 21 := rfl
example : exemptionAuthority = Authority.cabinetOrder := exemption_is_cabinet_order
example : Goods.listed ≠ Goods.other := listed_neq_other

-- Independent spec agreement (axiom-free).
example : SpecCabinetOrder exemptionAuthority := agree_exemption_authority
example : ¬ SpecCabinetOrder Authority.act := spec_act_not_cabinet

end JapanTaxLaw.CustomsTariffArt14UnconditionalExemption

import JapanTaxLaw.CustomsTariffArt15ReligiousGiftDelegationSpec

/-!
# CustomsTariffArt15ReligiousGiftDelegationTests — kernel-checked checks for 第十五条(1)

Verifies the DELEGATION 「儀式又は礼拝の用に直接供するため宗教団体に寄贈された物品で財務省令で定めるもの」: prescription by 財務省令, not 政令.
-/

namespace JapanTaxLaw.CustomsTariffArt15ReligiousGiftDelegation

example : prescriptionAuthority = Authority.financeMinistryOrdinance := prescription_is_finance_ordinance
example : prescriptionAuthority ≠ Authority.cabinetOrder := prescription_not_cabinet_order
example : GoodsClass.listed ≠ GoodsClass.other := listed_neq_other
example : SpecFinanceOrdinance prescriptionAuthority := agree_prescription_authority
example : ¬ SpecFinanceOrdinance Authority.cabinetOrder := spec_not_cabinet

end JapanTaxLaw.CustomsTariffArt15ReligiousGiftDelegation

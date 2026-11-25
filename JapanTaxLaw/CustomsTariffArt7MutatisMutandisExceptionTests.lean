import JapanTaxLaw.CustomsTariffArt7MutatisMutandisExceptionSpec

/-!
# CustomsTariffArt7MutatisMutandisExceptionTests — kernel-checked checks

Verifies EXCEPTION/READING/CONDITION 「第七項、第八項（第一号を除く。）及び第九項の規定は、前項の調査が開始された場合について準用する。」.
-/

namespace JapanTaxLaw.CustomsTariffArt7MutatisMutandisException

example : included Provision.paragraph7 = true := rfl
example : included Provision.paragraph9 = true := rfl
example : included Provision.paragraph8Item1 = false := item1_excepted
example : applies true Provision.paragraph7 = true := paragraph7_applies
example : applies true Provision.paragraph9 = true := paragraph9_applies
example : applies true Provision.paragraph8Other = true := paragraph8Other_applies
example (s : Bool) : applies s Provision.paragraph8Item1 = false := item1_never_applies s
example (p : Provision) : applies false p = false := no_investigation_no_apply p
example : applies true Provision.paragraph8Item1 = true ↔ SpecApplies true Provision.paragraph8Item1 := applies_spec true Provision.paragraph8Item1
example : applies true Provision.paragraph7 = true ↔ SpecApplies true Provision.paragraph7 := applies_spec true Provision.paragraph7

end JapanTaxLaw.CustomsTariffArt7MutatisMutandisException

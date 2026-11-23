import JapanTaxLaw.CustomsTariffSupplArt1StaggeredEnforcementExceptionSpec

/-!
# CustomsTariffSupplArt1StaggeredEnforcementExceptionTests — kernel-checked checks

Verifies EXCEPTION 「ただし、次の各号に掲げる改正規定は、当該各号に掲げる日から施行する。」: per-item listed dates, not the general Act date.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1StaggeredEnforcementException

example : effectiveBasis = EnforcementBasis.itemListedDate := basis_is_item_listed
example : perItem = true := is_per_item
example : effectiveBasis ≠ EnforcementBasis.actWideDate := not_act_wide
example : SpecStaggered effectiveBasis perItem := implementation_satisfies_spec

end JapanTaxLaw.CustomsTariffSupplArt1StaggeredEnforcementException

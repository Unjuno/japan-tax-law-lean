import JapanTaxLaw.CustomsTariffSupplArt1ExceptionDateSpec

/-!
# CustomsTariffSupplArt1ExceptionDateTests — kernel-checked checks

Verifies EXCEPTION 「ただし、次に掲げる規定は、平成四年一月一日から施行する。」: date override for listed provisions, ordering.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1ExceptionDate

example : applicableDate ProvisionKind.listed = exceptionDate := listed_applicable
example : applicableDate ProvisionKind.other = generalDate := other_applicable
example : leDate generalDate exceptionDate := exception_after_general
example : ¬ leDate exceptionDate generalDate := general_not_after_exception
example : inForceOn ProvisionKind.listed exceptionDate := listed_in_force_on_exception
example : SpecApplicableDate ProvisionKind.listed exceptionDate := spec_listed
example : SpecApplicableDate ProvisionKind.other generalDate := spec_other
example : SpecApplicableDate ProvisionKind.listed (applicableDate ProvisionKind.listed) := impl_listed_matches_spec
example : SpecApplicableDate ProvisionKind.other (applicableDate ProvisionKind.other) := impl_other_matches_spec

end JapanTaxLaw.CustomsTariffSupplArt1ExceptionDate

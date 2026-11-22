import JapanTaxLaw.CustomsTariffArt4ProductionServiceDelegationSpec

/-!
# CustomsTariffArt4ProductionServiceDelegationTests — kernel-checked checks for 関税定率法 第四条(1)

Verifies the delegation structure: the two listed production services (技術,
design/other-production) are 政令-designated and delegated; out-of-scope is not.
-/

namespace JapanTaxLaw.CustomsTariffArt4ProductionServiceDelegation

-- The two listed production services are delegated (impl and spec).
example : inDelegatedClass ServiceClass.technical := technical_delegated
example : inDelegatedClass ServiceClass.otherProduction := other_production_delegated
example : ¬ inDelegatedClass ServiceClass.outOfScope := out_of_scope_not_delegated

-- The independent spec agrees.
example : SpecDelegated ServiceClass.technical := technical_in_spec
example : SpecDelegated ServiceClass.otherProduction := other_production_in_spec
example : ¬ SpecDelegated ServiceClass.outOfScope := out_of_scope_not_in_spec

-- Universal agreement with the independent propositional spec.
example (s : ServiceClass) : inDelegatedClass s ↔ SpecDelegated s := agree_delegated s

end JapanTaxLaw.CustomsTariffArt4ProductionServiceDelegation

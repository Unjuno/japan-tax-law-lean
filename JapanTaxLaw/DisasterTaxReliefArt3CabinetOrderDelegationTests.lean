import JapanTaxLaw.DisasterTaxReliefArt3CabinetOrderDelegationSpec

/-!
# DisasterTaxReliefArt3CabinetOrderDelegationTests — kernel-checked checks

Verifies DELEGATION 「前項に定めるもののほか、第一項から第六項までの規定の適用に関し必要な事項は、政令で定める。」: Cabinet Order, paragraphs 1..6,
supplementing the preceding paragraph.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt3CabinetOrderDelegation

example : prescriptionAuthority = Authority.cabinetOrder := authority_is_cabinet_order
example : prescriptionAuthority ≠ Authority.act := authority_not_act
example : prescriptionAuthority ≠ Authority.ministerialOrdinance := authority_not_ministerial
example : sourceParagraphLo = 1 ∧ sourceParagraphHi = 6 := source_range
example : SpecDelegation prescriptionAuthority sourceParagraphLo sourceParagraphHi
           supplementsPrevParagraph := implementation_satisfies_spec

end JapanTaxLaw.DisasterTaxReliefArt3CabinetOrderDelegation

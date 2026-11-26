import JapanTaxLaw.CustomsTerritoryCountryInclusion

/-
# CustomsTerritoryCountryInclusionSpec — independent spec for 経済連携協定緊急措置政令 第二条

Declared statutory scope:
  Law id: 414CO0000000116, revision 414CO0000000116_20181230_429CO0000000006
  Article: 第二条 第一項 第一号 — only the inclusion of customs territories in 「国」.

The implementation uses a structural match on the first Nat constructor.
This spec transcribes the same inclusion independently with a propositional
equality test (`if c = 0 then 1 else c`): a different operator, with no
implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by `cases` + `rfl` only, so no axiom is introduced.

Not modelled: investigation procedure, the agreement, other articles, and
human legal determination.
-/

namespace JapanTaxLaw.CustomsTerritoryCountryInclusion

/-- Independent transcription: the customs territory is read as a country. -/
def specAsCountry (c : Nat) : Nat :=
  if c = 0 then 1 else c

/-- Universal, axiom-free kernel correspondence for every entity code. -/
theorem agree_as_country (c : Nat) :
    asCountry c = specAsCountry c := by
  cases c <;> rfl

end JapanTaxLaw.CustomsTerritoryCountryInclusion

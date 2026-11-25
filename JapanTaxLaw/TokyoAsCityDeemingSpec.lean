import JapanTaxLaw.TokyoAsCityDeeming

/-
# TokyoAsCityDeemingSpec — independent spec for 特別とん譲与税法 第六条

Declared statutory scope (Directive §1.5):
  Law id: 332AC0000000077 (特別とん譲与税法)
  Revision: 332AC0000000077_20010106_411AC0000000160
  Article: 第六条 (art. 6), 第一項 第二文 — only the deeming 「都を市とみなして」.
  No other article, paragraph or law is modelled here.

The implementation writes the fiction as a structural match on constructors
(`0 => 1 | succ n => succ n`). This spec transcribes the same sentence
independently as a propositional equality test (`if c = 0 then 1 else c`):
different operators, no implementation definition inside any `spec*` def.
The universal `agree_as_city_code` theorem is the only bridge. Its proof uses
`cases` + `rfl` only, so it depends on no axiom (in particular no
Classical.choice), and it holds for every Nat, not merely a finite sample.

Not modelled: the triggering condition (この場合), grant computation, remaining
provisions, other articles, and human legal determination.
-/

namespace JapanTaxLaw.TokyoAsCityDeeming

/-- Independent fiction: 都 is read as 市; every other code is preserved. -/
def specAsCityCode (c : Nat) : Nat :=
  if c = 0 then 1 else c

/-- Universal, axiom-free kernel correspondence between impl and spec. -/
theorem agree_as_city_code (c : Nat) :
    asCityCode c = specAsCityCode c := by
  cases c <;> rfl

end JapanTaxLaw.TokyoAsCityDeeming

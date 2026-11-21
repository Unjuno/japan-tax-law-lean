import JapanTaxLaw.CustomsTariffArt3TaxBase

/-!
# CustomsTariffArt3TaxBaseSpec — independent spec for 関税定率法 第三条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第三条(1) 課税標準及び税率 — 課税標準 ∈ {価格, 数量}
Normative unit: NORM|88116e54e6374f3a288fd1aa1e79fc8167d6e733288dae64920deaaa35ab05ba

The implementation uses a boolean classifier `isAdmissible` (b == price || b == quantity).
The independent spec expresses admissibility as a PROPOSITIONAL disjunction
`b = price ∨ b = quantity` — a distinct formulation. Kernel proves equivalence
for all b, axiom-free.

This is a structural EFFECT (a two-alternative tax base), not an amount formula:
no arithmetic/unit/dimension applies. The 別表 rate is NOT MODELLED.

Not modelled: the 別表 rate table, other paragraphs/articles, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt3TaxBase

open JapanTaxLaw.CustomsTariffArt3TaxBase.TaxBase

/-- Independent spec: admissibility as a propositional disjunction. -/
def SpecAdmissible (b : TaxBase) : Prop := b = price ∨ b = quantity

/-- Boolean classifier agrees with the propositional spec, for all b. Axiom-free. -/
theorem agree_admissible (b : TaxBase) :
    (isAdmissible b = true) ↔ SpecAdmissible b := by
  cases b <;> simp [isAdmissible, SpecAdmissible]

/-- Exactly two inhabitants: the enumerated list equals the spec set. Axiom-free. -/
theorem enumerated_matches_spec (b : TaxBase) :
    b ∈ admissibleBases ↔ SpecAdmissible b := by
  cases b <;> simp [admissibleBases, SpecAdmissible]

end JapanTaxLaw.CustomsTariffArt3TaxBase

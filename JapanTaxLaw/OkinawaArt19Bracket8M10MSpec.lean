import JapanTaxLaw.OkinawaArt19Bracket8M10M

/-
# OkinawaArt19Bracket8M10MSpec — independent spec for 沖縄特例政令 art.19(1)(3)（八百万円以上千万円未満）

Pinned source:
  Law id: 347CO0000000151
  Revision: 347CO0000000151_20251231_507CO0000000426
  Snapshot: data/raw/347CO0000000151_20251231_507CO0000000426.law.json
  Statutory article: 第十九条(1)(3), 別表 cell
  原文逐語: 「八百万円以上千万円未満の金額」
  Normative unit: NORM|efdfff78b60a7d77191816bd395051878b7e92f4d65e99da141fd9208a1cc6f8

The implementation formulates the bracket with the operators `<=` and `<`:
`lowerBound <= amount && amount < upperBound`. This module is an INDEPENDENT
formulation: it carries its own statutory constants and expresses both bounds
as negations, `¬ amount < specLowerBound && ¬ specUpperBound <= amount` —
different operators from the implementation. It reuses NO implementation
definition inside its own `spec*` defs; the universal `agree_bracket` theorem
is the only bridge, and the kernel checks it for every Nat amount.

Not modelled: the other cells/rows of art.19(1)(3), the amount/rate that this
bracket selects, other items, paragraphs and enforcement rules.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket8M10M

/-- Spec-local lower bound: 八百万円 = ¥8,000,000. Independent of impl. -/
def specLowerBound : Nat := 8_000_000

/-- Spec-local upper bound: 千万円 = ¥10,000,000. Independent of impl. -/
def specUpperBound : Nat := 10_000_000

/-- Independent bracket: 以上/未満 via negation of the opposite strict orders. -/
def specInBracket (amount : Nat) : Bool :=
  decide (¬ amount < specLowerBound && ¬ specUpperBound <= amount)

/-- Universal, kernel-checked correspondence for every natural amount. -/
theorem agree_bracket (amount : Nat) :
    inBracket amount = specInBracket amount := by
  unfold inBracket specInBracket lowerBound upperBound specLowerBound specUpperBound
  by_cases hlo : 8_000_000 <= amount
  · by_cases hhi : amount < 10_000_000
    · have h1 : ¬ amount < 8_000_000 := by omega
      have h2 : ¬ 10_000_000 <= amount := by omega
      simp [hlo, hhi, h1, h2]
    · have h1 : ¬ amount < 8_000_000 := by omega
      have h2 : 10_000_000 <= amount := by omega
      simp [hlo, hhi, h1, h2]
  · have h1 : amount < 8_000_000 := by omega
    simp [hlo, h1]

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specBracketGrid : Bool :=
  let lo := specLowerBound
  let hi := specUpperBound
  [0, 1, lo - 1, lo, lo + 1, hi - 1, hi, hi + 1].all fun amount =>
    specInBracket amount == decide (lo <= amount && amount < hi)

example : specBracketGrid = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket8M10M

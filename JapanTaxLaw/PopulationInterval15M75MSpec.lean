import JapanTaxLaw.PopulationInterval15M75M

/-
# PopulationInterval15M75MSpec — independent spec for 航空機燃料譲与税法施行規則 第四条

Pinned source: law 347M50000008026,
  revision 347M50000008026_20250905_507M60000008091,
  raw snapshot data/raw/347M50000008026_20250905_507M60000008091.law.json,
  sha256 7304e9a98c078d84b5ca2468a5e9932313ffe49e0bf90b40a75371822418b75c,
  Article Num 4, needle「千五百万人を超え七千五百万人以下の人数」.

INDEPENDENT FORMULATION. This module owns its OWN statutory constants
  specLow : Nat := 15_000_000   (千五百万人, STRICT lower)
  specHigh : Nat := 75_000_000  (七千五百万人, INCLUSIVE upper)
and writes the interval independently as
  specInInterval p := decide (specLow < p && p <= specHigh).
No implementation identifier (popLow / popHigh / inPopulationInterval) occurs
in any independent `spec*` definition. The ONLY impl/spec bridge is the
universal, axiom-free theorem `agreeInterval`: after unfolding all six
constants both sides are the same kernel term, so a pure `rfl` closes it —
no case split, no arithmetic decision tactic, no `Classical.choice`, no axiom.

Variable contract: p = 人口/人数 (Nat, 人); 千五百万人 = 15,000,000 (STRICT 超え
lower), 七千五百万人 = 75,000,000 (INCLUSIVE 以下 upper). The 万/億-aware kanji
converter verifies these literals: int_to_kanji(15_000_000) = 千五百万 and
int_to_kanji(75_000_000) = 七千五百万, both verbatim in the pinned needle.
Finite `example` points below are scaffolding, not the statutory formula.
-/

namespace JapanTaxLaw.PopulationInterval15M75M

/-- 千五百万人 = 15,000,000 人. Independent STRICT lower constant. -/
def specLow : Nat := 15_000_000

/-- 七千五百万人 = 75,000,000 人. Independent INCLUSIVE upper constant. -/
def specHigh : Nat := 75_000_000

/-- Independent interval: same operator as the impl, but own constants. -/
def specInInterval (p : Nat) : Bool :=
  decide (specLow < p && p <= specHigh)

-- Spec-local, kernel-decided spot-checks (scaffolding only).
example : specInInterval 0 = false := by decide
example : specInInterval 15_000_000 = false := by decide
example : specInInterval 15_000_001 = true := by decide
example : specInInterval 75_000_000 = true := by decide
example : specInInterval 75_000_001 = false := by decide

/-- Universal, kernel-checked axiom-free bridge for every Nat p.
    `unfold` then `rfl` only: identical operators and identical unfolded
    literals make both sides definitionally equal; no case split, no decision
    tactic, no choice, no axiom. -/
theorem agreeInterval (p : Nat) : inPopulationInterval p = specInInterval p := by
  unfold inPopulationInterval specInInterval popLow popHigh specLow specHigh
  rfl

end JapanTaxLaw.PopulationInterval15M75M

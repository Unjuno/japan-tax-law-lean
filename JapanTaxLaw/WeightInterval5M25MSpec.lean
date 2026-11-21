import JapanTaxLaw.WeightInterval5M25M

/-
# WeightInterval5M25MSpec — independent spec for 航空機燃料譲与税法施行規則 第四条（重量）

Pinned source: law 347M50000008026,
  revision 347M50000008026_20250905_507M60000008091,
  raw snapshot data/raw/347M50000008026_20250905_507M60000008091.law.json,
  sha256 7304e9a98c078d84b5ca2468a5e9932313ffe49e0bf90b40a75371822418b75c,
  Article Num 4, needle「五百万トンを超え二千五百万トン以下の重量」
  (Paragraph[Num=2] table cell, distinct from the population interval cell in
  Paragraph[Num=3]).

INDEPENDENT FORMULATION. This module owns its OWN statutory constants
  specLow : Nat := 5_000_000   (五百万トン, STRICT lower)
  specHigh : Nat := 25_000_000  (二千五百万トン, INCLUSIVE upper)
and writes the interval independently as
  specInInterval w := decide (specLow < w && w <= specHigh).
No implementation identifier (weightLow / weightHigh / inWeightInterval) occurs
in any independent `spec*` definition. The ONLY impl/spec bridge is the
universal, axiom-free theorem `agreeInterval`: after unfolding all six
constants both sides are the same kernel term, so a pure `rfl` closes it —
no case split, no arithmetic decision tactic, no `Classical.choice`, no axiom.

Variable contract: w = 重量/トン数 (Nat, トン); 五百万トン = 5,000,000 (STRICT 超え
lower), 二千五百万トン = 25,000,000 (INCLUSIVE 以下 upper). The 万/億-aware kanji
converter verifies these literals: int_to_kanji(5_000_000) = 五百万 and
int_to_kanji(25_000_000) = 二千五百万, both verbatim in the pinned needle.
Finite `example` points below are scaffolding, not the statutory formula.
-/

namespace JapanTaxLaw.WeightInterval5M25M

/-- 五百万トン = 5,000,000 トン. Independent STRICT lower constant. -/
def specLow : Nat := 5_000_000

/-- 二千五百万トン = 25,000,000 トン. Independent INCLUSIVE upper constant. -/
def specHigh : Nat := 25_000_000

/-- Independent interval: same operator as the impl, but own constants. -/
def specInInterval (w : Nat) : Bool :=
  decide (specLow < w && w <= specHigh)

-- Spec-local, kernel-decided spot-checks (scaffolding only).
example : specInInterval 0 = false := by decide
example : specInInterval 5_000_000 = false := by decide
example : specInInterval 5_000_001 = true := by decide
example : specInInterval 25_000_000 = true := by decide
example : specInInterval 25_000_001 = false := by decide

/-- Universal, kernel-checked axiom-free bridge for every Nat w.
    `unfold` then `rfl` only: identical operators and identical unfolded
    literals make both sides definitionally equal; no case split, no decision
    tactic, no choice, no axiom. -/
theorem agreeInterval (w : Nat) : inWeightInterval w = specInInterval w := by
  unfold inWeightInterval specInInterval weightLow weightHigh specLow specHigh
  rfl

end JapanTaxLaw.WeightInterval5M25M

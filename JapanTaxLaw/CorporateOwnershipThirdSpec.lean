import JapanTaxLaw.CorporateOwnershipThird

/-
# CorporateOwnershipThirdSpec — independent spec for 407M50000008033 第二条 (三分の一超)

Pinned source:
  Law id: 407M50000008033
  Revision: 407M50000008033_20040401_416M60000008074
  Raw snapshot: data/raw/407M50000008033_20040401_416M60000008074.law.json
  sha256: 8b5ef29f2c751866b7e7f00dd7d5aea22a1c935df6173886c9e60572574ba216
  Statutory article: 第二条 (art. 2; raw JSON Article attr.Num = "2").
  原文逐語: 「その発行済株式の総数又は出資金額若しくは拠出された金額の三分の一を超える数又は金額が法人税法（昭和二十二年法律第二十八号）別表第一第一号に掲げる法人により所有され、又は出資若しくは拠出をされている法人」

INDEPENDENT FORMULATION. This module restates the statutory 三分の一 = 1/3
using its OWN constant `specDivisor : Nat := 3`, transcribed independently
from the clause, and expresses 「三分の一を超える」 as
`specExceeds owned total := decide (specDivisor * owned > total)`.
No implementation identifier appears in any independent `spec*` definition:
the divisor value 3 and the STRICT comparison are written here from the source
text, not read from the implementation module.

The only bridges are the universal, kernel-checked theorems `agreeDivisor` and
`agreeExceeds`. After unfolding the four definitions the two bodies are
syntactically identical, so plain `rfl` closes each bridge. No proof automation
or placeholder proofs are used anywhere in this module.

Variable contract (same as the implementation): owned = 当該法人により所有される
株式数／出資金額 (Nat), total = 発行済株式の総数／出資金額 (Nat); domain total > 0;
三分の一を超える = 3 * owned > total, STRICT (exactly 1/3 does NOT qualify).
parse_statutory_rate(scoped) is None: this is an ownership threshold, not a tax
rate, so the single source-verified literal is {3} (三). Not modelled: 法人税法
別表第一第一号 status, the rest of 第二条, other articles.
-/

namespace JapanTaxLaw.CorporateOwnershipThird

/-- Spec-local 三分の一 divisor 三 = 3, independently transcribed from 第二条. -/
def specDivisor : Nat := 3

/-- Independent 「三分の一を超える」 (STRICT >). -/
def specExceeds (owned : Nat) (total : Nat) : Bool := decide (specDivisor * owned > total)

/-- Universal, kernel-checked equality of the two statutory divisors. -/
theorem agreeDivisor : ownershipDivisor = specDivisor := by unfold ownershipDivisor specDivisor; rfl

/-- Universal, kernel-checked correspondence for every Nat input. -/
theorem agreeExceeds (owned : Nat) (total : Nat) : exceedsOneThird owned total = specExceeds owned total := by
  unfold exceedsOneThird specExceeds ownershipDivisor specDivisor
  rfl

end JapanTaxLaw.CorporateOwnershipThird

import JapanTaxLaw.TwoStageVotingThreshold

/-
# TwoStageVotingThresholdSpec — independent spec for 326CO0000000216 第九条

Pinned source:
  Law id: 326CO0000000216
  Revision: 326CO0000000216_20240401_505CO0000000146
  Raw snapshot: data/raw/326CO0000000216_20240401_505CO0000000146.law.json
  sha256: 346e24c2512be9a2ef3524e48a54b67b3bff30d1d81468f69e3f39b92cf8d296
  Article: 第九条 (raw JSON Article attr.Num = "9")
  原文逐語: 「税理士会の総会の議事は、会員の二分の一以上の者が出席し、その出席者の過半数で決するものとし、可否同数のときは、議長の決するところによる。」

INDEPENDENT FORMULATION. This module independently restates the statutory
二分の一 = 1/2 via its OWN constant `specHalfDen : Nat := 2` (re-derived here
from the clause 「二分の一」, not read from the implementation) and expresses the
two stages with the SAME cross-multiplication operator but their own formulas:
  二分の一以上 (INCLUSIVE >=): `decide (total > 0 && specHalfDen * present >= total)`
  過半数 (STRICT >):          `decide (present > 0 && specHalfDen * yes > present)`
The single spec literal is 2 (二 of 二分の一); the guard literal 0 is only the
zero-denominator guard. No implementation identifier appears in any `spec*`
formula; the agreement theorems are not independent formulas.

The ONLY bridges are the universal, axiom-free theorems `agreeQuorum` and
`agreeMajority`: after unfolding the definitions the two bodies are
syntactically identical, so plain `rfl` closes them. No `by_cases`, no `omega`,
no `Classical.choice` in either bridge.

Variable contract: present = 出席者数 (Nat), total = 会員総数 (Nat),
yes = 賛成者数 (Nat); 二分の一以上 INCLUSIVE >=1/2; 過半数 STRICT >1/2;
zero guards false. 可否同数 (yes*2 == present) is a chair decision with no
numeric rule and is OUT OF SCOPE (noted only, not modelled here either).
-/

namespace JapanTaxLaw.TwoStageVotingThreshold

/-- Spec-local 二分の一 denominator: 2. Independently restated from 第九条. -/
def specHalfDen : Nat := 2

/-- Independent 「会員の二分の一以上の者が出席」 (INCLUSIVE >=, total>0 guard). -/
def specQuorum (present total : Nat) : Bool :=
  decide (total > 0 && specHalfDen * present >= total)

/-- Independent 「その出席者の過半数で決する」 (STRICT >, present>0 guard). -/
def specMajority (yes present : Nat) : Bool :=
  decide (present > 0 && specHalfDen * yes > present)

/-- Universal, kernel-checked correspondence for every Nat input.
    Pure `rfl` bridge after unfolding: no by_cases/omega/Classical.choice. -/
theorem agreeQuorum (present total : Nat) :
    quorumMet present total = specQuorum present total := by
  unfold quorumMet specQuorum specHalfDen
  rfl

/-- Universal, kernel-checked correspondence for every Nat input.
    Pure `rfl` bridge after unfolding: no by_cases/omega/Classical.choice. -/
theorem agreeMajority (yes present : Nat) :
    majorityFor yes present = specMajority yes present := by
  unfold majorityFor specMajority specHalfDen
  rfl

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specQuorum 0 0 = false := by decide
example : specQuorum 1 2 = true := by decide
example : specQuorum 0 2 = false := by decide
example : specQuorum 1 3 = false := by decide
example : specQuorum 2 3 = true := by decide
example : specMajority 2 3 = true := by decide
example : specMajority 1 2 = false := by decide
example : specMajority 2 4 = false := by decide
example : specMajority 2 2 = true := by decide
example : specMajority 3 5 = true := by decide
example : specMajority 0 0 = false := by decide

end JapanTaxLaw.TwoStageVotingThreshold

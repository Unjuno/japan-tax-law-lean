import JapanTaxLaw.QuorumOneThird

/-
# QuorumOneThirdSpec — independent spec for 412CO0000000277 第七条

Pinned source:
  Law id: 412CO0000000277
  Revision: 412CO0000000277_20160401_428CO0000000168
  Raw snapshot: data/raw/412CO0000000277_20160401_428CO0000000168.law.json
  sha256: c473d24ee2e16ec16f15f5ff52b870890a6ae70648672b3a47c0c26f75cc7709
  Article: 第七条 (raw JSON Article attr.Num = "7")
  原文逐語: 「審査会は、委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」

INDEPENDENT FORMULATION. This module independently restates the statutory
三分の一 = 1/3 via its OWN constant `specThirdDen : Nat := 3` and expresses
「三分の一以上」 as `decide (total > 0 && specThirdDen * present >= total)`.
The cross-multiplication operator is the same as in the implementation; the
statutory denominator 3 is re-derived here from the clause (第七条) on its own,
not read from the implementation. No implementation identifier appears in any
independent `spec*` formula; the agreement theorem is not an independent
formula.

The ONLY bridge is the universal, axiom-free theorem `agreeQuorum`: after
unfolding the three definitions the two bodies are syntactically identical, so
plain `rfl` closes it. No by_cases, no omega, no Classical.choice.

Variable contract: present = 出席委員数 (Nat), total = 委員の総数 (Nat);
三分の一 = 1/3 = 三分之一; 以上 INCLUSIVE (>=); total=0 guard false.
Not modelled (same as the implementation): the rest of 第七条, the meeting and
voting procedure, the composition of the commission, other articles.
-/

namespace JapanTaxLaw.QuorumOneThird

/-- Spec-local 三分の一 denominator: 3. Independently restated from 第七条. -/
def specThirdDen : Nat := 3

/-- Independent 「委員の三分の一以上が出席」 (INCLUSIVE >=, total>0 guard). -/
def specQuorum (present total : Nat) : Bool :=
  decide (total > 0 && specThirdDen * present >= total)

/-- Universal, kernel-checked correspondence for every Nat input.
    Pure `rfl` bridge after unfolding: no by_cases/omega/Classical.choice. -/
theorem agreeQuorum (present total : Nat) :
    quorumMet present total = specQuorum present total := by
  unfold quorumMet specQuorum specThirdDen
  rfl

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specQuorum 0 0 = false := by decide
example : specQuorum 1 3 = true := by decide
example : specQuorum 0 3 = false := by decide
example : specQuorum 1 4 = false := by decide
example : specQuorum 2 7 = false := by decide
example : specQuorum 2 4 = true := by decide
example : specQuorum 1 2 = true := by decide

end JapanTaxLaw.QuorumOneThird

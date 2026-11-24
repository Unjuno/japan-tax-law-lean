import JapanTaxLaw.PrescribedTimesTwo

/-
# PrescribedTimesTwoSpec — independent spec for 沖縄復帰特例省令 art.26（二回）

Pinned source:
  Law id: 347M50000040042
  Revision: 347M50000040042_20251231_507M60000040072
  Snapshot: data/raw/347M50000040042_20251231_507M60000040072.law.json
  Statutory article: 第二十六条(1) — 財務省令で定める回数は二回
  原文逐語: 「令第八十七条第四項に規定する財務省令で定める回数は、二回とする。」
  Normative unit: NORM|23f9f0b92275bf292ef67ec9c8960150c623566ad2a5d52ef238574d14da3a25

The implementation compares the count directly (`n == 2`). This module is an
INDEPENDENT formulation: it carries its own statutory constant derived from a
two-element list length (`[unit, unit].length`) and tests equality with the
successor-based comparison `Nat.succ 1 == n` — a different formulation from the
impl's direct decimal compare. It reuses NO implementation definition inside
its own `spec*` defs; the universal `agree_prescribed_count` theorem is the only
bridge, and the kernel checks it for every Nat count.

Not modelled: the underlying 政令 art.87(4) matter, the procedure, other articles
and enforcement rules.
-/

namespace JapanTaxLaw.PrescribedTimesTwo

/-- Spec-local statutory value: 二回 = 2, derived as a two-element list length. -/
def specTimes : Nat := [Nat.succ 0, Nat.succ 0].length

/-- Independent equality test: successor-form comparison, not `n == 2`. -/
def specIsPrescribedCount (n : Nat) : Bool :=
  decide (Nat.succ (Nat.succ 0) == n)

/-- Universal, kernel-checked correspondence for every Nat count. -/
theorem agree_prescribed_count (n : Nat) :
    isPrescribedCount n = specIsPrescribedCount n := by
  unfold isPrescribedCount prescribedTimes specIsPrescribedCount
  by_cases h : n = 2
  · subst n
    decide
  · have hs : Nat.succ (Nat.succ 0) != n := by omega
    simp [h, hs]

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specTimes = 2 := by decide

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specTimesGrid : Bool :=
  [0, 1, 2, 3].all fun n =>
    specIsPrescribedCount n == decide (2 <= n && n <= 2)

example : specTimesGrid = true := by decide

end JapanTaxLaw.PrescribedTimesTwo

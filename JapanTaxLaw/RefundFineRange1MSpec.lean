import JapanTaxLaw.RefundFineRange1M

/-
# RefundFineRange1M spec — 輸入品に対する内国消費税の徴収等に関する法律 第二十三条 の独立整数定式

Pinned source: law 330AC0000000037, revision 330AC0000000037_20260401_508AC0000000012,
raw data/raw/330AC0000000037_20260401_508AC0000000012.law.json (sha256
21c2b44d6e9a1d85d22b71b5c028b3e9276133d5e33a14d4e7c1a547e6068f94), Article Num 23.

This module is an INDEPENDENT restatement. It carries its OWN statutory constants
(specFloor, specMult) and writes both predicates from scratch; it reuses NO
implementation definition inside its own spec* formulas. The only bridges are the
two universal agree* theorems, proved by `unfold ... ; rfl` with no unproved
constants: once the constants are unfolded, each spec formula is definitionally
the SAME kernel term as the corresponding implementation formula, so reflexivity
closes the goal. No case splits, no arithmetic-solving tactics, no classical
choice, and no added constants.

原文逐語 (pinned): 「前項の犯罪に係る還付金相当額の三倍が百万円を超えるときは、情状により、同項の罰金は、百万円を超え当該相当額の三倍以下とすることができる。」
-/

namespace JapanTaxLaw.RefundFineRange1M

/-- 百万円: spec-local 下限 = 1,000,000. -/
def specFloor : Nat := 1_000_000

/-- 三倍: spec-local 倍率 = 3. -/
def specMult : Nat := 3

/-- 「三倍が百万円を超える」— spec-local, strict. -/
def specApplies (tax : Nat) : Bool :=
  decide (specFloor < specMult * tax)

/-- 「百万円を超え三倍以下」— spec-local, strict floor + inclusive ceiling. -/
def specWithin (fine tax : Nat) : Bool :=
  decide (specFloor < fine && fine <= specMult * tax)

/-- Universal, kernel-checked bridge for the range-application condition. -/
theorem agree_applies (tax : Nat) :
    rangeApplies tax = specApplies tax := by
  unfold rangeApplies fineUpper fineFloor specApplies specMult specFloor
  rfl

/-- Universal, kernel-checked bridge for the fine-range predicate. -/
theorem agree_within (fine tax : Nat) :
    fineWithinRange fine tax = specWithin fine tax := by
  unfold fineWithinRange fineUpper fineFloor specWithin specMult specFloor
  rfl

example : specFloor = 1_000_000 := rfl
example : specMult = 3 := rfl
example : specApplies 333_334 = true := by decide
example : specWithin 1_000_001 333_334 = true := by decide

end JapanTaxLaw.RefundFineRange1M

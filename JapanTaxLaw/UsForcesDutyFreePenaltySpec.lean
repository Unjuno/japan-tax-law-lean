import JapanTaxLaw.UsForcesDutyFreePenalty

/-!
# UsForcesDutyFreePenalty spec — art.11(3) の独立整数定式

Sources (pinned): law 327AC0000000111, revision 327AC0000000111_20250601_504AC0000000068.
Independent restatement (declares its OWN constants from the 原文, does not
reference the implementation constants):
  拘禁刑上限 = 12 月 (一年以下)、罰金上限 = 500,000 円 (五十万円以下)、
  代替刑の各要素が上限以下なら上限内。

The correspondence theorem quantifies over EVERY `Penalty`, so it is a kernel
proof, not a finite-domain enumeration.
-/

namespace JapanTaxLaw.UsForcesDutyFreePenalty

/-- 独立仕様の定数（実装定数を参照しない）。 -/
def specMaxMonths : Nat := 12
def specMaxYen : Nat := 500_000

def specWithin : Penalty -> Bool
  | Penalty.imprisonment m => m <= specMaxMonths
  | Penalty.fine y => y <= specMaxYen

/-- 全ての Penalty 値に対する対応（有限列挙ではない、Lean カーネル検証）。 -/
theorem specWithin_iff_withinLimits (p : Penalty) :
    specWithin p = withinLimits p := by
  cases p with
  | imprisonment m =>
      simp [specWithin, withinLimits, specMaxMonths, maxImprisonmentMonths]
  | fine y =>
      simp [specWithin, withinLimits, specMaxYen, maxFineYen]

example : specWithin (Penalty.imprisonment 12) = true := by decide
example : specWithin (Penalty.imprisonment 13) = false := by decide
example : specWithin (Penalty.fine 500_000) = true := by decide
example : specWithin (Penalty.fine 500_001) = false := by decide

end JapanTaxLaw.UsForcesDutyFreePenalty

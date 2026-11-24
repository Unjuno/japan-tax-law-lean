import JapanTaxLaw.SpecialTonnageArt10PenaltyCap

/-!
# SpecialTonnageArt10PenaltyCap spec — 3年/50万円上限の独立定式

Sources (pinned): law 332AC0000000038, revision 332AC0000000038_20250601_504AC0000000068.
Independent restatement: 上限超過がないことを否定形で判定（years>3 でなく
fine>500000 でない）。実装識別子を再利用しない。有限領域の kernel-decided
検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.SpecialTonnageArt10PenaltyCap

def specMaxTerm : Nat := 3

def specMaxFine : Nat := 500000

def specWithinCaps (termYears fineYen : Nat) : Bool :=
  (! (specMaxTerm < termYears)) && (! (specMaxFine < fineYen))

example : specWithinCaps 3 500000 = true := by decide
example : specWithinCaps 4 500000 = false := by decide
example : specWithinCaps 3 500001 = false := by decide

def agreeSpecialTonnageArt10PenaltyCap : Bool :=
  [0, 1, 2, 3, 4, 499999, 500000, 500001].all (fun years =>
    [0, 499999, 500000, 500001].all (fun fine =>
      withinCaps years fine == specWithinCaps years fine))

example : agreeSpecialTonnageArt10PenaltyCap = true := by decide

end JapanTaxLaw.SpecialTonnageArt10PenaltyCap

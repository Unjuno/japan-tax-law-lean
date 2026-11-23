import JapanTaxLaw.MergerGrantFiscalWindow

/-
Independent spec for MergerGrantFiscalWindow (市町村合併補助金 第八条).
Own constants specStart = 47 (昭和四十七年度) and specEnd = 52 (昭和五十二年度), with
an INCLUSIVE [47,52] membership test. No implementation identifiers appear in the defs.
-/

open JapanTaxLaw.MergerGrantFiscalWindow

namespace JapanTaxLaw.MergerGrantFiscalWindowSpec

def specStart : Nat := 47

def specEnd : Nat := 52

def specInWindow (fy : Nat) : Bool :=
  decide (specStart <= fy && fy <= specEnd)

theorem agreeStart : windowStartFY = specStart := by unfold windowStartFY specStart; rfl

theorem agreeEnd : windowEndFY = specEnd := by unfold windowEndFY specEnd; rfl

theorem agreeWindow (fy : Nat) : inGrantWindow fy = specInWindow fy := by
  unfold inGrantWindow specInWindow windowStartFY windowEndFY specStart specEnd
  rfl

end JapanTaxLaw.MergerGrantFiscalWindowSpec

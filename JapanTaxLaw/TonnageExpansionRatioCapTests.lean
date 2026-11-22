import JapanTaxLaw.TonnageExpansionRatioCap
import JapanTaxLaw.TonnageExpansionRatioCapSpec

/-
# TonnageExpansionRatioCapTests — kernel-decided checks for 登録免許税法施行令 第二十一条

Pinned source: law 342CO0000000146, revision 342CO0000000146_20261001_507CO0000000124,
  data/raw/342CO0000000146_20261001_507CO0000000124.law.json,
  sha256 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b.
Every closed check below is a Nat/Bool expression discharged by `by decide`
(or by pure `rfl`), plus theorem applications at concrete points.
Coverage: exact 1.6x (16/10), just above/below, before=0 guard, small inputs,
threshold 15/16/17 around literal 16, saturation, and impl/spec agreement.
-/

namespace JapanTaxLaw.TonnageExpansionRatioCap

-- (a) statutory constants.
example : scaledRatio = 16 := by rfl
example : scaleBase = 10 := by rfl
example : specScaledRatio = 16 := by rfl
example : specScaleBase = 10 := by rfl

-- (b) exactly 1.6x: before=100, after=160 passes the INCLUSIVE ceiling.
example : withinCap 100 160 = true := withinCap_at_cap
example : withinCap 100 160 = true := by decide
example : specWithin 100 160 = true := by decide

-- (c) just below / just above at before=100.
example : withinCap 100 159 = true := withinCap_below_cap
example : withinCap 100 159 = true := by decide
example : specWithin 100 159 = true := by decide
example : withinCap 100 161 = false := withinCap_above_cap
example : withinCap 100 161 = false := by decide
example : specWithin 100 161 = false := by decide

-- (d) before=0 guard: only after=0 passes.
example : withinCap 0 0 = true := withinCap_zero
example : withinCap 0 0 = true := by decide
example : specWithin 0 0 = true := by decide
example : withinCap 0 1 = false := by decide
example : specWithin 0 1 = false := by decide

-- (e) after=0 with a positive before.
example : withinCap 100 0 = true := by decide
example : specWithin 100 0 = true := by decide

-- (f) small inputs and threshold 15/16/17 around the statutory literal 16.
example : withinCap 10 15 = true := by decide
example : withinCap 10 16 = true := by decide
example : withinCap 10 17 = false := by decide
example : specWithin 10 15 = true := by decide
example : specWithin 10 16 = true := by decide
example : specWithin 10 17 = false := by decide

-- (g) Nat cross-multiplication identity/saturation.
example : 10 * 16 = 16 * 10 := by decide
example : scaleBase * scaledRatio = specScaleBase * specScaledRatio := by decide

-- (h) impl/spec agreement at concrete points (kernel-decided).
example : withinCap 100 160 = specWithin 100 160 := by decide
example : withinCap 100 161 = specWithin 100 161 := by decide
example : withinCap 100 159 = specWithin 100 159 := by decide
example : withinCap 0 0 = specWithin 0 0 := by decide
example : withinCap 10 15 = specWithin 10 15 := by decide
example : withinCap 10 17 = specWithin 10 17 := by decide

-- (i) universal, axiom-free bridges applied as proof terms.
example (before : Nat) (after : Nat) : withinCap before after = specWithin before after := by
  exact agreeWithin before after
example : scaledRatio = specScaledRatio := agreeRatio
example : scaleBase = specScaleBase := agreeBase

end JapanTaxLaw.TonnageExpansionRatioCap

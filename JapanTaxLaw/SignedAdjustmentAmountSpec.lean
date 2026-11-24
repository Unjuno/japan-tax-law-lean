import JapanTaxLaw.SignedAdjustmentAmount

/-
# SignedAdjustmentAmountSpec — independent spec for 第五条 (signed adjustment amount)

Independently transcribed the timing/fiscal-year constants and the four-step
signed chain, with its own names and its own formula:
  specYear     = 8  (令和八年)
  specMonth    = 3  (三月)
  specBaseYear = 7  (令和七年度)
  specCompute base item1 item2 item3 = (base : Int) - item1 + item2 - item3
No implementation identifiers occur inside the spec* definitions. Agreement
with the implementation is established only by the kernel bridges below.
-/

namespace JapanTaxLaw.SignedAdjustmentAmountSpec

open JapanTaxLaw.SignedAdjustmentAmount

/-- 令和八年 — independent transcription. -/
def specYear : Nat := 8

/-- 三月 — independent transcription. -/
def specMonth : Nat := 3

/-- 令和七年度 — independent transcription. -/
def specBaseYear : Nat := 7

/-- Independent four-step signed adjustment chain (own definitions). -/
def specCompute (base : Nat) (item1 : Nat) (item2 : Int) (item3 : Nat) : Int :=
  (base : Int) - (item1 : Int) + item2 - (item3 : Int)

theorem agreeYear : targetYear = specYear := by
  unfold targetYear specYear
  rfl

theorem agreeMonth : targetMonth = specMonth := by
  unfold targetMonth specMonth
  rfl

theorem agreeBaseYear : baseYear = specBaseYear := by
  unfold baseYear specBaseYear
  rfl

theorem agreeCompute (base : Nat) (item1 : Nat) (item2 : Int) (item3 : Nat) :
    grantAmount base item1 item2 item3 = specCompute base item1 item2 item3 := by
  unfold grantAmount specCompute
  rfl

end JapanTaxLaw.SignedAdjustmentAmountSpec

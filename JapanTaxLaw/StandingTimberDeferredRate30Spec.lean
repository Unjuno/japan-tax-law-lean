import JapanTaxLaw.StandingTimberDeferredRate30

/-!
# StandingTimberDeferredRate30 spec — 30/100 の独立定式

Sources (pinned): law 325CO0000000071, revision 325CO0000000071_20260401_506CO0000000143,
art. 28 (第二十八条) §1. Independent restatement: 3/10 の割合を税額に乗じる。
-/

namespace JapanTaxLaw.StandingTimberDeferredRate30

def specTimberRateNum : Nat := 30

def specTimberRateDen : Nat := 100

def specTimberDeferredTax (tax : Nat) : Nat :=
  tax * 30 / 100

example : specTimberDeferredTax 100 = 30 := by decide

def agreeStandingTimberDeferredRate30 : Bool :=
  [0, 1, 7, 29, 30, 31, 99, 100, 101, 1_000, 123_457].all fun t =>
    timberDeferredTax t == specTimberDeferredTax t

example : agreeStandingTimberDeferredRate30 = true := by decide

end JapanTaxLaw.StandingTimberDeferredRate30

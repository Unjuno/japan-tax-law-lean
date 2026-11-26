import JapanTaxLaw.ConsumptionTaxReformEnforcementDateReiwa2

/-
# ConsumptionTaxReformEnforcementDateReiwa2Spec — independent spec for 消費税抜本改革法 附則第一条

Pinned source:
  Law id: 424AC0000000068
  Revision: 424AC0000000068_20250401_506AC0000000046
  Statutory article: 附則 第一条(1)
  原文逐語: 「この法律は、令和二年四月一日から施行する。」
  Normative unit: NORM|72bedb96918f8630e1e4d2cf714e85d493634f87c4d6f26078b56bc4eeeae491

This module carries its OWN date components and a distinct successor-shifted
equality formula, `decide (succ y == succ 2 && succ m == succ 4 && succ d == succ 1)`,
rather than the impl's bare decimal comparison. It reuses NO implementation
definition inside its `spec*` defs; the universal `agree_enforcement_date`
theorem is the only bridge, and the kernel checks it by definitional equality
(axiom-free). Statutory literals 2, 4, 1 are verified directly against 原文
(二 = 2, 四 = 4, 一 = 1).

Not modelled: Gregorian conversion, other supplementary articles and
enforcement rules.
-/

namespace JapanTaxLaw.ConsumptionTaxReformEnforcementDateReiwa2

def specEraYear : Nat := 2
def specMonth : Nat := 4
def specDay : Nat := 1

/-- Distinct, successor-shifted equality on the date triple. -/
def specIsEnforcementDate (y m d : Nat) : Bool :=
  decide (Nat.succ y == Nat.succ specEraYear &&
          Nat.succ m == Nat.succ specMonth &&
          Nat.succ d == Nat.succ specDay)

/-- Universal, kernel-checked, axiom-free agreement for every date triple. -/
theorem agree_enforcement_date (y m d : Nat) :
    isEnforcementDate y m d = specIsEnforcementDate y m d := by
  unfold isEnforcementDate enforcementEraYear enforcementMonth enforcementDay
  unfold specIsEnforcementDate specEraYear specMonth specDay
  rfl

example : specIsEnforcementDate 2 4 1 = true := by decide
example : specIsEnforcementDate 1 4 1 = false := by decide

end JapanTaxLaw.ConsumptionTaxReformEnforcementDateReiwa2

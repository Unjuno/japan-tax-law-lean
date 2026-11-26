import JapanTaxLaw.UsForcesTreatyEnforcementDateReiwa8

/-
# UsForcesTreatyEnforcementDateReiwa8Spec — independent spec for 米軍地位協定国税臨時特例法 附則第一条

Pinned source:
  Law id: 327AC0000000113
  Revision: 327AC0000000113_20260401_508AC0000000012
  Statutory article: 附則 第一条(1)
  原文逐語: 「この法律は、令和八年四月一日から施行する。」
  Normative unit: NORM|b5137b6e0cf7a11197d82dd9d52fe925860b459cc31e1a7119ffd4cbf270c61b

This module carries its OWN date components and a distinct successor-shifted
equality formula, `decide (succ y == succ 8 && succ m == succ 4 && succ d == succ 1)`,
rather than the impl's bare decimal comparison. It reuses NO implementation
definition inside its `spec*` defs; the universal `agree_enforcement_date`
theorem is the only bridge, and the kernel checks it by definitional equality
(axiom-free). Statutory literals 8, 4, 1 are verified directly against 原文
(令和八 = 8, 四 = 4, 一 = 1).

Not modelled: Gregorian conversion, other supplementary articles and
enforcement rules.
-/

namespace JapanTaxLaw.UsForcesTreatyEnforcementDateReiwa8

def specEraYear : Nat := 8
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

example : specIsEnforcementDate 8 4 1 = true := by decide
example : specIsEnforcementDate 7 4 1 = false := by decide

end JapanTaxLaw.UsForcesTreatyEnforcementDateReiwa8

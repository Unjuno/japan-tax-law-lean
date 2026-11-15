import JapanTaxLaw.InheritanceMinorDisabledDeduction

/-!
# InheritanceMinorDisabledDeduction spec — independent restatement of
  相続税法 art. 19-3（未成年者控除）・art. 19-4（障害者控除）

Sources (pinned; identical to InheritanceMinorDisabledDeduction.lean):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * art. 19-3(1) — 相続人で十八歳未満の場合、第十五条から前条までによる算出額から
    **十万円 × (その者が十八歳に達するまでの年数、一年未満・端数は一年に切上げ)** を控除;
  * art. 19-4(1) — 政令で定める障害者に該当する相続人に対し、
    **十万円**（その者が特別障害者である場合には、**二十万円**）×
    (その者が八十五歳に達するまでの年数、一年未満・端数は一年に切上げ) を控除
from the statutory text itself.

Scope boundaries identical to the implementation (see InheritanceMinorDisabledDeduction.lean).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 19-3/19-4 が共通で要求する「一年未満又は端数は一年とする」の月数→年数変換。 -/
def specYearsCeil (months : Nat) : Nat := (months + 11) / 12

/-- Spec: art. 19-3(1) の控除額（該当する場合のみ十万円×年数）。 -/
def specMinorDeduction (isMinorHeir : Bool) (monthsTo18 : Nat) : Money :=
  if isMinorHeir then specYearsCeil monthsTo18 * 100_000 else 0

/-- Spec: art. 19-4(1) の控除額（該当する場合のみ十万円/特別障害者は二十万円×年数）。 -/
def specDisabledDeduction (isDisabledHeir : Bool) (isSpecialDisabled : Bool) (monthsTo85 : Nat) : Money :=
  if isDisabledHeir then
    if isSpecialDisabled then specYearsCeil monthsTo85 * 200_000
    else specYearsCeil monthsTo85 * 100_000
  else 0

-- ==== points, all kernel-decided ====

-- 切上げ境界（一年未満のとき・端数があるときは一年とする）
example : specYearsCeil 0 = 0 := by decide
example : specYearsCeil 1 = 1 := by decide
example : specYearsCeil 11 = 1 := by decide
example : specYearsCeil 12 = 1 := by decide
example : specYearsCeil 13 = 2 := by decide
example : specYearsCeil 24 = 2 := by decide
example : specYearsCeil 25 = 3 := by decide

-- art. 19-3(1) examples
example : specMinorDeduction true 30 = 300_000 := by decide
example : specMinorDeduction true 180 = 1_500_000 := by decide
example : specMinorDeduction true 1 = 100_000 := by decide
example : specMinorDeduction true 12 = 100_000 := by decide
example : specMinorDeduction true 13 = 200_000 := by decide
example : specMinorDeduction false 60 = 0 := by decide
example : specMinorDeduction true 0 = 0 := by decide

-- art. 19-4(1) examples
example : specDisabledDeduction true false 180 = 1_500_000 := by decide
example : specDisabledDeduction true true 180 = 3_000_000 := by decide
example : specDisabledDeduction true false 1020 = 8_500_000 := by decide
example : specDisabledDeduction true true 1020 = 17_000_000 := by decide
example : specDisabledDeduction true false 1 = 100_000 := by decide
example : specDisabledDeduction false true 100 = 0 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points. -/
def agreeMinorPoints : Bool :=
  let samples : List (Bool × Nat) :=
    [ (true, 1), (true, 11), (true, 12), (true, 13), (true, 30), (true, 180),
      (true, 216), (false, 60), (false, 0) ]
  samples.all fun (isHeir, months) =>
    specMinorDeduction isHeir months == minorDeduction ⟨isHeir, months⟩

def agreeDisabledPoints : Bool :=
  let samples : List (Bool × Bool × Nat) :=
    [ (true, false, 1), (true, true, 1), (true, false, 13), (true, true, 13),
      (true, false, 180), (true, true, 180), (true, false, 1020), (true, true, 1020),
      (false, true, 100), (false, false, 0) ]
  samples.all fun (isHeir, isSpecial, months) =>
    specDisabledDeduction isHeir isSpecial months ==
      disabledDeduction ⟨isHeir, isSpecial, months⟩

example : agreeMinorPoints = true := by decide
example : agreeDisabledPoints = true := by decide

end JapanTaxLaw

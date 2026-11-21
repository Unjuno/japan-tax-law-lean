import JapanTaxLaw.ThousandYenTruncation

/-
# ThousandYenTruncationSpec — 石油ガス譲与税法施行規則 art.5 の独立整数定式

Pinned source:
  Law id: 341M50000008002
  Revision: 341M50000008002_20191128_501M60000008059
  Raw snapshot: data/raw/341M50000008002_20191128_501M60000008059.law.json
  sha256: 4a676a0093742423265ad491a7d498c1d7256efd26ba7cf91eb3d165fa48bc96
  Article: 第五条 (attr.Num = "5")
  原文逐語: 「…に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該錯誤に係る額とする。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specRoundingUnit : Nat := 1_000` (千円) and expresses the 控除 rule by FLOOR
DIVISION reconstruction: `specRoundingUnit * (amount / specRoundingUnit)`.
That is a DIFFERENT operator from the implementation's `amount - amount % unit`.
No implementation identifier occurs in any independent formula above; the
universal kernel-checked theorem `agreeTruncation` is the ONLY impl/spec bridge.

The floor-division reconstruction equals subtraction-of-remainder by the
division algorithm (`Nat.div_add_mod`): amount = unit * (amount / unit) +
amount % unit, hence unit * (amount / unit) = amount - amount % unit.
The kernel checks this equivalence for EVERY Nat, not a finite sample.

Not modelled (same as the implementation): 第一条の加算/減額手続,
道路延長・面積の算式, 小数点以下三位未満の四捨五入, other articles,
and all enforcement/operational rules.
-/

namespace JapanTaxLaw.ThousandYenTruncation

/-- Spec-local statutory constant: 千円 = 1,000 (円, Nat). Independent of impl. -/
def specRoundingUnit : Nat := 1_000

/-- Independent 「千円未満を控除」: floor-division reconstruction, NOT modulo. -/
def specTruncate (amount : Nat) : Nat :=
  specRoundingUnit * (amount / specRoundingUnit)

/-- Universal, kernel-checked correspondence for every Nat amount.
    This is the ONLY impl/spec bridge (omega uses the division algorithm). -/
theorem agreeTruncation (amount : Nat) :
    truncateThousand amount = specTruncate amount := by
  unfold truncateThousand specTruncate roundingUnit specRoundingUnit
  omega

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specRoundingUnit = 1_000 := by decide
example : specTruncate 0 = 0 := by decide
example : specTruncate 1 = 0 := by decide
example : specTruncate 999 = 0 := by decide
example : specTruncate 1_000 = 1_000 := by decide
example : specTruncate 1_500 = 1_000 := by decide
example : specTruncate 12_345 = 12_000 := by decide

end JapanTaxLaw.ThousandYenTruncation

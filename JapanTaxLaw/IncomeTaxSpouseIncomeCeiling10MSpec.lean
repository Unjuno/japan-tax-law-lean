import JapanTaxLaw.IncomeTaxSpouseIncomeCeiling10M

/-!
# IncomeTaxSpouseIncomeCeiling10M spec — 千万円以下の独立定式

Sources (pinned): law 340AC0000000033, revision 340AC0000000033_20261001_507AC0000000070.
Independent restatement: 「千万円を超えない」を否定形 `!(specCeiling < income)`
として書く。実装識別子を再利用しない。有限領域の kernel-decided 検査であり
普遍的な定理ではない。
-/

namespace JapanTaxLaw.IncomeTaxSpouseIncomeCeiling10M

def specCeilingYen : Nat := 10000000

def specWithinCeiling (income : Nat) : Bool :=
  ! (specCeilingYen < income)

example : specWithinCeiling 10000000 = true := by decide
example : specWithinCeiling 10000001 = false := by decide

def agreeIncomeTaxSpouseIncomeCeiling10M : Bool :=
  [0, 1, 9999999, 10000000, 10000001, 20000000].all (fun a =>
    spouseQualifies a == specWithinCeiling a)

example : agreeIncomeTaxSpouseIncomeCeiling10M = true := by decide

end JapanTaxLaw.IncomeTaxSpouseIncomeCeiling10M

import JapanTaxLaw.CarCountReferenceDate

/-!
# CarCountReferenceDate spec — 基準日算定の独立定式
Sources (pinned): law 346M50000008013, revision 346M50000008013_20230401_505M60000008036.
Independent restatement: refYear(y)=y-1, refDate(y)=(y-1,4,1)。
-/

namespace JapanTaxLaw.CarCountReferenceDate

def specYear (y : Nat) : Nat := if y = 0 then 0 else y - 1
def specDate (y : Nat) : Nat × Nat × Nat := (specYear y, 4, 1)

example : specDate 2025 = (2024, 4, 1) := by decide

def agreeCarCountReferenceDate : Bool :=
  [1, 2, 100, 2025, 2026].all fun y => referenceDate y == specDate y

example : agreeCarCountReferenceDate = true := by decide

end JapanTaxLaw.CarCountReferenceDate

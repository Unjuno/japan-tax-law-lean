import JapanTaxLaw.MultiDonorDeduction

/-!
# MultiDonorDeduction spec — 相続税法施行令 art.5の2 の独立整数定式
Sources (pinned): law 325CO0000000071, revision 325CO0000000071_20260401_506CO0000000143.
Independent restatement: 各特定贈与者の控除額 = 600,000 × (当該者課税価格 ÷ 合計課税価格)。
実装とは独立に数値・式を書き下す。同一の誤解を共有しないよう除算を明示。
-/

namespace JapanTaxLaw.MultiDonorDeduction

def specBase : Nat := 600_000

def specShare (total price : Nat) : Nat :=
  if total = 0 then 0 else 600_000 * price / total

example : specBase = 600_000 := by decide
example : specShare 2 1 = 300_000 := by decide
example : specShare 4 1 = 150_000 := by decide
example : specShare 3 2 = 400_000 := by decide
example : specShare 0 0 = 0 := by decide

def agreeMultiDonorDeduction : Bool :=
  [ (1,1), (2,1), (3,1), (3,2), (4,1), (7,3), (10,5) ].all fun (t, p) =>
    donorDeductionYen t p == specShare t p

example : agreeMultiDonorDeduction = true := by decide

end JapanTaxLaw.MultiDonorDeduction

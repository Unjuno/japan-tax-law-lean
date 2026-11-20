import JapanTaxLaw.ExamFee

/-!
# ExamFee spec — 税理士法施行令 art.6の2 の独立整数定式
Sources (pinned): law 326CO0000000216, revision 326CO0000000216_20240401_505CO0000000146.
Independent restatement: n科目 = 1 → 4000; n≥2 → 4000 + 1500(n-1); n=0 → 0 (適用外)。
-/

namespace JapanTaxLaw.ExamFee

def specExamFee (n : Nat) : Nat :=
  match n with
  | 0 => 0
  | 1 => 4000
  | k + 2 => 4000 + 1500 * (k + 1)

example : specExamFee 1 = 4000 := by decide
example : specExamFee 2 = 5500 := by decide
example : specExamFee 3 = 7000 := by decide
example : specExamFee 5 = 10000 := by decide

def agreeExamFee : Bool :=
  [0, 1, 2, 3, 4, 5, 10].all fun n => examFee n == specExamFee n

example : agreeExamFee = true := by decide

end JapanTaxLaw.ExamFee

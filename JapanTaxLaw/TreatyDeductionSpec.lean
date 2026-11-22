import JapanTaxLaw.TreatyDeduction

/-!
# TreatyDeduction spec — 国内控除額 × 条約割合 の独立定式
Sources (pinned): law 329AC0000000194, revision 329AC0000000194_20010106_411AC0000000160.
Independent restatement: deduction = internal * num / den（den=0 → 0）。
-/

namespace JapanTaxLaw.TreatyDeduction

def specDeduction (d n den : Nat) : Nat := if den = 0 then 0 else d * n / den

example : specDeduction 1000 1 2 = 500 := by decide
example : specDeduction 1000 3 4 = 750 := by decide

def agreeTreatyDeduction : Bool :=
  [ (1000,1,2), (1000,3,4), (0,1,2), (1000,1,0), (500,2,3) ].all fun (d,n,den) =>
    treatyDeduction d n den == specDeduction d n den

example : agreeTreatyDeduction = true := by decide

end JapanTaxLaw.TreatyDeduction

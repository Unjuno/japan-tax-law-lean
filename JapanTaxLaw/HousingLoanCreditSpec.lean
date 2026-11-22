import JapanTaxLaw.HousingLoanCredit

/-!
# HousingLoanCredit spec — 3段階控除 の独立整数定式
Sources (pinned): law 407AC0000000011, revision 407AC0000000011_20200401_502AC0000000008.
-/

namespace JapanTaxLaw.HousingLoanCredit

def specCredit (b : Nat) : Nat :=
  let raw :=
    if b <= 10000000 then b * 20 / 1000
    else if b <= 20000000 then (b-10000000)*10/1000 + 200000
    else (if b-20000000 <= 10000000 then b-20000000 else 10000000)*5/1000 + 300000
  raw / 100 * 100

example : specCredit 10000000 = 200000 := by decide
example : specCredit 15000000 = 250000 := by decide
example : specCredit 30000000 = 350000 := by decide

def agreeHousingLoanCredit : Bool :=
  [0, 5_000_000, 10_000_000, 15_000_000, 20_000_000, 25_000_000, 30_000_000].all fun b =>
    creditYen b == specCredit b

example : agreeHousingLoanCredit = true := by decide

end JapanTaxLaw.HousingLoanCredit

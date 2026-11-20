import JapanTaxLaw.SavingsDepositInterest

/-!
# SavingsDepositInterest spec — 納税貯蓄組合法 art.8 の独立整数定式
Sources (pinned): law 326AC1000000145, revision 326AC1000000145_20211122_503AC0000000046.
Independent restatement: 「十万円をこえる」= amount > 100000（厳密不等式）。
-/

namespace JapanTaxLaw.SavingsDepositInterest

def specThreshold : Nat := 100_000

def specOver (amount : Nat) : Bool := amount > 100000

example : specThreshold = 100_000 := by decide
example : specOver 100_000 = false := by decide
example : specOver 100_001 = true := by decide

def agreeSavingsDepositInterest : Bool :=
  [0, 1, 99_999, 100_000, 100_001, 200_000].all fun a =>
    isOverThreshold a == specOver a

example : agreeSavingsDepositInterest = true := by decide

end JapanTaxLaw.SavingsDepositInterest

import JapanTaxLaw.AmamiInvestmentThreshold

/-!
# AmamiInvestmentThreshold spec —  capital 別閾値の独立定式
Sources (pinned): law 411M50000008014, revision 411M50000008014_20240401_506M60000008035.
Independent restatement: 大きい capital から順に 2000/1000/500 を選択。
-/

namespace JapanTaxLaw.AmamiInvestmentThreshold

def specThreshold (c : Nat) : Nat :=
  if c > 10000 then 2000 else if c > 5000 then 1000 else 500

example : specThreshold 5001 = 1000 := by decide
example : specThreshold 10001 = 2000 := by decide

def agreeAmamiInvestmentThreshold : Bool :=
  [0, 5000, 5001, 10000, 10001, 20000].all fun c => investmentThreshold c == specThreshold c

example : agreeAmamiInvestmentThreshold = true := by decide

end JapanTaxLaw.AmamiInvestmentThreshold

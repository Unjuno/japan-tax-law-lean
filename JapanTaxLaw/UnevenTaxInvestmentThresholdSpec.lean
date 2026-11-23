import JapanTaxLaw.UnevenTaxInvestmentThreshold

/-!
# UnevenTaxInvestmentThreshold spec — 資本金別閾値の独立定式
Sources (pinned): law 407M50000008016, revision 407M50000008016_20250401_507M60000008028.
Independent restatement: 大きい capital から順に 2000/1000/500 を選択。
-/

namespace JapanTaxLaw.UnevenTaxInvestmentThreshold

def specThreshold (c : Nat) : Nat :=
  if c > 5000 then 2000 else if c > 1000 then 1000 else 500

example : specThreshold 1001 = 1000 := by decide
example : specThreshold 5001 = 2000 := by decide

def agreeUnevenTaxInvestmentThreshold : Bool :=
  [0, 1000, 1001, 5000, 5001, 10000].all fun c => investmentThreshold c == specThreshold c

example : agreeUnevenTaxInvestmentThreshold = true := by decide

end JapanTaxLaw.UnevenTaxInvestmentThreshold

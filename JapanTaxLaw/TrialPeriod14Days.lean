import JapanTaxLaw.TaxFinance

/-!
# TrialPeriod14Days — 租税特別措置法施行規則 art. 21_17_3（試みの使用期間 十四日超）

Sources (pinned):

  Law id: 332M50000040015
  Revision: 332M50000040015_20261101_507M60000040026
  Raw snapshot: data/raw/332M50000040015_20261101_507M60000040026.law.json

Pinned 原文: 「試みの使用期間中の者（十四日を超えて引き続き使用されるに至つた者を除く。）」

Scoped claim: only the 試みの使用期間 十四日超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.TrialPeriod14Days

def trialLimit14 : Nat := 14

def exceedsTrial14 (x : Nat) : Bool :=
  decide (trialLimit14 < x)

theorem threshold_value : trialLimit14 = 14 := rfl

end JapanTaxLaw.TrialPeriod14Days

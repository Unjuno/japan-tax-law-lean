import JapanTaxLaw.TaxFinance

/-!
# MemberRatiosAtMost5 — 法人税法施行令 art.155の32（二つの割合がいずれも5%以下）
Sources (pinned): law `340CO0000000097` / rev `340CO0000000097_20261001_507CO0000000121`.
原文: 「当該構成員に係る前号イ及びロに掲げる割合のいずれもが百分の五以下であること。」
Computation: bothAtMost5(a,b) = a <= 5 && b <= 5（「以下」なので境界値 5 を含む）。
Scope: 構成員の判定・割合の算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.MemberRatiosAtMost5

def thresholdNum : Nat := 5

def bothAtMost5 (a b : Nat) : Bool :=
  a <= thresholdNum && b <= thresholdNum

example : bothAtMost5 5 5 = true := by decide
example : bothAtMost5 5 6 = false := by decide
example : bothAtMost5 6 5 = false := by decide

end JapanTaxLaw.MemberRatiosAtMost5

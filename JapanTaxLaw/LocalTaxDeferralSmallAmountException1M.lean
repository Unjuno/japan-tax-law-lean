import JapanTaxLaw.TaxFinance

/-!
# LocalTaxDeferralSmallAmountException1M — 地方税法 art.55の2 納税猶予 100万円例外（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「ただし、その猶予に係る税額が百万円以下である場合、…この限りでない。」
Computation（金額要件のみ、単位: 円）:
  isSmallAmount(tax) = tax <= 1000000  （「以下」は境界値を含む）
Scope / NOT MODELLED: 猶予期間三月以内・担保徴収不能の特別の事情・納税猶予の手続は
NOT MODELLED。本モデルは 100万円の金額要件のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxDeferralSmallAmountException1M

open JapanTaxLaw.TaxFinance

def smallAmountCeiling : Money := 1000000

def isSmallAmount (tax : Money) : Bool :=
  tax <= smallAmountCeiling

example : isSmallAmount 1000000 = true := by decide
example : isSmallAmount 1000001 = false := by decide

end JapanTaxLaw.LocalTaxDeferralSmallAmountException1M

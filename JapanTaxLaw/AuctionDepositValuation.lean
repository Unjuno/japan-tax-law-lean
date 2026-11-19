import JapanTaxLaw.TaxFinance

/-!
# AuctionDepositValuation — 国税徴収法施行令 art.42の5（公売保証金を徴しない財産の見積価額）bounded L4 モデル

Sources (pinned):
  Law id: 334CO0000000329
  Revision: 334CO0000000329_20260525_507CO0000000244
  Raw snapshot: data/raw/334CO0000000329_20260525_507CO0000000244.law.json
  Article Num 42_5, flat/normalized leaf text 74 chars, U+3000 count 0.

原文逐語:
  「法第百条第一項（公売保証金）に規定する政令で定める金額は、五十万円とする。」

Computation: 見積価額の閾値 = 500,000 円（定数）。

Scope: 五十万円の金額そのもののみ。法100条1項の公売保証金の具体的算定・
公売手続は NOT MODELLED。
-/

namespace JapanTaxLaw.AuctionDepositValuation

open JapanTaxLaw.TaxFinance

/-- 公売保証金を徴しないで公売できる財産の見積価額の閾値 = 五十万円。 -/
def threshold : Money := 500_000

example : threshold = 500_000 := by decide

end JapanTaxLaw.AuctionDepositValuation

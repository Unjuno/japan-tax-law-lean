import JapanTaxLaw.TaxFinance

/-!
# LocalTaxFixedAmountRounding — 地方税の確定金額の端数計算（地方税法 art.20の4の2 §3）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 20_4_2 §3, flat/normalized leaf text 1118 chars. Needles contain no U+3000.

原文逐語（第3項）:
  「地方税の確定金額に百円未満の端数があるとき、又はその全額が百円未満であるときは、
    その端数金額又はその全額を切り捨てる。」

Computation（原文逐語から導出、端数処理のみ、単位: 円）:
  roundDownToHundred(amount) = amount / 100 * 100（百円未満を切り捨て）

Scope / NOT MODELLED:
  - 第1項（課税標準額の千円未満切り捨て）・第2項（延滞金/加算金）は NOT MODELLED。
  - 「政令で定める地方税」の適用除外は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxFixedAmountRounding

open JapanTaxLaw.TaxFinance

/-- 確定金額を百円単位へ切り捨て。 -/
def roundDownToHundred (amount : Money) : Money := amount / 100 * 100

example : roundDownToHundred 0 = 0 := by decide
example : roundDownToHundred 99 = 0 := by decide
example : roundDownToHundred 100 = 100 := by decide
example : roundDownToHundred 12345 = 12300 := by decide

end JapanTaxLaw.LocalTaxFixedAmountRounding

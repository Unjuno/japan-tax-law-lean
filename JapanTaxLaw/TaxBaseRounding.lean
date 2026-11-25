import JapanTaxLaw.TaxFinance

/-!
# TaxBaseRounding — 地方税の課税標準額の端数計算（地方税法 art.20の4の2 §1）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 20_4_2 §1, flat/normalized leaf text 1118 chars. Needles contain no U+3000.

原文逐語（第1項）:
  「地方税の課税標準額を計算する場合において、その額に千円未満の端数があるとき、又は
    その全額が千円未満であるときは、その端数金額又はその全額を切り捨てる。
    ただし、政令で定める地方税については、この限りでない。」

Computation（原文逐語から導出、端数処理のみ、単位: 円）:
  roundDownToThousand(amount) = amount / 1000 * 1000（千円未満を切り捨て）

Scope / NOT MODELLED:
  - 第2項（延滞金/加算金）・第3項（確定金額の百円未満切捨て）は NOT MODELLED。
  - 「政令で定める地方税」の適用除外は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TaxBaseRounding

open JapanTaxLaw.TaxFinance

/-- 課税標準額を千円単位へ切り捨て。 -/
def roundDownToThousand (amount : Money) : Money := amount / 1000 * 1000

example : roundDownToThousand 0 = 0 := by decide
example : roundDownToThousand 999 = 0 := by decide
example : roundDownToThousand 1000 = 1000 := by decide
example : roundDownToThousand 123456 = 123000 := by decide

end JapanTaxLaw.TaxBaseRounding

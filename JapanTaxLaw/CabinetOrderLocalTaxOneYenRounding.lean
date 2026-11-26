import JapanTaxLaw.TaxFinance

/-!
# CabinetOrderLocalTaxOneYenRounding — 政令で定める地方税の確定金額 一円未満切捨て（地方税法 art.20の4の2 §3 ただし書）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 20_4_2 §3 proviso, flat/normalized leaf text 1118 chars. Needles contain no U+3000.

原文逐語（第3項ただし書）:
  「ただし、政令で定める地方税の確定金額については、その額に一円未満の端数があるとき、
    又はその全額が一円未満であるときは、その端数金額又はその全額を切り捨てる。」

Computation（原文逐語から導出、1円未満切捨ては整数円では恒等、単位: 円）:
  roundToYen(amountYen) = amountYen  （入力が既に整数円のため端数は存在しない＝恒等）

Scope / NOT MODELLED:
  - 「政令で定める地方税」の範囲・政令の内容は NOT MODELLED。
  - 第1項（千円）/第2項（延滞金）/第3項本文（百円）の端数処理は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.CabinetOrderLocalTaxOneYenRounding

open JapanTaxLaw.TaxFinance

/-- 整数円入力に対する 1 円未満切捨て（恒等対応）。 -/
def roundToYen (amountYen : Money) : Money := amountYen

example : roundToYen 0 = 0 := by decide
example : roundToYen 1 = 1 := by decide
example : roundToYen 12345 = 12345 := by decide

end JapanTaxLaw.CabinetOrderLocalTaxOneYenRounding

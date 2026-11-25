import JapanTaxLaw.TaxFinance

/-!
# ArrearsChargeRounding — 延滞金・加算金の計算基礎税額の端数処理（地方税法 art.20の4の2 §2）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 20_4_2 §2, flat/normalized leaf text 1118 chars. Needles contain no U+3000.

原文逐語（第2項）:
  「延滞金又は加算金の額を計算する場合において、その計算の基礎となる税額に千円未満の
    端数があるとき、又はその税額の全額が二千円未満であるときは、その端数金額又はその
    全額を切り捨てる。」

Computation（原文逐語から導出、計算基礎税額の丸めのみ、単位: 円）:
  baseTax(rounded) = if taxTotal < 2000 then 0 else taxTotal / 1000 * 1000
  （全額が2千円未満なら0、それ以外は千円未満切捨て）

Scope / NOT MODELLED:
  - 延滞金・加算金の税率・算定期間・第1項（課税標準額）・第3項（確定金額）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ArrearsChargeRounding

open JapanTaxLaw.TaxFinance

/-- 延滞金・加算金の計算基礎税額（2千円未満は0、それ以外は千円未満切捨て）。 -/
def baseTax (taxTotal : Money) : Money :=
  if taxTotal < 2000 then 0 else taxTotal / 1000 * 1000

example : baseTax 0 = 0 := by decide
example : baseTax 1999 = 0 := by decide
example : baseTax 2000 = 2000 := by decide
example : baseTax 12345 = 12000 := by decide

end JapanTaxLaw.ArrearsChargeRounding

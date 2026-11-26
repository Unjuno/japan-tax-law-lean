import JapanTaxLaw.TaxFinance

/-!
# LeaseholdLandShare — 地価税法 art.18(1) 底地の価額割合による三万円計算（bounded slice）

Sources (pinned):
  Law id: 403AC0000000069
  Revision: 403AC0000000069_20250601_504AC0000000068
  Raw snapshot: data/raw/403AC0000000069_20250601_504AC0000000068.law.json
  Normative id: NORM|37eab91bc7fd7bf723a2a42832bba7a8e61717b8deeaa709164fe08e767bc8c6
  Article Num 18, paragraph 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「借地権等が設定されている場合において、当該土地等が借地権等以外のもの（以下この号において「底地」という。）であるとき。　三万円に当該底地の価額が更地の価額のうちに占める割合を乗じて計算した金額」

Computation（単位: 円。入力は底地の価額と更地の価額）:
  shareAmount(baseLandValue, wholeLandValue) =
    if wholeLandValue = 0 then 0 else 30000 * baseLandValue / wholeLandValue

Scope / NOT MODELLED:
  - 借地権等の設定・底地の認定、価額の評価、端数処理の詳細は
    NOT MODELLED。
  - 本モデルは三万円に割合を乗じる計算スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.LeaseholdLandShare

/-- 底地価額が更地価額に占める割合を三万円に乗じた金額。 -/
def shareAmount (baseLandValue : Nat) (wholeLandValue : Nat) : Nat :=
  if wholeLandValue = 0 then 0 else 30000 * baseLandValue / wholeLandValue

example : shareAmount 0 100 = 0 := by decide
example : shareAmount 100 100 = 30000 := by decide
example : shareAmount 50 100 = 15000 := by decide
example : shareAmount 100 0 = 0 := by decide

end JapanTaxLaw.LeaseholdLandShare

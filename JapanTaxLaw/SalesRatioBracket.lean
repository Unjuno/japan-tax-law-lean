import JapanTaxLaw.TaxFinance

/-!
# SalesRatioBracket — 売上割合による区分（震災臨時特例法 art.29の3 §5 一）bounded L4 モデル

Sources (pinned):
  Law id: 423CO0000000112
  Revision: 423CO0000000112_20260401_508CO0000000102
  Raw snapshot: data/raw/423CO0000000112_20260401_508CO0000000102.law.json
  Article Num 29_3 §5 一, flat/normalized leaf text 9016 chars. Needles contain no U+3000.

原文逐語（第5項 一号 イ/ロ/ハ）:
  イ「売上割合の平均値が百分の百以上の場合 百分の八十」
  ロ「売上割合の平均値が百分の七十以上百分の百未満の場合 百分の四十」
  ハ「売上割合の平均値が百分の七十未満の場合 零」

Computation（原文逐語から導出、区分判定のみ、百分率は整数で表現）:
  bracket(ratioPercent) =
    if ratioPercent >= 100 then 80
    else if ratioPercent >= 70 then 40
    else 0

Scope / NOT MODELLED:
  - 売上割合の平均値の算定方法・基準日の数は NOT MODELLED。
  - 二以降の号（経営贈与承継期間等の判定）・適用場面は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.SalesRatioBracket

open JapanTaxLaw.TaxFinance

/-- 売上割合（百分率整数）による区分。 -/
def bracket (ratioPercent : Nat) : Nat :=
  if ratioPercent >= 100 then 80
  else if ratioPercent >= 70 then 40
  else 0

example : bracket 100 = 80 := by decide
example : bracket 150 = 80 := by decide
example : bracket 99 = 40 := by decide
example : bracket 70 = 40 := by decide
example : bracket 69 = 0 := by decide

end JapanTaxLaw.SalesRatioBracket

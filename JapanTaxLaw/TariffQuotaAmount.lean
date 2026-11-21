import JapanTaxLaw.TaxFinance

/-!
# TariffQuotaAmount — 関税割当数量（省令 art.5）bounded L4 モデル

Sources (pinned):
  Law id: 417M60000200012
  Revision: 417M60000200012_20260401_507M60000200056
  Raw snapshot: data/raw/417M60000200012_20260401_507M60000200056.law.json
  Article Num 5, flat/normalized leaf text 87 chars, U+3000 count 0.

原文逐語:
  「…農林水産省令で定める数量は、令和八年四月一日から令和九年三月三十一日までの
   間は八千トンとする。」

Computation（原文逐語から導出、数量定数のみ）:
  quotaTons = 8,000（八千トン）
  適用期間: 令和8年4月1日〜令和9年3月31日（ denominated は年号文字列として保持）

Scope / NOT MODELLED:
  - 割当の申請・配分手続、品目の特定は NOT MODELLED。
  - 年号→西暦の換算・日付算術は NOT MODELLED（期間は原文文字列を定数として保持）。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TariffQuotaAmount

open JapanTaxLaw.TaxFinance

/-- 関税割当数量 = 8000 トン。 -/
def quotaTons : Money := 8_000

example : quotaTons = 8_000 := by decide

end JapanTaxLaw.TariffQuotaAmount

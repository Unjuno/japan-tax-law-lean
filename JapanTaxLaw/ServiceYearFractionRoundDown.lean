import JapanTaxLaw.TaxFinance

/-!
# ServiceYearFractionRoundDown — 勤続年数の一年未満端数切り捨て（沖縄復帰特別措置省令 art.52 §3）bounded L4 モデル

Sources (pinned):
  Law id: 347M50000040042
  Revision: 347M50000040042_20251231_507M60000040072
  Raw snapshot: data/raw/347M50000040042_20251231_507M60000040072.law.json
  Article Num 52 §3, flat/normalized leaf text 422 chars. Needles contain no U+3000.

原文逐語（第3項）:
  「前二項の規定により計算した勤続年数に一年未満の端数がある場合には、その端数は切り捨てる。」

Computation（原文逐語から導出、端数処理のみ）:
  勤続年数を月単位で表すと、一年未満の端数 = 12 未満の月数。
  roundDownToYear(months) = months / 12（年の単位へ切捨て、余りは捨てる）

Scope / NOT MODELLED:
  - 第1項・第2項の勤続年数の計算方法・月数の算定は NOT MODELLED。
  - 「一月未満の端数」の取扱い（第2項）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ServiceYearFractionRoundDown

open JapanTaxLaw.TaxFinance

/-- 月数を年単位へ切り捨て（一年未満の端数を捨てる）。 -/
def roundDownToYear (months : Nat) : Nat := months / 12

example : roundDownToYear 0 = 0 := by decide
example : roundDownToYear 11 = 0 := by decide -- 11ヶ月 → 0年
example : roundDownToYear 12 = 1 := by decide -- 1年
example : roundDownToYear 23 = 1 := by decide -- 1年11ヶ月 → 1年
example : roundDownToYear 24 = 2 := by decide

end JapanTaxLaw.ServiceYearFractionRoundDown

import JapanTaxLaw.TaxFinance

/-!
# PeriodEndDayException — 期間の末日の特例（政令 art.21の2）bounded L4 モデル

Sources (pinned):
  Law id: 329CO0000000051
  Revision: 329CO0000000051_20260401_508CO0000000085
  Raw snapshot: data/raw/329CO0000000051_20260401_508CO0000000085.law.json
  Article Num 21_2, flat/normalized leaf text 46 chars, U+3000 count 0.

原文逐語:
  「法第十四条第一項に規定する政令で定める日は、土曜日とする。」

Computation（原文逐語から導出、曜日定数のみ）:
  政令で定める日 = 土曜日（Saturday）
  曜日を列挙型 Nat で表現: 月=0,火=1,水=2,木=3,金=4,土=5,日=6
  saturday = 5

Scope / NOT MODELLED:
  - 法14条1項の期間・末日算術、他の特例（日曜・休日等）は NOT MODELLED。
  - 本スライスは「政令で定める日 = 土曜日」の曜日定数のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PeriodEndDayException

open JapanTaxLaw.TaxFinance

/-- 土曜日 = 5（月=0..日=6 の列挙）。 -/
def saturday : Nat := 5

example : saturday = 5 := by decide

end JapanTaxLaw.PeriodEndDayException

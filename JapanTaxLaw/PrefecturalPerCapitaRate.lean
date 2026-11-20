import JapanTaxLaw.TaxFinance

/-!
# 地方税法 art.38(1) 道府県民税 個人の均等割の標準税率 — bounded L4 model

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, unit NORM|9090b882bace49ea0dbb6a5727ff30fdf0fee04c11a037c87261bd947462e9ce.
原文逐語: 「個人の均等割の標準税率は、千円とする。」
Unit: Money (Nat, 円) / 円/人. Scope: 税率定数のみ.
数量の算定・軽減・申告・徴収・附則は NOT MODELLED.
Human legal review remains pending.
-/

namespace JapanTaxLaw.PrefecturalPerCapitaRate

open JapanTaxLaw.TaxFinance

/-- 原文「千円」 = 1000. -/
def prefecturalPerCapitaRate : Money := 1000

theorem prefecturalPerCapitaRate_value : prefecturalPerCapitaRate = 1000 := by decide
theorem prefecturalPerCapitaRate_pos : 0 < prefecturalPerCapitaRate := by decide
theorem prefecturalPerCapitaRate_not_scaled : prefecturalPerCapitaRate ≠ 100 := by decide

example : prefecturalPerCapitaRate = 1000 := by decide
example : 0 < prefecturalPerCapitaRate := by decide

end JapanTaxLaw.PrefecturalPerCapitaRate

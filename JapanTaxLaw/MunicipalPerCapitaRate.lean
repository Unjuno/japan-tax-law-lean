import JapanTaxLaw.TaxFinance

/-!
# 地方税法 art.310(1) 市町村民税 個人の均等割の標準税率 — bounded L4 model

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, unit NORM|6c043582d2da5058b6951c3490ea577d84a5afd9b21669f9a8c4c5d579a77f5e.
原文逐語: 「個人の均等割の標準税率は、三千円とする。」
Unit: Money (Nat, 円) / 円/人. Scope: 税率定数のみ.
数量の算定・軽減・申告・徴収・附則は NOT MODELLED.
Human legal review remains pending.
-/

namespace JapanTaxLaw.MunicipalPerCapitaRate

open JapanTaxLaw.TaxFinance

/-- 原文「三千円」 = 3000. -/
def municipalPerCapitaRate : Money := 3000

theorem municipalPerCapitaRate_value : municipalPerCapitaRate = 3000 := by decide
theorem municipalPerCapitaRate_pos : 0 < municipalPerCapitaRate := by decide
theorem municipalPerCapitaRate_not_scaled : municipalPerCapitaRate ≠ 300 := by decide

example : municipalPerCapitaRate = 3000 := by decide
example : 0 < municipalPerCapitaRate := by decide

end JapanTaxLaw.MunicipalPerCapitaRate

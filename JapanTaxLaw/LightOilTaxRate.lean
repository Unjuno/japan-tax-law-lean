import JapanTaxLaw.TaxFinance

/-!
# 地方税法 art.144の10(1) 軽油引取税の税率 — bounded L4 model

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, unit NORM|1f1e4ed103a791c1b9d4b42f6e04fe784e392a84286e09d3396eba710c8773e2.
原文逐語: 「軽油引取税の税率は、一キロリットルにつき、一万五千円とする。」
Unit: Money (Nat, 円) / 円/kL. Scope: 税率定数のみ.
数量の算定・軽減・申告・徴収・附則は NOT MODELLED.
Human legal review remains pending.
-/

namespace JapanTaxLaw.LightOilTaxRate

open JapanTaxLaw.TaxFinance

/-- 原文「一万五千円」 = 15000. -/
def lightOilTaxRate : Money := 15000

theorem lightOilTaxRate_value : lightOilTaxRate = 15000 := by decide
theorem lightOilTaxRate_pos : 0 < lightOilTaxRate := by decide
theorem lightOilTaxRate_not_scaled : lightOilTaxRate ≠ 1500 := by decide

example : lightOilTaxRate = 15000 := by decide
example : 0 < lightOilTaxRate := by decide

end JapanTaxLaw.LightOilTaxRate

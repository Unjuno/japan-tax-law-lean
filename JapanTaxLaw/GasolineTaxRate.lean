import JapanTaxLaw.TaxFinance

/-!
# GasolineTaxRate — 揮発油税法 art.9（税率）bounded L4 モデル

Pinned:
  law 332AC0000000055, revision 332AC0000000055_20260525_506AC0000000052
  unit NORM|8bf684764da81b921477924a5e17db0d25d2ddfae535431c99302894578f927c
  原文: 「揮発油税の税率は、揮発油一キロリットルにつき二万四千三百円とする。」

Variable: volume : Nat (キロリットル, caller-established).
Unit: Money (Nat, 円) / キロリットル.
Scope: 税率定数のみ。数量・軽減・申告・徴収は NOT MODELLED。
Human legal review remains pending.
-/

namespace JapanTaxLaw.GasolineTaxRate

open JapanTaxLaw.TaxFinance

/-- art.9(1): 揮発油一キロリットルにつき二万四千三百円。 -/
def gasolineTaxRate : Money := 24_300

theorem gasolineTaxRate_value : gasolineTaxRate = 24_300 := by decide
theorem gasolineTaxRate_pos : 0 < gasolineTaxRate := by decide
theorem gasolineTaxRate_not_scaled : gasolineTaxRate ≠ 2_430 ∧ gasolineTaxRate ≠ 243_000 := by decide

example : gasolineTaxRate = 24_300 := by decide
example : 0 < gasolineTaxRate := by decide
example : gasolineTaxRate ≠ 2_430 := by decide

end JapanTaxLaw.GasolineTaxRate

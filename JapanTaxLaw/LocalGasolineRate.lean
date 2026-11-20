import JapanTaxLaw.TaxFinance

/-!
# LocalGasolineRate — 地方揮発油税法 art.4（税率）bounded L4 モデル

Pinned:
  law 330AC0000000104, revision 330AC0000000104_20260401_508AC0000000012
  unit NORM|7eb549f9aeb97856ee098142bf07352e2d9dd52855e9afdd5db3e8c5236a64f8
  原文: 「地方揮発油税の税率は、揮発油一キロリットルにつき四千四百円とする。」

Variable: volume : Nat (キロリットル, caller-established).
Unit: Money (Nat, 円) / キロリットル.
Scope: 税率定数のみ。数量の算定・軽減・申告・徴収は NOT MODELLED。
Human legal review remains pending.
-/

namespace JapanTaxLaw.LocalGasolineRate

open JapanTaxLaw.TaxFinance

/-- art.4(1): 揮発油一キロリットルにつき四千四百円。 -/
def localGasolineRate : Money := 4_400

theorem localGasolineRate_value : localGasolineRate = 4_400 := by decide
theorem localGasolineRate_pos : 0 < localGasolineRate := by decide
theorem localGasolineRate_not_scaled : localGasolineRate ≠ 440 ∧ localGasolineRate ≠ 44_000 := by decide

example : localGasolineRate = 4_400 := by decide
example : 0 < localGasolineRate := by decide
example : localGasolineRate ≠ 440 := by decide

end JapanTaxLaw.LocalGasolineRate

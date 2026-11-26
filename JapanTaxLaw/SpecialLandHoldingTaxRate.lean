import JapanTaxLaw.TaxFinance

/-!
# SpecialLandHoldingTaxRate — 地方税法 第五百九十四条（特別土地保有税の税率）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Enforcement: 2026-11-01
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

担当範囲原文（pinned JSON の正規化テキストから転記、U+3000 なし）:

  （特別土地保有税の税率）第五百九十四条特別土地保有税の税率は、土地に対して課する特別土地保有税にあつては百分の一・四、土地の取得に対して課する特別土地保有税にあつては百分の三とする。

Pinned needle（doc-comment のみ）:

  「特別土地保有税の税率は、土地に対して課する特別土地保有税にあつては百分の一・四、土地の取得に対して課する特別土地保有税にあつては百分の三とする。」

Modelled（明示された算術のみ）:

  * 土地に対して課する特別土地保有税: 百分の一・四 = 14/1000 = 1.4%
  * 土地の取得に対して課する特別土地保有税: 百分の三 = 3/100
  * 税額 = 課税標準 × 利率（TaxRate.applyFloor、切り捨て）

Scope & boundaries:

  * 課税標準・課税価格・該当性・免除・附則は caller-established / NOT MODELLED。
  * 小数点率 1.4% を 14/1000 として整数比で符号化（10倍過大の 14/100 を避ける）。
  * 原文に端数規定の明示がないため、Nat 除算の切り捨てをモデル規約とする。
  * 本レビューは fidelity-only であり法的正しさを保証しない。
  * No sorry / admit / axiom / Classical.choice. All arithmetic is total Nat.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 土地に対して課する特別土地保有税の税率: 百分の一・四 = 14/1000。 -/
def specialLandHoldingLandRate : TaxRate := ⟨14, 1000, by decide⟩

/-- 土地の取得に対して課する特別土地保有税の税率: 百分の三 = 3/100。 -/
def specialLandHoldingAcquisitionRate : TaxRate := ⟨3, 100, by decide⟩

/-- 土地に対して課する特別土地保有税額 = 課税標準 × 14/1000（切り捨て）。 -/
def specialLandHoldingLandTax (taxBase : Money) : Money :=
  specialLandHoldingLandRate.applyFloor taxBase

/-- 土地の取得に対して課する特別土地保有税額 = 課税標準 × 3/100（切り捨て）。 -/
def specialLandHoldingAcquisitionTax (taxBase : Money) : Money :=
  specialLandHoldingAcquisitionRate.applyFloor taxBase

theorem land_rate_num : specialLandHoldingLandRate.num = 14 := rfl
theorem land_rate_den : specialLandHoldingLandRate.den = 1000 := rfl
theorem acquisition_rate_num : specialLandHoldingAcquisitionRate.num = 3 := rfl
theorem acquisition_rate_den : specialLandHoldingAcquisitionRate.den = 100 := rfl

theorem land_tax_zero : specialLandHoldingLandTax 0 = 0 := by decide
theorem acquisition_tax_zero : specialLandHoldingAcquisitionTax 0 = 0 := by decide

theorem land_tax_1m : specialLandHoldingLandTax 1_000_000 = 14_000 := by decide
theorem acquisition_tax_1m : specialLandHoldingAcquisitionTax 1_000_000 = 30_000 := by decide

/-- 1.4% は 14/100 ではない（10倍誤りの反例）。 -/
theorem no_tenfold_error : specialLandHoldingLandTax 1_000_000 ≠ 140_000 := by decide

theorem land_tax_eq (base : Money) : specialLandHoldingLandTax base = base * 14 / 1000 := rfl
theorem acquisition_tax_eq (base : Money) : specialLandHoldingAcquisitionTax base = base * 3 / 100 := rfl

theorem land_tax_mono {a a' : Money} (h : a ≤ a') :
    specialLandHoldingLandTax a ≤ specialLandHoldingLandTax a' := by
  change a * 14 / 1000 ≤ a' * 14 / 1000
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 14 h)

theorem acquisition_tax_mono {a a' : Money} (h : a ≤ a') :
    specialLandHoldingAcquisitionTax a ≤ specialLandHoldingAcquisitionTax a' := by
  change a * 3 / 100 ≤ a' * 3 / 100
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 3 h)

/-- 主要分岐の到達可能性: 両税率とも正の税額を生み得る。 -/
theorem both_rates_positive :
    specialLandHoldingLandTax 1000 > 0 ∧ specialLandHoldingAcquisitionTax 1000 > 0 := by
  decide

end JapanTaxLaw

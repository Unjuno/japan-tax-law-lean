import JapanTaxLaw.TaxFinance

/-!
# InheritanceMiscRates — 相続税法 art. 21の十三 / art. 26 / art. 17 の L4 計算スライス

Source (pinned, verbatim normalized bytes):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Text: W_A_inheritance.txt (normalized snapshot of the three articles below)

本モジュールがモデル化する明確な計算規則のみを扱う（3 本）:

  * 第21条の十三（相続時精算課税に係る贈与税の税率）
      「…控除後の贈与税の課税価格…にそれぞれ百分の二十の税率を乗じて計算した金額とする。」
      → 税額 = 控除後課税価格 × 20/100（`TaxRate.applyFloor`、端数切り捨て）。
  * 第26条（立木の評価）
      「…立木の時価に百分の八十五の割合を乗じて算出した金額による。」
      → 立木価額 = 時価 × 85/100（`TaxRate.applyFloor`、端数切り捨て）。
  * 第17条（各相続人等の相続税額）
      「…相続税の総額に…課税価格が…課税価格の合計額のうちに占める割合を乗じて算出した金額とする。」
      → 相続税額 = 総額 × 割合（割合は caller-established `TaxRate`、端数切り捨て）。

Scope & honest boundaries（doc-comment のみ、定理はモデルの性質のみを主張）:

  * 適用判定（相続時精算課税適用者・特定贈与者・包括遺贈等の該当性）は caller-established。
    本モジュールは判定を行わず、Bool を計算式に入れない。
  * 控除後課税価格（第21条の十一の二第一項／前条第一項の控除後金額）、
    立木の時価、相続税の総額、各相続人の課税価格・合計課税価格はすべて caller-established `Money`。
  * 第17条の割合は caller が `⟨課税価格, 合計課税価格, 正性証明⟩ : TaxRate` として渡す。
    分母の正性証明が「合計課税価格 ≠ 0」を担保するため、ゼロ除算分岐（`if`）を式に入れない。
    （既存 `InheritanceApportionment.heirApportionedTax` は `if totalTaxable = 0` 表現の別表現。）
  * 端数は切り捨て（`TaxRate.applyFloor`）。政令の丸め細目・申告手続は射程外。
  * 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。
    L4 のごく小さなスライスであり、完成・網羅を主張しない。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- ==== 第21条の十三: 百分の二十 ====

/-- art. 21の十三 — 税率「百分の二十」を 20/100 として保持する。 -/
def inheritanceSettlementGiftTaxRate : TaxRate := ⟨20, 100, by decide⟩

/-- art. 21の十三 — 相続時精算課税に係る贈与税額
    = 控除後課税価格 × 20/100（切り捨て）。控除後課税価格は caller-established。 -/
def inheritanceSettlementGiftTax (taxableAfterDeduction : Money) : Money :=
  inheritanceSettlementGiftTaxRate.applyFloor taxableAfterDeduction

-- ==== 第26条: 百分の八十五 ====

/-- art. 26 — 割合「百分の八十五」を 85/100 として保持する。 -/
def standingTimberRate : TaxRate := ⟨85, 100, by decide⟩

/-- art. 26 — 立木の価額 = 取得時の立木の時価 × 85/100（切り捨て）。
    時価は caller-established。 -/
def standingTimberValue (marketValue : Money) : Money :=
  standingTimberRate.applyFloor marketValue

-- ==== 第17条: 総額 × 割合 ====

/-- art. 17 — 各相続人等の相続税額 = 相続税の総額 × 割合（切り捨て）。
    `heirRatio` は「当該者の課税価格 / 全員の課税価格の合計額」を表す caller-established `TaxRate`。
    分母の正性は `TaxRate.den_pos` が担うため、ゼロ除算分岐を式に入れない。 -/
def heirInheritanceTax (totalTax : Money) (heirRatio : TaxRate) : Money :=
  heirRatio.applyFloor totalTax

-- ==== verified facts（モデルの性質のみ） ====

theorem inheritanceSettlementGiftTax_eq (m : Money) :
    inheritanceSettlementGiftTax m = m * 20 / 100 := rfl

theorem standingTimberValue_eq (m : Money) :
    standingTimberValue m = m * 85 / 100 := rfl

theorem heirInheritanceTax_eq (m : Money) (r : TaxRate) :
    heirInheritanceTax m r = m * r.num / r.den := rfl

theorem inheritanceSettlementGiftTax_zero : inheritanceSettlementGiftTax 0 = 0 := by decide
theorem standingTimberValue_zero : standingTimberValue 0 = 0 := by decide
theorem heirInheritanceTax_zero (r : TaxRate) : heirInheritanceTax 0 r = 0 := by
  rw [heirInheritanceTax_eq]
  simp

/-- 各計算は課税価格／時価／総額について単調（端数切り捨ての下でも成立）。 -/
theorem inheritanceSettlementGiftTax_mono {a b : Money} (h : a ≤ b) :
    inheritanceSettlementGiftTax a ≤ inheritanceSettlementGiftTax b := by
  rw [inheritanceSettlementGiftTax_eq, inheritanceSettlementGiftTax_eq]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 20 h)

theorem standingTimberValue_mono {a b : Money} (h : a ≤ b) :
    standingTimberValue a ≤ standingTimberValue b := by
  rw [standingTimberValue_eq, standingTimberValue_eq]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 85 h)

theorem heirInheritanceTax_mono (r : TaxRate) {a b : Money} (h : a ≤ b) :
    heirInheritanceTax a r ≤ heirInheritanceTax b r := by
  rw [heirInheritanceTax_eq, heirInheritanceTax_eq]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right r.num h)

-- ==== kernel-decided smoke checks ====

example : inheritanceSettlementGiftTax 1_000_000 = 200_000 := by decide
example : inheritanceSettlementGiftTax 101 = 20 := by decide
example : standingTimberValue 1_000_000 = 850_000 := by decide
example : standingTimberValue 1_000 = 850 := by decide

def heirRatioQuarter : TaxRate := ⟨1, 4, by decide⟩  -- 1/4 = 25%
example : heirInheritanceTax 1_000_000 heirRatioQuarter = 250_000 := by decide

end JapanTaxLaw

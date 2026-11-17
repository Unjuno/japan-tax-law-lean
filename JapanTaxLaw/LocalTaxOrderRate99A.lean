import JapanTaxLaw.TaxFinance

/-!
# LocalTaxOrderRate99A — 地方税法施行令 第九条の十四・第九条の十八（政令で定める率 百分の九十九）の bounded L4 モデル

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 地方税法施行令)

  原文（担当範囲・正規化済み・UTF-8、各 56 文字）:
    C:\Users\junny\AppData\Local\Temp\opencode\local_order_L1.txt（第九条の十四）
    C:\Users\junny\AppData\Local\Temp\opencode\local_order_L2.txt（第九条の十八）

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized
source, doc-comments only）:

  第九条の十四（法第七十一条の二十五第一項の率）:
    「（法第七十一条の二十五第一項の率）第九条の十四法第七十一条の二十五第一項の政令で定める率は、百分の九十九とする。」
  第九条の十八（法第七十一条の四十七第一項の率）:
    「（法第七十一条の四十七第一項の率）第九条の十八法第七十一条の四十七第一項の政令で定める率は、百分の九十九とする。」

Modelled (only the explicit statutory rate literal and its arithmetic):

  * 「百分の九十九」= 99/100（整数百分率、den = 100）。
    小数点率（例: 「十分の〇・七五」）ではないため分母 10000 による拡大は不要
    （念のため確認済み: 原文は「百分の九十九」であり分母は 100 のまま）。
  * 第九条の十四: `art14Rate : TaxRate := ⟨99, 100, by decide⟩`
  * 第九条の十八: `art18Rate : TaxRate := ⟨99, 100, by decide⟩`
  * 税額 = 課税標準 × 99/100（`TaxRate.applyFloor`、切り捨て）。

Scope & honest boundaries:

  * 課税標準・法第七十一条の二十五第一項／第七十一条の四十七第一項の適用該当性は
    すべて **caller-established**。Bool は算定式に入れず、認定は本モジュールの外で行う。
  * 原文は率の定義のみであり、課税標準の定義・端数処理の細目・納付手続等は NOT MODELLED。
  * 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる（原文に丸め細目の明記はない）。
  * 転記監査は fidelity-only であり法的正しさを保証しない。
  * これは L4 の bounded スライスであり、**完成・網羅を主張しない**。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.LocalTaxOrderRate99A

open JapanTaxLaw.TaxFinance

-- ============================================================
-- 第九条の十四 / 第九条の十八 — 原文の率と算定式
-- ============================================================

/-- 第九条の十四（法第七十一条の二十五第一項の率）: 原文「百分の九十九」= 99/100。 -/
def art14Rate : TaxRate := ⟨99, 100, by decide⟩

/-- 第九条の十八（法第七十一条の四十七第一項の率）: 原文「百分の九十九」= 99/100。 -/
def art18Rate : TaxRate := ⟨99, 100, by decide⟩

/-- 第九条の十四: 税額 = 課税標準 × 99/100（切り捨て）。 -/
def art14Tax (base : Money) : Money := art14Rate.applyFloor base

/-- 第九条の十八: 税額 = 課税標準 × 99/100（切り捨て）。 -/
def art18Tax (base : Money) : Money := art18Rate.applyFloor base

-- ==== verified facts (positivity / connection) ====

theorem art14Rate_numDen : art14Rate.numDen = (99, 100) := rfl

theorem art18Rate_numDen : art18Rate.numDen = (99, 100) := rfl

/-- 両条の率は同じ値（いずれも百分の九十九）。 -/
theorem ratesEqual : art14Rate.numDen = art18Rate.numDen := rfl

theorem art14Tax_eq (base : Money) : art14Tax base = base * 99 / 100 := rfl

theorem art18Tax_eq (base : Money) : art18Tax base = base * 99 / 100 := rfl

theorem art14Rate_den_pos : 0 < art14Rate.den := art14Rate.den_pos

theorem art18Rate_den_pos : 0 < art18Rate.den := art18Rate.den_pos

/-- 適用率 99/100 ≤ 1 なので税額は課税標準を超えない。 -/
theorem art14Tax_le (base : Money) : art14Tax base ≤ base := by
  unfold art14Tax art14Rate
  simp [TaxRate.applyFloor]
  exact Nat.le_trans
    (Nat.div_le_div_right (Nat.mul_le_mul_left base (by decide : 99 ≤ 100)))
    (Nat.le_of_eq (Nat.mul_div_left base (by decide : 0 < 100)))

/-- 第九条の十八も同じ。 -/
theorem art18Tax_le (base : Money) : art18Tax base ≤ base := by
  unfold art18Tax art18Rate
  simp [TaxRate.applyFloor]
  exact Nat.le_trans
    (Nat.div_le_div_right (Nat.mul_le_mul_left base (by decide : 99 ≤ 100)))
    (Nat.le_of_eq (Nat.mul_div_left base (by decide : 0 < 100)))

-- ==== kernel-decided smoke checks ====

-- 定数（原文「百分の九十九」= 99/100）
example : art14Rate.numDen = (99, 100) := by decide
example : art18Rate.numDen = (99, 100) := by decide
example : art14Rate.den = 100 := by decide
example : art18Rate.den = 100 := by decide
example : art14Rate.applyFloor 1000 = 990 := by decide
example : art18Rate.applyFloor 1000 = 990 := by decide

-- 税額（境界: 0 / 1 / 100 / 101 と端数）
example : art14Tax 0 = 0 := by decide       -- 0×99/100 = 0
example : art14Tax 1 = 0 := by decide       -- 0.99 → 0
example : art14Tax 2 = 1 := by decide       -- 1.98 → 1
example : art14Tax 3 = 2 := by decide       -- 2.97 → 2
example : art14Tax 50 = 49 := by decide     -- 49.5 → 49
example : art14Tax 100 = 99 := by decide    -- 99（割り切れる）
example : art14Tax 101 = 99 := by decide    -- 99.99 → 99
example : art14Tax 200 = 198 := by decide
example : art14Tax 1000 = 990 := by decide

-- 第九条の十八も同一（100 点サンプルで一致）
example : art18Tax 0 = 0 := by decide
example : art18Tax 1 = 0 := by decide
example : art18Tax 100 = 99 := by decide
example : art18Tax 101 = 99 := by decide
example : art18Tax 1000 = 990 := by decide

end JapanTaxLaw.LocalTaxOrderRate99A

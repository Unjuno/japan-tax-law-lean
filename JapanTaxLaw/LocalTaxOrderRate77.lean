import JapanTaxLaw.TaxFinance

/-!
# LocalTaxOrderRate77 — 地方税法施行令 第九条の二十二（百分の九十九）・第三十五条の四の五（百分の七・七）の bounded L4 モデル

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 地方税法施行令)

  原文（担当範囲・正規化済み・UTF-8）: local_order_L3.txt（第九条の二十二、57 文字）
  および local_order_L4.txt（第三十五条の四の五、53 文字）。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only）:

  art. 9の22（法第七十一条の六十七第一項の率）
    「（法第七十一条の六十七第一項の率）第九条の二十二法第七十一条の六十七第一項の政令で定める率は、百分の九十九とする。」

  art. 35の4の5（法第七十二条の七十六の率）
    「（法第七十二条の七十六の率）第三十五条の四の五法第七十二条の七十六の政令で定める率は、百分の七・七とする。」

Modelled (only the explicit statutory arithmetic):

  * 第九条の二十二「百分の九十九」= 99% = **99/100**（型 `art9_22Rate`）。
  * 第三十五条の四の五「百分の七・七」= 7.7% = **77/1000**（型 `art35_4_5Rate`）。
    十進「七・七」を Nat 分数に直す: 七・七 = 7 + 7/10 = 77/10、
    百分の七・七 = (77/10)/100 = 77/1000。
    ⚠ **10 倍過大バグに注意**: 770/1000 (= 77%) ではない。smoke で base = 1000 → 77 を確認する。
  * 各税額 = 課税標準 × num/den（`TaxRate.applyFloor`、切り捨て）。
    型 `art9_22Tax` / `art35_4_5Tax`。

Scope & honest boundaries:

  * 課税標準、法第七十一条の六十七第一項・法第七十二条の七十六の適用該当性は
    **caller-established**。Bool は算定式に入れず、認定は本モジュールの外で行う。
  * 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文に割合適用後の丸め細目の
    明記はなく、他モジュールと同じ慣例を採用したことを明示する。
  * 転記監査は fidelity-only であり法的正しさを保証しない。
  * これは L4 の bounded スライスであり、**完成・網羅を主張しない**。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.LocalTaxOrderRate77

open JapanTaxLaw.TaxFinance

-- ============================================================
-- 第九条の二十二 / 第三十五条の四の五 — 原文の定数と算定式
-- ============================================================

/-- 第九条の二十二: 原文「百分の九十九」= 99/100。 -/
def art9_22Rate : TaxRate := ⟨99, 100, by decide⟩

/-- 第三十五条の四の五: 原文「百分の七・七」= 七・七/100 = 77/1000。
    770/1000（10 倍過大）ではない。 -/
def art35_4_5Rate : TaxRate := ⟨77, 1000, by decide⟩

/-- 第九条の二十二: 税額 = 課税標準 × 99/100（切り捨て）。課税標準は caller-established。 -/
def art9_22Tax (base : Money) : Money :=
  art9_22Rate.applyFloor base

/-- 第三十五条の四の五: 税額 = 課税標準 × 77/1000（切り捨て）。課税標準は caller-established。 -/
def art35_4_5Tax (base : Money) : Money :=
  art35_4_5Rate.applyFloor base

-- ==== verified facts (numDen / positivity / connection) ====

theorem art9_22Rate_numDen : art9_22Rate.numDen = (99, 100) := rfl

theorem art35_4_5Rate_numDen : art35_4_5Rate.numDen = (77, 1000) := rfl

theorem art9_22Rate_den_pos : 0 < art9_22Rate.den := by decide

theorem art35_4_5Rate_den_pos : 0 < art35_4_5Rate.den := by decide

theorem art9_22Tax_eq (base : Money) : art9_22Tax base = base * 99 / 100 := rfl

theorem art35_4_5Tax_eq (base : Money) : art35_4_5Tax base = base * 77 / 1000 := rfl

/-- 第九条の二十二: 税額は caller-established な課税標準について単調。 -/
theorem art9_22Tax_mono {a b : Money} (h : a ≤ b) :
    art9_22Tax a ≤ art9_22Tax b := by
  simp [art9_22Tax, art9_22Rate, TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 99 h)

/-- 第三十五条の四の五: 税額は caller-established な課税標準について単調。 -/
theorem art35_4_5Tax_mono {a b : Money} (h : a ≤ b) :
    art35_4_5Tax a ≤ art35_4_5Tax b := by
  simp [art35_4_5Tax, art35_4_5Rate, TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 77 h)

-- ==== kernel-decided smoke checks ====

-- 定数（99/100 と 77/1000、10 倍過大バグ防止）
example : art9_22Rate.numDen = (99, 100) := by decide
example : art35_4_5Rate.numDen = (77, 1000) := by decide
example : art9_22Rate.applyFloor 1000 = 990 := by decide
example : art35_4_5Rate.applyFloor 1000 = 77 := by decide  -- 770 ではない

-- 第九条の二十二（99%）: 0 / 1 / 100 / 1000 / 端数
example : art9_22Tax 0 = 0 := by decide
example : art9_22Tax 1 = 0 := by decide
example : art9_22Tax 100 = 99 := by decide
example : art9_22Tax 101 = 99 := by decide
example : art9_22Tax 999 = 989 := by decide
example : art9_22Tax 1000 = 990 := by decide
example : art9_22Tax 10_000 = 9_900 := by decide

-- 第三十五条の四の五（7.7% = 77/1000）: 0 / 1 / 1000 / 端数
example : art35_4_5Tax 0 = 0 := by decide
example : art35_4_5Tax 1 = 0 := by decide
example : art35_4_5Tax 12 = 0 := by decide
example : art35_4_5Tax 13 = 1 := by decide
example : art35_4_5Tax 999 = 76 := by decide
example : art35_4_5Tax 1000 = 77 := by decide  -- ⚠ 10 倍過大なら 770 になる
example : art35_4_5Tax 2000 = 154 := by decide
example : art35_4_5Tax 10_000 = 770 := by decide

end JapanTaxLaw.LocalTaxOrderRate77

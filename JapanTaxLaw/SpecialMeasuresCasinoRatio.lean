import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresCasinoRatio — 租税特別措置法施行令 第四十六条の四（カジノ業務収入の割合）の bounded L4 モデル

Sources (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 租税特別措置法施行令)

原文（担当範囲・正規化済み・UTF-8）: W_I_special_order.txt（1 条文・252 文字）。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only）:

  art. 46の4（カジノ業務収入の割合が僅少である場合）
    「（カジノ業務収入の割合が僅少である場合）第四十六条の四法第八十六条の六第一項ただし書に規定する政令で定める場合は、当該課税期間における資産の譲渡等」
    「の対価の額（消費税法第二十八条第一項に規定する対価の額をいう。）の合計額に当該課税期間におけるカジノ業務収入」
    「（法第八十六条の六第一項ただし書に規定するカジノ業務収入をいう。以下この条において同じ。）の合計額を加算した金額のうちに」
    「の合計額を加算した金額のうちに当該カジノ業務収入の合計額の占める割合が百分の五を超えない場合とする。」

Modelled (only the explicit statutory arithmetic):

  * 原文の「合計額」（割合の分母に当たる「…の合計額に…カジノ業務収入の合計額を加算した金額」）は
    `totalConsideration + casinoIncome` である。すなわち
      - `totalConsideration` = 「資産の譲渡等の対価の額…の合計額」
      - `casinoIncome`       = 「カジノ業務収入の合計額」
      - 分母の「合計額」     = `totalConsideration + casinoIncome`（両者を加算した金額）
  * 「当該カジノ業務収入の合計額の占める割合が百分の五を超えない場合」を
    交差掛け（分母を掛けて除算を避ける）で判定する:
      `casinoIncome × 100 ≤ 5 × (totalConsideration + casinoIncome)`
    すなわち `casinoIncome / (totalConsideration + casinoIncome) ≤ 5 / 100`（百分の五）。
    除算を含まないため分母が零でも安全（totalConsideration = casinoIncome = 0 でも停止する）。
    境界は「ちょうど 5% → true（適用）」「5% 超 → false（非適用）」。

Scope & honest boundaries:

  * 対価の額・カジノ業務収入額（およびそれらの合計額）の具体的な金額は **caller-established**。
    Bool は算定式に入れず、金額の認定・区分は本モジュールの外で行う。
  * 「政令で定める場合」への該当性のうち、本モジュールが扱うのは上記の「割合が百分の五を
    超えない」という明示的な算術条件のみである。課税期間の特定、資産の譲渡等・カジノ業務収入
    の該当性、法第八十六条の六第一項ただし書の趣旨・その他の政令要件は **caller-established**
    で本モデルに含めない。
  * Money = Nat。厳密な不等式のみで除算・丸めは不要（端数規則のモデル化は不要）。
  * 分母零（totalConsideration + casinoIncome = 0）の場合も交差掛けは `0 ≤ 0` となり true を返す。
    この退化ケースに法的意味があるとは主張せず、入力の妥当性は caller が担保する。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.SpecialMeasuresCasino

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 46の4 — 「合計額」と「百分の五を超えない」割合判定
-- ============================================================

/-- art. 46の4: 原文の割合の分母に当たる「合計額」。
    「資産の譲渡等の対価の額…の合計額に…カジノ業務収入の合計額を加算した金額」なので
    `totalConsideration + casinoIncome` である（`totalConsideration` = 対価の額の合計額、
    `casinoIncome` = カジノ業務収入の合計額）。 -/
def casinoCombinedTotal (totalConsideration casinoIncome : Money) : Money :=
  totalConsideration + casinoIncome

/-- art. 46の4: 「当該カジノ業務収入の合計額の占める割合が百分の五を超えない場合」の判定。
    分母 zero を避けるため交差掛けで判定する:
      `casinoIncome × 100 ≤ 5 × (totalConsideration + casinoIncome)`
    すなわち `casinoIncome / (totalConsideration + casinoIncome) ≤ 5 / 100`。
    除算を含まないため分母が零でも安全。境界はちょうど 5% で true、5% 超で false。 -/
def casinoRatioWithin5pct (totalConsideration casinoIncome : Money) : Bool :=
  decide (casinoIncome * 100 ≤ 5 * (totalConsideration + casinoIncome))

-- ==== verified facts ====

theorem casinoCombinedTotal_eq (totalConsideration casinoIncome : Money) :
    casinoCombinedTotal totalConsideration casinoIncome =
      totalConsideration + casinoIncome := rfl

theorem casinoRatioWithin5pct_eq (totalConsideration casinoIncome : Money) :
    casinoRatioWithin5pct totalConsideration casinoIncome =
      decide (casinoIncome * 100 ≤ 5 * (totalConsideration + casinoIncome)) := rfl

/-- `casinoRatioWithin5pct = true` と交差掛け不等式は同値。 -/
theorem casinoRatioWithin5pct_true_iff (totalConsideration casinoIncome : Money) :
    casinoRatioWithin5pct totalConsideration casinoIncome = true ↔
      casinoIncome * 100 ≤ 5 * (totalConsideration + casinoIncome) := by
  unfold casinoRatioWithin5pct
  simp

-- ==== kernel-decided smoke checks ====

-- 「合計額」= totalConsideration + casinoIncome
example : casinoCombinedTotal 95 5 = 100 := by decide
example : casinoCombinedTotal 0 0 = 0 := by decide

-- 境界: ちょうど 5% → true（適用）、5% 超 → false（非適用）
example : casinoRatioWithin5pct 95 5 = true := by decide
example : casinoRatioWithin5pct 94 6 = false := by decide
example : casinoRatioWithin5pct 285 15 = true := by decide
example : casinoRatioWithin5pct 284 16 = false := by decide

-- 分母零でも安全（停止する）
example : casinoRatioWithin5pct 0 0 = true := by decide
example : casinoRatioWithin5pct 0 1 = false := by decide

-- カジノ収入零・小さい割合
example : casinoRatioWithin5pct 100 0 = true := by decide
example : casinoRatioWithin5pct 9_500_000 500_000 = true := by decide

end JapanTaxLaw.SpecialMeasuresCasino

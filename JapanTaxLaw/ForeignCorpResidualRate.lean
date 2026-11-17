import JapanTaxLaw.TaxFinance

/-!
# ForeignCorpResidualRate — 法人税法 art. 145の4（外国法人の国際最低課税残余額に対する税率）L4 モデル

Source (pinned):
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  原文（担当範囲・正規化済み・UTF-8）: `W_L_corporate145_4.txt`

  第百四十五条の四
  「外国法人に対して課する各対象会計年度の国際最低課税残余額に対する法人税の額は、
    各対象会計年度の外国法人に係る課税標準国際最低課税残余額に百分の九十・七の
    税率を乗じて計算した金額とする。」
  → tax = 外国法人 課税標準国際最低課税残余額 × 907/1000（百分の九十・七 = 90.7%）。

Scope & honest boundaries (overclaim 防止):

* 課税標準国際最低課税残余額（`base`）は **caller-established** とする。本モデルは
  「その額がどう算定されるか」を一切都合せず、与えられた金額に税率を乗じる算術のみを扱う。
* 外国法人該当性・対象会計年度の確定・国際最低課税残余額そのものの算定（GloBE ルール）等の
  適用判定も **caller-established** とし、**Bool は式に入れない**。
* 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「乗じて計算した金額」とし
  端数規定をこの条に持たないため、丸め規則の詳細は per-law business data として
  ここでは floor を採用したことを明示する。
* 内国法人の同種規定（art. 82の13）、外国法人の国内最低課税額（art. 145の8）、
  税率 75.3% の各規定、および GloBE ルール全体は **射程外**。

Pinned evidence in doc-comments only; all theorems here claim properties of
the model only, never of the real legal semantics (誠実性の原則).
-/

namespace JapanTaxLaw.ForeignCorpResidualRate

open JapanTaxLaw.TaxFinance

/-- 百分の九十・七 — art. 145の4 (90.7% = 907/1000). -/
def foreignCorpResidualRate : TaxRate := ⟨907, 1000, by decide⟩

/-- well-definedness: the rate denominator is strictly positive. -/
theorem foreignCorpResidualRate_den_pos : 0 < foreignCorpResidualRate.den := by decide

/-- 第百四十五条の四: 外国法人の国際最低課税残余額に対する法人税額 =
    課税標準国際最低課税残余額 × 907/1000。課税標準額 `base` は caller-established、
    丸めは切り捨て（TaxRate.applyFloor）。 -/
def foreignCorpResidualTax (base : Money) : Money :=
  foreignCorpResidualRate.applyFloor base

/-- the computed amount is monotone in the caller-established base. -/
theorem foreignCorpResidualTax_mono {a b : Money} (h : a ≤ b) :
    foreignCorpResidualTax a ≤ foreignCorpResidualTax b := by
  simp [foreignCorpResidualTax, foreignCorpResidualRate, TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 907 h)

-- ==== smoke per def (all kernel-decided) ====

-- `foreignCorpResidualRate` の smoke（分子・分母が原文どおり）
example : foreignCorpResidualRate.num = 907 := by decide
example : foreignCorpResidualRate.den = 1000 := by decide

-- `foreignCorpResidualTax` の smoke（複数額・切捨て境界を含む）
example : foreignCorpResidualTax 0 = 0 := by decide
example : foreignCorpResidualTax 1 = 0 := by decide
example : foreignCorpResidualTax 999 = 906 := by decide
example : foreignCorpResidualTax 1000 = 907 := by decide
example : foreignCorpResidualTax 100_000 = 90_700 := by decide
example : foreignCorpResidualTax 1_000_000 = 907_000 := by decide

end JapanTaxLaw.ForeignCorpResidualRate

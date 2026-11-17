import JapanTaxLaw.SpecialMeasuresCasinoRatio

/-!
# SpecialMeasuresCasinoRatioSpec — 租税特別措置法施行令 第四十六条の四 の独立定式

Sources (pinned; identical to SpecialMeasuresCasinoRatio.lean):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

Independent restatement of the single modelled computation:

  * art. 46の4「割合が百分の五を超えない場合」
      impl: `decide (casinoIncome * 100 ≤ 5 * (totalConsideration + casinoIncome))`
      spec: `decide ((totalConsideration + casinoIncome) * 5 ≥ casinoIncome * 100)`
    — 同じ判定を「左辺と右辺を入れ替え、`≤` を `≥` にした」形で書き直し、定式を独立に保つ。
    `agreeCasinoRatioWithin5pct` は有限サンプル上の `==` 一致確認であり、
    法的意味の等価証明ではない。

Scope boundaries identical to the implementation. 本モジュールが扱うのは「割合が百分の五を
超えない」という明示的な算術条件のみ。金額の認定・課税期間の特定・その他の政令要件は
caller-established で NOT MODELLED（impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.SpecialMeasuresCasino

open JapanTaxLaw.TaxFinance

-- ==== independent formula ====

/-- Spec: art. 46の4 の「百分の五を超えない」判定（独立定式）。
    impl の `casinoIncome * 100 ≤ 5 * (totalConsideration + casinoIncome)` を
    `(totalConsideration + casinoIncome) * 5 ≥ casinoIncome * 100` と書き換えた形。 -/
def specCasinoRatioWithin5pct (totalConsideration casinoIncome : Money) : Bool :=
  decide ((totalConsideration + casinoIncome) * 5 ≥ casinoIncome * 100)

-- ==== points (kernel-decided) ====

-- 境界: ちょうど 5% → true、5% 超 → false
example : specCasinoRatioWithin5pct 95 5 = true := by decide
example : specCasinoRatioWithin5pct 94 6 = false := by decide
example : specCasinoRatioWithin5pct 285 15 = true := by decide
example : specCasinoRatioWithin5pct 284 16 = false := by decide
-- 分母零・カジノ収入零
example : specCasinoRatioWithin5pct 0 0 = true := by decide
example : specCasinoRatioWithin5pct 0 1 = false := by decide
example : specCasinoRatioWithin5pct 100 0 = true := by decide

-- ==== agreement checks between implementation and Spec ====

/-- art. 46の4: impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeCasinoRatioWithin5pct : Bool :=
  [ (0, 0), (100, 0), (0, 1), (1, 1), (3, 7), (95, 5), (94, 6),
    (285, 15), (284, 16), (9_500_000, 500_000), (1_000_000, 1) ].all fun (t, c) =>
      casinoRatioWithin5pct t c == specCasinoRatioWithin5pct t c

example : agreeCasinoRatioWithin5pct = true := by decide

end JapanTaxLaw.SpecialMeasuresCasino

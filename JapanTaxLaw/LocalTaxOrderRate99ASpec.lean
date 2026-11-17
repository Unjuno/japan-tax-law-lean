import JapanTaxLaw.LocalTaxOrderRate99A

/-!
# LocalTaxOrderRate99ASpec — 地方税法施行令 第九条の十四・第九条の十八 の独立整数定式

Sources (pinned; identical to LocalTaxOrderRate99A.lean):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

Independent restatement of the single modelled computation:

  * 原文「百分の九十九」= 99/100（整数百分率）。
      impl: `art14Rate` / `art18Rate` = `⟨99, 100⟩`（`TaxRate.applyFloor` 経由）
      spec: `specRate99 = (99, 100)` を `TaxRate` を使わず直接保持。
  * 税額 = 課税標準 × 99/100（切り捨て）。
      impl: `art14Tax b` / `art18Tax b` = `b.applyFloor` に `⟨99,100⟩` を適用。
      spec: `specTax99 b = b * 99 / 100`（`TaxRate` に依存しない独立整数式）。

`agree*` は有限サンプル上の `==` 一致で impl ≡ spec を確認する。これは有限
サンプル上の一致確認であり、法的意味の等価証明ではない。

Scope boundaries identical to the implementation. 課税標準・該当性は
caller-established、Bool は算定式に混入させていない。

-/

namespace JapanTaxLaw.LocalTaxOrderRate99A

open JapanTaxLaw.TaxFinance

-- ==== independent formula ====

/-- Spec: 原文「百分の九十九」をそのまま保持した (num, den) = (99, 100)。 -/
def specRate99 : Nat × Nat := (99, 100)

/-- Spec: 税額 = 課税標準 × 99 / 100（`TaxRate` を使わない独立整数式・切り捨て）。 -/
def specTax99 (base : Money) : Money := base * 99 / 100

-- ==== points (kernel-decided) ====

example : specRate99 = (99, 100) := by decide

example : specTax99 0 = 0 := by decide
example : specTax99 1 = 0 := by decide
example : specTax99 2 = 1 := by decide
example : specTax99 3 = 2 := by decide
example : specTax99 50 = 49 := by decide
example : specTax99 100 = 99 := by decide
example : specTax99 101 = 99 := by decide
example : specTax99 1000 = 990 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- 第九条の十四: 率 (num, den) の impl ≡ spec。 -/
def agreeArt14Rate : Bool := art14Rate.numDen == specRate99

/-- 第九条の十八: 率 (num, den) の impl ≡ spec。 -/
def agreeArt18Rate : Bool := art18Rate.numDen == specRate99

/-- 第九条の十四: 税額の impl ≡ spec（有限サンプル上の `==`）。 -/
def agreeArt14Tax : Bool :=
  [0, 1, 2, 3, 50, 99, 100, 101, 200, 999, 1000, 12_345].all fun b =>
    art14Tax b == specTax99 b

/-- 第九条の十八: 税額の impl ≡ spec（有限サンプル上の `==`）。 -/
def agreeArt18Tax : Bool :=
  [0, 1, 2, 3, 50, 99, 100, 101, 200, 999, 1000, 12_345].all fun b =>
    art18Tax b == specTax99 b

example : agreeArt14Rate = true := by decide
example : agreeArt18Rate = true := by decide
example : agreeArt14Tax = true := by decide
example : agreeArt18Tax = true := by decide

end JapanTaxLaw.LocalTaxOrderRate99A

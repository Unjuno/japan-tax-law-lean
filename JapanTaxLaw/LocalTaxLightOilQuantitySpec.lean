import JapanTaxLaw.LocalTaxLightOilQuantity

/-!
# LocalTaxLightOilQuantity spec — 地方税法施行令 第四十三条の十三 の独立定式

Sources (pinned; identical to LocalTaxLightOilQuantity.lean):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

This file restates the statutory arithmetic independently in plain `Nat`, without
`TaxRate` / `applyFloor`: the two percentages are written directly as
`* 1 / 100` (特約業者: 百分の一) and `* 30 / 10000` (元売業者: 百分の〇・三 = 3/1000),
both with floor truncation. `agreeLocalTaxLightOilQuantity` checks that the
implementation and this independent restatement coincide at a fixed set of points
(kernel `decide`; finite points only, not a universal claim).

Scope boundaries are identical to the implementation. In particular the quantity,
the taxable base, the dealer category (特約業者／元売業者) and all eligibility facts are
caller-established and are never used to derive an amount inside this model.
The Bool category flag is used only to select which independent formula to apply.
-/

namespace JapanTaxLaw.LocalTaxLightOilQuantity

open JapanTaxLaw.TaxFinance

-- ==== 独立定式（TaxRate.applyFloor を使わない） ====

/-- 特約業者: 数量 × 1 / 100（独立定式）。 -/
def specLightOilReduction (quantity : Nat) : Nat :=
  quantity * 1 / 100

/-- 元売業者: 数量 × 30 / 10000（＝ × 3 / 1000、独立定式）。 -/
def specMotouriLightOilReduction (quantity : Nat) : Nat :=
  quantity * 30 / 10000

/-- 区分別の独立定式。true = 特約業者、false = 元売業者。
    Bool は式の選択にのみ使用し、算術式には入れない。 -/
def specLightOilReductionForDealer (isTokutei : Bool) (quantity : Nat) : Nat :=
  if isTokutei then quantity * 1 / 100 else quantity * 30 / 10000

-- ==== points（独立定式の kernel-decided smoke） ====

example : specLightOilReduction 0 = 0 := by decide
example : specLightOilReduction 1 = 0 := by decide
example : specLightOilReduction 99 = 0 := by decide
example : specLightOilReduction 100 = 1 := by decide
example : specLightOilReduction 150 = 1 := by decide

example : specMotouriLightOilReduction 0 = 0 := by decide
example : specMotouriLightOilReduction 1 = 0 := by decide
example : specMotouriLightOilReduction 99 = 0 := by decide
example : specMotouriLightOilReduction 100 = 0 := by decide
example : specMotouriLightOilReduction 333 = 0 := by decide
example : specMotouriLightOilReduction 334 = 1 := by decide
example : specMotouriLightOilReduction 1000 = 3 := by decide

example : specLightOilReductionForDealer true 100 = 1 := by decide
example : specLightOilReductionForDealer false 100 = 0 := by decide
example : specLightOilReductionForDealer true 1000 = 10 := by decide
example : specLightOilReductionForDealer false 1000 = 3 := by decide

-- ==== agreement（impl ↔ spec、列挙された有限点のみ） ====

/-- 実装と独立定式が全テスト点で一致するか（有限点のみ；全称主張ではない）。 -/
def agreeLocalTaxLightOilQuantity : Bool :=
  let quantities := [0, 1, 2, 50, 99, 100, 101, 150, 199, 200, 333, 334,
                     999, 1000, 3333, 3334, 10000, 123456]
  quantities.all fun q =>
    lightOilReduction q == specLightOilReduction q &&
    motouriLightOilReduction q == specMotouriLightOilReduction q &&
    lightOilReductionForDealer true q == specLightOilReductionForDealer true q &&
    lightOilReductionForDealer false q == specLightOilReductionForDealer false q

example : agreeLocalTaxLightOilQuantity = true := by decide

end JapanTaxLaw.LocalTaxLightOilQuantity

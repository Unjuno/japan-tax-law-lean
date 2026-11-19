import JapanTaxLaw.LightOilBaseTax

/-!
# LightOilBaseTax spec — 軽油引取税法施行令 art. 23の2 の独立整数定式

Sources (pinned; identical to LightOilBaseTax.lean):

  Law id: 337M50000008017
  Revision: 337M50000008017_20260724_508M60000008092

This file restates the statutory arithmetic independently in plain `Nat`, without
`TaxRate` / `Money` helpers: the rounding is written directly as
`(2 * a + b) / (2 * b)` (四捨五入 = round half up), the base amount as the literal
`11_250`, and the designated-city total as a self-contained recursive sum.
The `agree*` booleans check that the implementation and these independent
restatements coincide at fixed finite points (kernel `decide`; not universal claims).

Scope boundaries are identical to the implementation. The quantity, the rate, the
designated-city amounts and all eligibility facts are caller-established. The Bool
flag selects which calculation function to call; it is never placed inside an
amount expression. 別表第十一条の率・第三十八条の額算定は NOT MODELLED.
-/

namespace JapanTaxLaw.LightOilBaseTax

open JapanTaxLaw.TaxFinance

-- ==== 独立定式（TaxRate / Money ヘルパを使わない） ====

/-- a / b の四捨五入（round half up、独立定式）。 -/
def specRoundDiv (a b : Nat) : Nat :=
  (2 * a + b) / (2 * b)

/-- 数量 × 率 をキロリットル単位に四捨五入（独立定式）。 -/
def specRoundKiloliter (quantity num den : Nat) : Nat :=
  specRoundDiv (quantity * num) den

/-- 基準税額 = 一一、二五〇円 × 四捨五入後数量（独立定式）。 -/
def specLightOilBaseTax (quantity num den : Nat) : Nat :=
  11_250 * specRoundKiloliter quantity num den

/-- 指定都市ごとの算定額の合計（独立再帰和、List.sum を使わない）。 -/
def specSum : List Nat → Nat
  | [] => 0
  | x :: xs => x + specSum xs

/-- ただし書：基準税額 − 指定都市額合計（saturating、独立定式）。 -/
def specDesignatedCityNet (quantity num den : Nat) (amounts : List Nat) : Nat :=
  specLightOilBaseTax quantity num den - specSum amounts

-- ==== points（独立定式の kernel-decided smoke） ====

-- 四捨五入の境界（0.5 切り上げ / 切り捨て / 切り上げ / exact）
example : specRoundDiv 0 3 = 0 := by decide
example : specRoundDiv 1 2 = 1 := by decide
example : specRoundDiv 1 3 = 0 := by decide
example : specRoundDiv 2 3 = 1 := by decide
example : specRoundDiv 3 2 = 2 := by decide
example : specRoundDiv 5 2 = 3 := by decide

example : specRoundKiloliter 1 1 2 = 1 := by decide
example : specRoundKiloliter 2 1 2 = 1 := by decide
example : specRoundKiloliter 3 1 2 = 2 := by decide
example : specRoundKiloliter 1 1 3 = 0 := by decide
example : specRoundKiloliter 2 1 3 = 1 := by decide

example : specLightOilBaseTax 0 1 1 = 0 := by decide
example : specLightOilBaseTax 1 1 1 = 11_250 := by decide
example : specLightOilBaseTax 3 1 2 = 22_500 := by decide

example : specSum [] = 0 := by decide
example : specSum [100, 200, 300] = 600 := by decide
example : specDesignatedCityNet 1 1 1 [11_250] = 0 := by decide
example : specDesignatedCityNet 1 1 1 [20_000] = 0 := by decide

-- ==== agreement（impl ↔ spec、列挙された有限点のみ） ====

/-- 法定額定数の一致（定数値の確認）。 -/
def agreeLightOilBaseAmount : Bool :=
  lightOilBaseAmount == 11_250

/-- 四捨五入後数量の一致（9 数量 × 5 率 = 45 点、有限点のみ）。 -/
def agreeRoundKiloliter : Bool :=
  let quantities := [0, 1, 2, 3, 5, 50, 99, 100, 999]
  let rates : List TaxRate :=
    [⟨1, 2, by decide⟩, ⟨1, 3, by decide⟩, ⟨2, 3, by decide⟩,
     ⟨7, 3, by decide⟩, ⟨11, 7, by decide⟩]
  quantities.all fun q => rates.all fun r =>
    roundKiloliter q r == specRoundKiloliter q r.num r.den

/-- 基準税額の一致（9 数量 × 4 率 = 36 点、有限点のみ）。 -/
def agreeLightOilBaseTax : Bool :=
  let quantities := [0, 1, 2, 3, 5, 50, 99, 100, 999]
  let rates : List TaxRate :=
    [⟨1, 2, by decide⟩, ⟨1, 3, by decide⟩, ⟨2, 3, by decide⟩, ⟨7, 3, by decide⟩]
  quantities.all fun q => rates.all fun r =>
    lightOilBaseTax q r == specLightOilBaseTax q r.num r.den

/-- ただし書の控除後額の一致（3 点 × 6 控除リスト = 18 点、有限点のみ）。 -/
def agreeDesignatedCityNet : Bool :=
  let points : List (Nat × TaxRate) :=
    [(1, ⟨1, 1, by decide⟩), (2, ⟨1, 2, by decide⟩), (100, ⟨7, 3, by decide⟩)]
  let amountLists : List (List Money) :=
    [[], [0], [11_250], [100, 200], [20_000], [11_250, 1]]
  points.all fun (q, r) => amountLists.all fun as =>
    lightOilBaseTaxAfterDesignatedCityDeduction q r as ==
      specDesignatedCityNet q r.num r.den as

/-- Bool 選択が金額式に入らず関数選択にのみ使われることの有限点確認。 -/
def agreeBaseTaxFor : Bool :=
  let q := 1
  let r : TaxRate := ⟨1, 1, by decide⟩
  let as : List Money := [11_250]
  baseTaxFor true q r as == lightOilBaseTaxAfterDesignatedCityDeduction q r as &&
  baseTaxFor false q r as == lightOilBaseTax q r &&
  baseTaxFor true q r as == 0 && baseTaxFor false q r as == 11_250

example : agreeLightOilBaseAmount = true := by decide
example : agreeRoundKiloliter = true := by decide
example : agreeLightOilBaseTax = true := by decide
example : agreeDesignatedCityNet = true := by decide
example : agreeBaseTaxFor = true := by decide

end JapanTaxLaw.LightOilBaseTax

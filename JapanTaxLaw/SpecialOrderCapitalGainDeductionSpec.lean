import JapanTaxLaw.SpecialOrderCapitalGainDeduction

/-!
# SpecialOrderCapitalGainDeduction spec — 租税特別措置法施行令 第二十四条

Source (pinned; identical to SpecialOrderCapitalGainDeduction.lean):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

Independent restatement of the capped-aggregate computation in 第二十四条:

  「五千万円の範囲内において … 五千万円に満たない場合には、五千万円又は当該満たない部分の
    金額の範囲内において、順次 … の規定により控除すべき金額から成るものとして計算した金額とする。」

Independence of the formulation:

* impl が `Nat.min` と `List.sum` を使うのに対し、spec は
  `x - (x - cap)` という減算だけの式（min も if も使わない）で上限を表現し、
  リスト合計も再帰関数で定義する。
* spec 側の上限 `specCap` は実装定数を参照せず原文リテラルから独立に置く。
* 双方は `agree*`（`by decide` の有限点一致）でのみ接続する。
  これは法的意味の等価証明ではなく、モデル同士の spot-check にすぎない。

Scope boundaries identical to the implementation. 各控除額・該当性は caller-established。
Bool は式に入れない。優先順位の適用ロジック・各参照条文の控除額算定は NOT MODELLED。
-/

namespace JapanTaxLaw.SpecialOrderCapitalGainDeduction

open JapanTaxLaw.TaxFinance

/-- Spec: 限度額 五千万円（原文リテラルから独立に置く）。 -/
def specCap : Money := 50_000_000

example : specCap = capitalGainSpecialDeductionCap := by decide

/-- Spec: 「五千万円の範囲内」。`min` を使わず減算だけで表現:
    x ≤ cap なら x - 0 = x、x > cap なら x - (x - cap) = cap。 -/
def specWithinCap (amount : Money) : Money :=
  amount - (amount - specCap)

/-- Spec: 控除額リストの合計（再帰定義、library の List.sum を使わない）。 -/
def specSumDeductions : List Money → Money
  | [] => 0
  | a :: rest => a + specSumDeductions rest

/-- Spec: 「満たない部分の金額」（残り余裕）。 -/
def specShortfall (used : Money) : Money := specCap - specWithinCap used

/-- Spec: 合計特別控除額 = 上限適用後のリスト合計。 -/
def specSpecialDeductionTotal (amounts : List Money) : Money :=
  specWithinCap (specSumDeductions amounts)

-- ==== points (kernel-decided) ====

example : specWithinCap 0 = 0 := by decide
example : specWithinCap 49_999_999 = 49_999_999 := by decide
example : specWithinCap 50_000_000 = 50_000_000 := by decide
example : specWithinCap 50_000_001 = 50_000_000 := by decide
example : specWithinCap 100_000_000 = 50_000_000 := by decide

example : specSumDeductions [] = 0 := by decide
example : specSumDeductions [30_000_000, 20_000_001] = 50_000_001 := by decide

example : specSpecialDeductionTotal [] = 0 := by decide
example : specSpecialDeductionTotal [49_999_999] = 49_999_999 := by decide
example : specSpecialDeductionTotal [50_000_000] = 50_000_000 := by decide
example : specSpecialDeductionTotal [50_000_001] = 50_000_000 := by decide
example : specSpecialDeductionTotal [30_000_000, 20_000_001] = 50_000_000 := by decide

/-- Spot-check: implementation agrees with the independent spec on sample points.
    Points are sample points, not a proof of universal equivalence. -/
def agreeWithinCapPoints : Bool :=
  [0, 1, 49_999_999, 50_000_000, 50_000_001, 99_999_999, 100_000_000, 250_000_000].all
    fun a => withinCap a == specWithinCap a

example : agreeWithinCapPoints = true := by decide

/-- Spot-check: shortfall agreement. -/
def agreeShortfallPoints : Bool :=
  [0, 1, 49_999_999, 50_000_000, 50_000_001, 99_999_999].all
    fun a => shortfall a == specShortfall a

example : agreeShortfallPoints = true := by decide

/-- Spot-check: aggregate agreement (boundary values and sequential-capping cases). -/
def agreeSpecialDeductionTotalPoints : Bool :=
  let samples : List (List Money) :=
    [ [], [0], [49_999_999], [50_000_000], [50_000_001],
      [30_000_000, 19_999_999], [30_000_000, 20_000_000], [30_000_000, 20_000_001],
      [50_000_000, 1], [1, 2, 3, 4, 5, 6, 7],
      [33_333_333, 33_333_333, 33_333_333] ]
  samples.all fun xs => specialDeductionTotal xs == specSpecialDeductionTotal xs

example : agreeSpecialDeductionTotalPoints = true := by decide

end JapanTaxLaw.SpecialOrderCapitalGainDeduction

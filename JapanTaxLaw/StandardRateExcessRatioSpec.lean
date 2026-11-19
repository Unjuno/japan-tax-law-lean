import JapanTaxLaw.StandardRateExcessRatio

/-!
# StandardRateExcessRatio spec — 地方税法施行令 art. 35の4の6（標準税率超過率）

Source (pinned; identical to StandardRateExcessRatio.lean):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083

Independent restatement (impl と独立に、Bool 判定・再帰パターンで定式化):

  * specStandardRateExcessRatio base std: base == 0 → 0; else (base - std) / base (floor)
  * specSumMoney: [] → 0; x :: rest → x + specSumMoney rest
  * specBaseBusinessTax amounts deductions:
      a = specSumMoney amounts; d = specSumMoney deductions; a ≤ d → 0; else a - d
  * specExcessRatioFromItems = specStandardRateExcessRatio (specBaseBusinessTax ..) std

Only the two explicit computational rules of art. 35の4の6 are modelled.
算定期間・申告書認定・標準税率相当額の再計算・総務省令は NOT MODELLED。
-/

namespace JapanTaxLaw.StandardRateExcessRatio

open JapanTaxLaw.TaxFinance

/-- Spec: 標準税率超過率（独立定式）。 -/
def specStandardRateExcessRatio (baseTax standardTaxEquivalent : Money) : Money :=
  if baseTax == 0 then 0 else (baseTax - standardTaxEquivalent) / baseTax

/-- Spec: 合計（独立定式、再帰パターン）。 -/
def specSumMoney (xs : List Money) : Money :=
  match xs with
  | [] => 0
  | x :: rest => x + specSumMoney rest

/-- Spec: 基準事業税額（独立定式、saturating を if で明示）。 -/
def specBaseBusinessTax (amounts deductions : List Money) : Money :=
  let a := specSumMoney amounts
  let d := specSumMoney deductions
  if a ≤ d then 0 else a - d

/-- Spec: 第1項を第2項から組み立てたもの。 -/
def specExcessRatioFromItems (amounts deductions : List Money)
    (standardTaxEquivalent : Money) : Money :=
  specStandardRateExcessRatio (specBaseBusinessTax amounts deductions) standardTaxEquivalent

-- ==== points (kernel-decided) ====

example : specStandardRateExcessRatio 0 0 = 0 := by decide
example : specStandardRateExcessRatio 100 100 = 0 := by decide
example : specStandardRateExcessRatio 100 0 = 1 := by decide
example : specStandardRateExcessRatio 100 1 = 0 := by decide
example : specStandardRateExcessRatio 100 200 = 0 := by decide
example : specSumMoney [1, 2, 3, 5] = 11 := by decide
example : specBaseBusinessTax [1, 2, 3, 5] [4] = 7 := by decide
example : specBaseBusinessTax [10] [50] = 0 := by decide
example : specExcessRatioFromItems [1, 2, 3, 5] [4] 7 = 0 := by decide

/-- Agreement checks between implementation and Spec (finite points, kernel-decided). -/
def agreeStandardRateExcessRatio : Bool :=
  ([ (0, 0), (100, 100), (100, 0), (100, 1), (7, 3), (100, 200), (3, 1), (5, 2) ]
      : List (Money × Money)).all
    (fun p => standardRateExcessRatio p.1 p.2 == specStandardRateExcessRatio p.1 p.2)
  && ([ ([10, 20, 30], [5]), ([10, 20, 30], []), ([], [5]), ([10], [50]),
        ([1, 2, 3, 5], [4]), ([], []), ([7], [3]) ]
        : List (List Money × List Money)).all
    (fun p => baseBusinessTax p.1 p.2 == specBaseBusinessTax p.1 p.2)
  && ([ ([1, 2, 3, 5], [4], 7), ([10, 20, 30], [5], 0), ([], [], 0), ([10], [50], 5) ]
        : List (List Money × List Money × Money)).all
    (fun p => excessRatioFromItems p.1 p.2.1 p.2.2 ==
              specExcessRatioFromItems p.1 p.2.1 p.2.2)

example : agreeStandardRateExcessRatio = true := by decide

end JapanTaxLaw.StandardRateExcessRatio

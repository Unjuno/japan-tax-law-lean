import JapanTaxLaw.InheritanceAnnuityMinMax

/-!
# InheritanceAnnuityMinMax spec — 相続税法 art. 24(1) 四号 / art. 24(3)(4)

Source (pinned; identical to InheritanceAnnuityMinMax.lean):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

Independent restatement of the three computations (原文は impl の doc-comment に一字も誤らず転記):

  * 四号: 一時金の価額は「その給付金額」そのもの（恒等）。
  * 3項: 有期・終身の「いずれか少ない金額」。
  * 4項: 有期・終身の「いずれか多い金額」。

Independence of the formulation:

  * impl が `min` / `max` を使うのに対し、spec は `if` による別表現で
    少ない金額 / 多い金額を選ぶ（`specConditionalAnnuityValue` /
    `specContinuingAnnuityValue`）。
  * 双方は `agree*`（有限点点の `==` 一致、`by decide`）でのみ接続する。
    これは法的意味の等価証明ではなく、モデル同士の有限点 spot-check にすぎない。
  * 有期・終身の各算出額は caller-established Money。art. 24(1) の max 構造は
    W-AnMax が担当し、ここでは重複定義しない。契約種別は caller-established Bool で、
    Bool は金額ではなく選択にのみ現れる。

Scope boundaries identical to the implementation. Not human legal review; 完成・網羅を主張しない。
-/

namespace JapanTaxLaw.InheritanceAnnuityMinMax

open JapanTaxLaw.TaxFinance

/-- Spec: 四号「その給付金額」そのもの（恒等）。 -/
def specLumpSumPaymentAmount (amount : Money) : Money := amount

/-- Spec: 3項の少ない金額を `if` で表す（`min` を使わない別表現）。 -/
def specConditionalAnnuityValue (termValue lifetimeValue : Money) : Money :=
  if termValue ≤ lifetimeValue then termValue else lifetimeValue

/-- Spec: 4項の多い金額を `if` で表す（`max` を使わない別表現）。 -/
def specContinuingAnnuityValue (termValue lifetimeValue : Money) : Money :=
  if termValue ≤ lifetimeValue then lifetimeValue else termValue

/-- Spec: 契約種別 Bool は 2 値の選択にのみ使う。 -/
def specAnnuityMinMaxValue (isContinuingContract : Bool) (termValue lifetimeValue : Money) : Money :=
  if isContinuingContract then specContinuingAnnuityValue termValue lifetimeValue
  else specConditionalAnnuityValue termValue lifetimeValue

-- ==== kernel-decided points ====

example : specLumpSumPaymentAmount 0 = 0 := by decide
example : specLumpSumPaymentAmount 12_345 = 12_345 := by decide
example : specConditionalAnnuityValue 3 7 = 3 := by decide
example : specConditionalAnnuityValue 7 3 = 3 := by decide
example : specConditionalAnnuityValue 5 5 = 5 := by decide
example : specConditionalAnnuityValue 0 5 = 0 := by decide
example : specContinuingAnnuityValue 3 7 = 7 := by decide
example : specContinuingAnnuityValue 7 3 = 7 := by decide
example : specContinuingAnnuityValue 5 5 = 5 := by decide
example : specContinuingAnnuityValue 0 5 = 5 := by decide

-- ==== agreement spot-checks (finite points, not universal equivalence) ====

def agreeLumpSumPaymentAmount : Bool :=
  [0, 1, 99, 100, 1_000, 12_345, 1_000_000].all fun a =>
    lumpSumPaymentAmount a == specLumpSumPaymentAmount a

def agreeConditionalAnnuityValue : Bool :=
  let pts : List (Money × Money) :=
    [(0, 0), (0, 5), (5, 0), (3, 7), (7, 3), (5, 5), (999, 1_000), (1_000, 999)]
  pts.all fun p => conditionalAnnuityValue p.1 p.2 == specConditionalAnnuityValue p.1 p.2

def agreeContinuingAnnuityValue : Bool :=
  let pts : List (Money × Money) :=
    [(0, 0), (0, 5), (5, 0), (3, 7), (7, 3), (5, 5), (999, 1_000), (1_000, 999)]
  pts.all fun p => continuingAnnuityValue p.1 p.2 == specContinuingAnnuityValue p.1 p.2

def agreeAnnuityMinMaxValue : Bool :=
  let pts : List (Bool × (Money × Money)) :=
    [(false, (3, 7)), (true, (3, 7)), (false, (7, 3)), (true, (7, 3)),
     (false, (0, 0)), (true, (0, 0)), (false, (5, 5)), (true, (5, 5))]
  pts.all fun p =>
    annuityMinMaxValue p.1 p.2.1 p.2.2 == specAnnuityMinMaxValue p.1 p.2.1 p.2.2

example : agreeLumpSumPaymentAmount = true := by decide
example : agreeConditionalAnnuityValue = true := by decide
example : agreeContinuingAnnuityValue = true := by decide
example : agreeAnnuityMinMaxValue = true := by decide

end JapanTaxLaw.InheritanceAnnuityMinMax

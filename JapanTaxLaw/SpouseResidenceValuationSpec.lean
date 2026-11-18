import JapanTaxLaw.SpouseResidenceValuation

/-
# SpouseResidenceValuation spec — 相続税法 art. 23の2

Source (pinned; identical to SpouseResidenceValuation.lean):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

独立整数定式（impl の doc-comment に原文を一字も誤らず転記済み）:

  * 第1項: 価額 = 一号価額 − 一号価額 × 二号の数 × 三号の割合。
    impl が saturating Nat 減算 `b - d` に依存するのに対し、spec は
    `if d ≥ b then 0 else b - d` と明示的な Garland（零下限）で書く。
  * 二号: イ÷ロ（ロが零なら零）。impl は `i = 0 || ro = 0` の双方を防御するが、
    spec は `if ro = 0 then 0 else i / ro` のみ（i=0 なら除算結果も零）。
  * 第2項・第3項・第4項の残額も明示的な零下限で書き直す。

双方は `agree*`（有限点点の `==` 一致、`by decide`）でのみ接続する。
これは法的意味の等価証明ではなく、モデル同士の有限点 spot-check にすぎない。

Scope boundaries identical to the implementation. Not human legal review; 完成・網羅を主張しない。
-/

namespace JapanTaxLaw.SpouseResidenceValuation

open JapanTaxLaw.TaxFinance

-- ==== 独立定式 ====

/-- Spec: ロ（耐用年数 − 経過年数）。零下限を if で明示。 -/
def specRemainingYears (usefulLife elapsed : Nat) : Nat :=
  if usefulLife ≤ elapsed then 0 else usefulLife - elapsed

/-- Spec: イ（耐用年数 − 経過年数 − 存続年数）。 -/
def specNetBuildingYears (usefulLife elapsed duration : Nat) : Nat :=
  specRemainingYears usefulLife (elapsed + duration)

/-- Spec: 二号の数 = イ ÷ ロ（ロが零なら零）。impl の i=0 ガードは冗長。 -/
def specYearsRate (i ro : Nat) : Nat :=
  if ro = 0 then 0 else i / ro

/-- Spec: 第1項。控除額が時価以上なら零（明示的な saturating）。 -/
def specSpouseResidenceValue (b r q : Nat) : Nat :=
  let deduction := b * r * q
  if deduction ≥ b then 0 else b - deduction

/-- Spec: 第2項。 -/
def specResidenceBuildingValue (m v : Nat) : Nat :=
  if v ≥ m then 0 else m - v

/-- Spec: 第3項。二号 = 前号価額 × 割合。 -/
def specLandUseRightValue (l q : Nat) : Nat :=
  let deduction := l * q
  if deduction ≥ l then 0 else l - deduction

/-- Spec: 第4項。 -/
def specLandValueAfterUseRight (m v : Nat) : Nat :=
  if v ≥ m then 0 else m - v

-- ==== kernel-decided points ====

example : specRemainingYears 30 10 = 20 := by decide
example : specRemainingYears 10 30 = 0 := by decide
example : specNetBuildingYears 30 10 5 = 15 := by decide
example : specYearsRate 15 20 = 0 := by decide
example : specYearsRate 20 20 = 1 := by decide
example : specYearsRate 20 0 = 0 := by decide
example : specSpouseResidenceValue 1000 1 1 = 0 := by decide
example : specSpouseResidenceValue 1000 0 3 = 1000 := by decide
example : specSpouseResidenceValue 1000 1 2 = 0 := by decide
example : specResidenceBuildingValue 1000 300 = 700 := by decide
example : specLandUseRightValue 1000 1 = 0 := by decide
example : specLandUseRightValue 1000 0 = 1000 := by decide
example : specLandValueAfterUseRight 1000 300 = 700 := by decide

-- ==== agreement spot-checks (finite points, not universal equivalence) ====

def agreeRemainingYears : Bool :=
  let pts : List (Nat × Nat) :=
    [(0, 0), (10, 10), (10, 30), (30, 10), (47, 0), (5, 6), (100, 99)]
  pts.all fun p => remainingYears p.1 p.2 == specRemainingYears p.1 p.2

def agreeNetBuildingYears : Bool :=
  let pts : List (Nat × (Nat × Nat)) :=
    [(0, (0, 0)), (30, (10, 5)), (10, (30, 5)), (30, (10, 20)), (20, (5, 5)), (100, (1, 2))]
  pts.all fun p => netBuildingYears p.1 p.2.1 p.2.2 == specNetBuildingYears p.1 p.2.1 p.2.2

def agreeYearsRate : Bool :=
  let pts : List (Nat × Nat) :=
    [(0, 0), (0, 20), (20, 0), (15, 20), (20, 20), (5, 2), (99, 100), (100, 100)]
  pts.all fun p => yearsRate p.1 p.2 == specYearsRate p.1 p.2

def agreeSpouseResidenceValue : Bool :=
  let pts : List (Nat × (Nat × Nat)) :=
    [(0, (0, 0)), (0, (1, 1)), (1000, (0, 3)), (1000, (1, 0)), (1000, (1, 1)),
     (1000, (1, 2)), (100, (2, 3)), (7, (5, 5)), (1, (1, 1))]
  pts.all fun p => spouseResidenceValue p.1 p.2.1 p.2.2 == specSpouseResidenceValue p.1 p.2.1 p.2.2

def agreeResidenceBuildingValue : Bool :=
  let pts : List (Nat × Nat) :=
    [(0, 0), (1000, 300), (300, 1000), (500, 500), (1, 0)]
  pts.all fun p => residenceBuildingValue p.1 p.2 == specResidenceBuildingValue p.1 p.2

def agreeLandUseRightValue : Bool :=
  let pts : List (Nat × Nat) :=
    [(0, 0), (1000, 0), (1000, 1), (1000, 2), (7, 3), (1, 1)]
  pts.all fun p => landUseRightValue p.1 p.2 == specLandUseRightValue p.1 p.2

def agreeLandValueAfterUseRight : Bool :=
  let pts : List (Nat × Nat) :=
    [(0, 0), (1000, 300), (300, 1000), (500, 500), (1, 0)]
  pts.all fun p => landValueAfterUseRight p.1 p.2 == specLandValueAfterUseRight p.1 p.2

example : agreeRemainingYears = true := by decide
example : agreeNetBuildingYears = true := by decide
example : agreeYearsRate = true := by decide
example : agreeSpouseResidenceValue = true := by decide
example : agreeResidenceBuildingValue = true := by decide
example : agreeLandUseRightValue = true := by decide
example : agreeLandValueAfterUseRight = true := by decide

end JapanTaxLaw.SpouseResidenceValuation

import JapanTaxLaw.UnreportedSurcharge

/-!
# UnreportedSurcharge spec — 国税通則法 art. 66（無申告加算税）

Sources (pinned; identical to UnreportedSurcharge.lean):

  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Independent restatement of:
  * 1項: 税額 × 15%（軽減時 10%）
  * 3項: 三段階累進 ≤50万:15% / 50万〜300万:20% / >300万:30%（軽減時 各 −5pt）
  impl が TaxRate.applyFloor と match を使うのに対し、spec は素の整数式・ネスト if で独立定式。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 66(1) 基本（独立定式）。 -/
def specUnreportedBasic (tax : Money) (reduced : Bool) : Money :=
  if reduced then tax * 10 / 100 else tax * 15 / 100

/-- Spec: art. 66(3) 区分税率（独立定式: 整数パーセント）。 -/
def specTierPct (tier : Nat) (reduced : Bool) : Money :=
  match tier with
  | 0 => if reduced then 10 else 15
  | 1 => if reduced then 15 else 20
  | _ => if reduced then 25 else 30

/-- Spec: art. 66(3) 三段階累進（独立定式）。 -/
def specTieredSurcharge (tax : Money) (reduced : Bool) : Money :=
  let t0 := min tax 500_000
  let t1 := min (max (tax - 500_000) 0) 2_500_000
  let t2 := max (tax - 3_000_000) 0
  t0 * specTierPct 0 reduced / 100
    + t1 * specTierPct 1 reduced / 100
    + t2 * specTierPct 2 reduced / 100

-- ==== points (kernel-decided) ====

example : specUnreportedBasic 100_000 false = 15_000 := by decide
example : specUnreportedBasic 100_000 true = 10_000 := by decide
example : specTieredSurcharge 400_000 false = 60_000 := by decide
example : specTieredSurcharge 2_000_000 false = 375_000 := by decide
example : specTieredSurcharge 4_000_000 false = 875_000 := by decide
example : specTieredSurcharge 4_000_000 true = 675_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeUnreportedSurcharge : Bool :=
  [0, 1, 499_999, 500_000, 500_001, 2_000_000, 3_000_000, 4_000_000, 10_000_000].all fun tax =>
    tieredSurcharge tax false == specTieredSurcharge tax false
    && tieredSurcharge tax true == specTieredSurcharge tax true

example : agreeUnreportedSurcharge = true := by decide

end JapanTaxLaw

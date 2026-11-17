import JapanTaxLaw.IncomeDependentDeductions

/-!
# IncomeDependentDeductions spec — 所得税法 art. 84（扶養控除）の独立整数定式

Sources (pinned; identical to IncomeDependentDeductions.lean):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B

This file restates the statutory arithmetic independently in plain `Nat`, without
referencing any implementation constant: the three amounts are written as bare
literals (380_000 / 630_000 / 480_000, read from 原文 三十八万円 / 六十三万円 /
四十八万円), the total as an explicit sum of products, and the post-deduction
amount as an explicit `if` (rather than relying on Nat subtraction underflow).
`agreeIncomeDependentDeductions` checks that the implementation and this
independent restatement coincide on a finite grid of counts and totals (kernel `decide`).

art. 186の2 is NOT MODELLED in the implementation; accordingly there is no spec
for it. Scope boundaries are otherwise identical to the implementation. In
particular the eligibility facts (控除対象扶養親族／特定扶養親族／老人扶養親族
であること) are caller-established and are never used to derive an amount inside
this model. No upper bound and no rounding are applied.
-/

namespace JapanTaxLaw.IncomeDependentDeductions

-- ==== art. 84: 独立定式（impl の定数を参照しない） ====

/-- art. 84 一般: 三十八万円。 -/
def specGeneralDependentAmount : Nat := 380_000

/-- art. 84 特定扶養親族: 六十三万円。 -/
def specSpecificDependentAmount : Nat := 630_000

/-- art. 84 老人扶養親族: 四十八万円。 -/
def specElderlyDependentAmount : Nat := 480_000

/-- art. 84: 合計 = 一般×人数 + 特定×人数 + 老人×人数（上限なし）。 -/
def specArt84Total (g s e : Nat) : Nat :=
  g * 380_000 + s * 630_000 + e * 480_000

/-- art. 84: 控除後 = 総所得 − 合計、ただし総所得が合計未満なら 0（saturating）。 -/
def specArt84IncomeAfter (totalIncome g s e : Nat) : Nat :=
  let d := specArt84Total g s e
  if d ≤ totalIncome then totalIncome - d else 0

-- ==== points（独立定式のスモーク） ====

example : specGeneralDependentAmount = 380_000 := by decide
example : specSpecificDependentAmount = 630_000 := by decide
example : specElderlyDependentAmount = 480_000 := by decide

example : specArt84Total 0 0 0 = 0 := by decide
example : specArt84Total 1 0 0 = 380_000 := by decide
example : specArt84Total 0 1 0 = 630_000 := by decide
example : specArt84Total 0 0 1 = 480_000 := by decide
example : specArt84Total 2 1 3 = 2_830_000 := by decide
example : specArt84IncomeAfter 1_000_000 2 0 0 = 240_000 := by decide
example : specArt84IncomeAfter 380_000 1 0 0 = 0 := by decide

-- ==== agreement（impl ↔ spec、有限点のみ；全称主張ではない） ====

/-- 実装と独立定式が有限グリッド上で一致するか（列挙された点のみ；全称主張ではない）。 -/
def agreeIncomeDependentDeductions : Bool :=
  let counts := [0, 1, 2, 3, 7, 12]
  let totals := [0, 1, 379_999, 380_000, 480_000, 630_000, 760_000, 1_000_000, 12_345_678]
  totals.all fun t =>
    counts.all fun g =>
      counts.all fun s =>
        counts.all fun e =>
          (art84TotalDependentDeduction ⟨g, s, e⟩ == specArt84Total g s e) &&
          (art84IncomeAfterDependentDeduction t ⟨g, s, e⟩ == specArt84IncomeAfter t g s e)

example : agreeIncomeDependentDeductions = true := by decide

end JapanTaxLaw.IncomeDependentDeductions

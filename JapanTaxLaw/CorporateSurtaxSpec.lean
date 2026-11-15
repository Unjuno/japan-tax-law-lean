import JapanTaxLaw.CorporateSurtax

/-!
# CorporateSurtax spec — independent statement of art. 67(1),(3),(5)-(7)

Source (pinned):
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 3B743C0FB772A2482ED143CBE2611E3B82E929868767514A3E1DB16F5C2EF342

Independent restatement of 法人税法 art. 67 (特定同族会社の特別税率) from the statutory
text itself. Where the implementation partitions the excess by `min`, this spec
decides the band directly by nested case analysis on where the excess sits
relative to the two (possibly month-prorated) tier caps:

  excess ≤ t1                       → excess × 10/100
  t1 < excess ≤ t2                  → t1 × 10/100 + (excess − t1) × 15/100
  excess > t2                       → t1 × 10/100 + (t2 − t1) × 15/100 + (excess − t2) × 20/100

Each band is floored separately, exactly as the implementation does
(`applyFloor`-style, one floor per 区分).

The 留保控除額 (art. 67(5)) is restated here as the maximum of the same three
statutory candidates, but with the 第64条の5 adjustment spelled out inline
rather than through the implementation's helper names.

Scope boundaries are identical to the implementation (see CorporateSurtax.lean):
被支配会社/特定同族会社の判定・清算中の除外・第64条の5の金額そのもの・第4項の期末配当等による
調整・第3項の各号の内訳・国税通則法 art. 118/119 の rounding は、すべて外部入力または射程外。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 留保控除額 — max of the three statutory candidates (art. 67(5)). -/
def specRetentionDeduction (f : CloselyHeldFacts) : Money :=
  max
    (max
      ((f.incomeAmount + f.lossOffset - f.profitAddback) * 40 / 100)
      (prorated 20_000_000 f.months))
    (if f.retainedEarningsExCurrent < f.capital * 25 / 100
     then f.capital * 25 / 100 - f.retainedEarningsExCurrent else 0)

/-- Spec: 留保金額 — 留保した金額 minus the three statutory credit blocks (art. 67(3)). -/
def specRetainedAmount (f : CloselyHeldFacts) : Money :=
  f.retainedBeforeCredits - (f.baseCorporateTax + f.localCorporateTax + f.inhabitantTaxes)

/-- Spec: the surtax by direct case analysis on the excess (art. 67(1) 一〜三号). -/
def specSpecialSurtax (f : CloselyHeldFacts) : Money :=
  if !f.isSpecifiedCloselyHeld then 0 else
  let t1 := prorated 30_000_000 f.months
  let t2 := prorated 100_000_000 f.months
  let excess := specRetainedAmount f - specRetentionDeduction f
  if excess ≤ t1 then excess * 10 / 100
  else if excess ≤ t2 then t1 * 10 / 100 + (excess - t1) * 15 / 100
  else t1 * 10 / 100 + (t2 - t1) * 15 / 100 + (excess - t2) * 20 / 100

/-- Spec: the art. 67(1) total — 前条等の法人税の額 plus the surtax. -/
def specTotalTaxWithSurtax (f : CloselyHeldFacts) : Money :=
  f.baseCorporateTax + specSpecialSurtax f

-- ==== points, all kernel-decided ====

-- Example A — deduction driven by the 25%-of-capital shortfall; excess 7M in band 1
example : specSpecialSurtax ⟨true, 100_000_000, 0, 0, 80_000_000, 20_000_000, 1_000_000,
    2_000_000, 0, 200_000_000, 12⟩ = 700_000 := by decide

-- Example B — deduction driven by the 40%-of-income leg; excess exactly at tier 1
example : specSpecialSurtax ⟨true, 100_000_000, 0, 0, 100_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 3_000_000 := by decide

-- Example C — excess 80M straddles tier 1 and tier 2
example : specSpecialSurtax ⟨true, 100_000_000, 0, 0, 150_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 10_500_000 := by decide

-- Example D — excess 130M reaches band 3
example : specSpecialSurtax ⟨true, 100_000_000, 0, 0, 200_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 19_500_000 := by decide

-- Example E — not a specified closely-held corporation: no surtax at all
example : specSpecialSurtax ⟨false, 100_000_000, 0, 0, 100_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 0 := by decide

-- Example F — retained amount does not exceed the deduction: no surtax
example : specSpecialSurtax ⟨true, 100_000_000, 0, 0, 40_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 0 := by decide

-- Example G — 6-month fiscal year: tiers and the ¥20M floor are month-prorated
example : specSpecialSurtax ⟨true, 12_000_000, 0, 0, 20_000_000, 1_000_000, 0,
    0, 0, 0, 6⟩ = 900_000 := by decide

-- Example H — 18-month window: full-year amounts apply (art. 67(6) is 1年未満のみ)
example : specSpecialSurtax ⟨true, 12_000_000, 0, 0, 30_000_000, 1_000_000, 0,
    0, 0, 0, 18⟩ = 900_000 := by decide

-- Example I — 11-month fiscal year: tier 2 slices at floor(100_000_000/12)*11
example : specSpecialSurtax ⟨true, 200_000_000, 0, 0, 280_000_000, 27_000_000, 2_000_000,
    1_000_000, 0, 0, 11⟩ = 28_041_666 := by decide

-- Art. 67(5) 一号 with a 第64条の5 adjustment: 100M + 30M − 10M = 120M → 40% = 48M
example : specRetentionDeduction ⟨true, 100_000_000, 30_000_000, 10_000_000, 0, 0, 0,
    0, 10_000_000, 10_000_000, 12⟩ = 48_000_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at the sample
    points that exercise every band, both proration paths and both eligibility
    endpoints. Points are sample points, not a proof of universal equivalence. -/
def agreePoints : Bool :=
  let a := CloselyHeldFacts.mk true  100_000_000 0 0 80_000_000  20_000_000 1_000_000 2_000_000 0 200_000_000 12
  let b := CloselyHeldFacts.mk true  100_000_000 0 0 100_000_000 27_000_000 2_000_000 1_000_000 10_000_000 10_000_000 12
  let c := CloselyHeldFacts.mk true  100_000_000 0 0 150_000_000 27_000_000 2_000_000 1_000_000 10_000_000 10_000_000 12
  let d := CloselyHeldFacts.mk true  100_000_000 0 0 200_000_000 27_000_000 2_000_000 1_000_000 10_000_000 10_000_000 12
  let e := CloselyHeldFacts.mk false 100_000_000 0 0 100_000_000 27_000_000 2_000_000 1_000_000 10_000_000 10_000_000 12
  let f := CloselyHeldFacts.mk true  100_000_000 0 0 40_000_000  27_000_000 2_000_000 1_000_000 10_000_000 10_000_000 12
  let g := CloselyHeldFacts.mk true  12_000_000  0 0 20_000_000  1_000_000  0 0 0 0 6
  let h := CloselyHeldFacts.mk true  12_000_000  0 0 30_000_000  1_000_000  0 0 0 0 18
  let i := CloselyHeldFacts.mk true  200_000_000 0 0 280_000_000 27_000_000 2_000_000 1_000_000 0 0 11
  let j := CloselyHeldFacts.mk true  100_000_000 30_000_000 10_000_000 200_000_000 27_000_000 2_000_000 1_000_000 10_000_000 10_000_000 12
  (specialSurtax a == specSpecialSurtax a) &&
  (specialSurtax b == specSpecialSurtax b) &&
  (specialSurtax c == specSpecialSurtax c) &&
  (specialSurtax d == specSpecialSurtax d) &&
  (specialSurtax e == specSpecialSurtax e) &&
  (specialSurtax f == specSpecialSurtax f) &&
  (specialSurtax g == specSpecialSurtax g) &&
  (specialSurtax h == specSpecialSurtax h) &&
  (specialSurtax i == specSpecialSurtax i) &&
  (specialSurtax j == specSpecialSurtax j) &&
  (totalTaxWithSurtax a == specTotalTaxWithSurtax a) &&
  (totalTaxWithSurtax i == specTotalTaxWithSurtax i)

example : agreePoints = true := by decide

end JapanTaxLaw

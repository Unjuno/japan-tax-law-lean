import JapanTaxLaw.CorporateSurtax

/-!
# CorporateSurtax tests — 法人税法 art. 67 smoke checks

Decidable smoke tests for the specified closely-held corporation surtax model
(art. 67), pinned to
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01

Each `example` covers an art. 67 boundary: band 1/2/3 of art. 67(1) for the
excess of retained earnings over the retention deduction, the three
retention-deduction legs of art. 67(5), the month proration of art. 67(6)
(including the ¥100M tier slicing at 11 months), the not-qualifying case
(art. 67(1) 括弧書き), and the zero-excess case.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- Example A — retention deduction driven by the 25%-of-capital shortfall (art. 67(5) 三号)
example : specialSurtax ⟨true, 100_000_000, 0, 0, 80_000_000, 20_000_000, 1_000_000,
    2_000_000, 0, 200_000_000, 12⟩ = 700_000 := by decide
example : totalTaxWithSurtax ⟨true, 100_000_000, 0, 0, 80_000_000, 20_000_000, 1_000_000,
    2_000_000, 0, 200_000_000, 12⟩ = 20_700_000 := by decide

-- Example B — deduction driven by the 40%-of-income leg; excess exactly ¥30,000,000 (art. 67(5) 一号)
example : retentionDeduction ⟨true, 100_000_000, 0, 0, 100_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 40_000_000 := by decide
example : specialSurtax ⟨true, 100_000_000, 0, 0, 100_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 3_000_000 := by decide

-- Example C — excess ¥80,000,000 straddles band 1 and band 2 (art. 67(1) 一・二号)
example : specialSurtax ⟨true, 100_000_000, 0, 0, 150_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 10_500_000 := by decide

-- Example D — excess ¥130,000,000 reaches band 3 (art. 67(1) 三号)
example : specialSurtax ⟨true, 100_000_000, 0, 0, 200_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 19_500_000 := by decide

-- Example E — not a specified closely-held corporation: no surtax (art. 67(1) 括弧書き)
example : specialSurtax ⟨false, 100_000_000, 0, 0, 100_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 0 := by decide
example : totalTaxWithSurtax ⟨false, 100_000_000, 0, 0, 100_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 27_000_000 := by decide

-- Example F — retained amount within the deduction: no surtax
example : specialSurtax ⟨true, 100_000_000, 0, 0, 40_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 0 := by decide

-- Example G — 6-month fiscal year: tier 1 = ¥15,000,000, ¥20M floor = ¥9,999,996 (art. 67(6))
example : prorated 100_000_000 6 = 49_999_998 := by decide
example : prorated 20_000_000 6 = 9_999_996 := by decide
example : specialSurtax ⟨true, 12_000_000, 0, 0, 20_000_000, 1_000_000, 0,
    0, 0, 0, 6⟩ = 900_000 := by decide

-- Example H — 18-month window: full-year amounts apply (art. 67(6) is 1年未満のみ)
example : prorated 100_000_000 18 = 100_000_000 := by decide
example : specialSurtax ⟨true, 12_000_000, 0, 0, 30_000_000, 1_000_000, 0,
    0, 0, 0, 18⟩ = 900_000 := by decide

-- Example I — 11-month fiscal year: tier 2 slices at floor(100,000,000/12)×11 = 91,666,663
example : prorated 30_000_000 11 = 27_500_000 := by decide
example : prorated 100_000_000 11 = 91_666_663 := by decide
example : specialSurtax ⟨true, 200_000_000, 0, 0, 280_000_000, 27_000_000, 2_000_000,
    1_000_000, 0, 0, 11⟩ = 28_041_666 := by decide

-- Example J — deduction driven by the 25%-of-capital shortfall: ded = ¥40,000,000
example : capitalShortfall ⟨true, 1_000_000, 0, 0, 0, 0, 0,
    0, 10_000_000, 200_000_000, 12⟩ = 40_000_000 := by decide
example : specialSurtax ⟨true, 1_000_000, 0, 0, 95_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 200_000_000, 12⟩ = 2_500_000 := by decide

-- Example K — art. 67(5) 一号 with a 第64条の5 adjustment: (100M + 30M − 10M) × 40% = 48,000,000
example : incomeFortyPct ⟨true, 100_000_000, 30_000_000, 10_000_000, 200_000_000,
    27_000_000, 2_000_000, 1_000_000, 10_000_000, 10_000_000, 12⟩ = 48_000_000 := by decide
example : specialSurtax ⟨true, 100_000_000, 30_000_000, 10_000_000, 200_000_000,
    27_000_000, 2_000_000, 1_000_000, 10_000_000, 10_000_000, 12⟩ = 17_900_000 := by decide

-- Boundary: retained amount exactly equal to the deduction (40,000,000) → no surtax
example : specialSurtax ⟨true, 100_000_000, 0, 0, 70_000_000, 27_000_000, 2_000_000,
    1_000_000, 10_000_000, 10_000_000, 12⟩ = 0 := by decide

-- Retention deduction exactly meets the 40% leg; capital shortfall beats it (art. 67(5))
example : capitalShortfall ⟨true, 1_000_000, 0, 0, 0, 0, 0,
    0, 0, 400_000_000, 12⟩ = 100_000_000 := by decide

end JapanTaxLaw

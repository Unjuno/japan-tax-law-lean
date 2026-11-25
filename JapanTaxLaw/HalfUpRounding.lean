import JapanTaxLaw.TaxFinance

/-!
# HalfUpRounding — 四捨五入（端数処理）規定

Units state 四捨五入 at thresholds 千円, 一万円 and 百万円 (round to the
nearest threshold multiple, halves upward). The generic `roundHalfUp`
function is shared by the associated `CeilRoundingMinimum` and
`FloorRoundingMinimum` families; exact per-unit counts are kept in the
durable `data/evidence_audits/` JSON ledgers rather than in this header.
The underlying amount computation is caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.HalfUpRounding

/-- 端数を四捨五入（half up）: threshold 未満の端数を丸める。 -/
def roundHalfUp (amount threshold : Nat) : Nat :=
  if threshold = 0 then amount
  else if 2 * (amount % threshold) < threshold then amount - amount % threshold
  else amount + (threshold - amount % threshold)

def roundHalfUpThousand (amount : Nat) : Nat := roundHalfUp amount 1000
def roundHalfUpMillion (amount : Nat) : Nat := roundHalfUp amount 1_000_000
def roundHalfUpTenThousand (amount : Nat) : Nat := roundHalfUp amount 10_000

example : roundHalfUpThousand 1_499 = 1_000 := by decide
example : roundHalfUpThousand 1_500 = 2_000 := by decide
example : roundHalfUpThousand 1_501 = 2_000 := by decide
example : roundHalfUpMillion 1_499_999 = 1_000_000 := by decide
example : roundHalfUpMillion 1_500_000 = 2_000_000 := by decide

end JapanTaxLaw.HalfUpRounding

import JapanTaxLaw.TaxFinance

/-!
# HalfUpRounding — 73 の 四捨五入（端数処理）規定

Most units state: 千円未満の端数があるときは、その端数を四捨五入する
(round to the nearest 1,000 yen, halves upward). One unit uses 百万円.
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

example : roundHalfUpThousand 1_499 = 1_000 := by decide
example : roundHalfUpThousand 1_500 = 2_000 := by decide
example : roundHalfUpThousand 1_501 = 2_000 := by decide
example : roundHalfUpMillion 1_499_999 = 1_000_000 := by decide
example : roundHalfUpMillion 1_500_000 = 2_000_000 := by decide

end JapanTaxLaw.HalfUpRounding

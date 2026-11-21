import JapanTaxLaw.TaxAccountantFineCap300k
import JapanTaxLaw.TaxAccountantFineCap300kSpec

/-
# TaxAccountantFineCap300kTests — kernel-decided boundary checks for 税理士法 第六十二条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 三十万円 (= 300,000) threshold neighbourhood, saturation/identity, and
impl/spec agreement on the boundary grid.

Pinned source: law 326AC1000000237, revision 326AC1000000237_20251001_505AC0000000053,
sha256 46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f,
Article Num 62, needle「三十万円以下の罰金」.
-/

namespace JapanTaxLaw.TaxAccountantFineCap300k

-- (a) zero amount is within the cap.
example : withinFineCap 0 = true := by decide

-- (b) small positive inputs and the 三十万円 threshold neighbourhood.
example : withinFineCap 1 = true := by decide
example : withinFineCap 2 = true := by decide
example : withinFineCap 299_999 = true := by decide
example : withinFineCap 300_000 = true := by decide
example : withinFineCap 300_001 = false := by decide

-- (c) saturation / identity at the statutory cap 三十万円 (= 300,000).
example : 300_000 - 300_000 = 0 := by decide
example : fineCap = 300_000 := by decide
example : fineCap <= 300_000 := by decide

-- (d) the named impl theorems apply at the boundary points.
example : withinFineCap 299_999 = true := below_cap_true
example : withinFineCap 300_000 = true := at_cap_true
example : withinFineCap 300_001 = false := above_cap_false
example : withinFineCap 0 = true := zero_true

-- direct-inequality monotonicity (no `Monotone`), universal.
example {amount amount' : Nat} (h : withinFineCap amount = true)
    (hle : amount' <= amount) : withinFineCap amount' = true :=
  withinFineCap_of_le h hle

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : withinFineCap 0 = specWithin 0 := by decide
example : withinFineCap 1 = specWithin 1 := by decide
example : withinFineCap 299_999 = specWithin 299_999 := by decide
example : withinFineCap 300_000 = specWithin 300_000 := by decide
example : withinFineCap 300_001 = specWithin 300_001 := by decide
example (x : Nat) : withinFineCap x = specWithin x := agreeWithin x

end JapanTaxLaw.TaxAccountantFineCap300k

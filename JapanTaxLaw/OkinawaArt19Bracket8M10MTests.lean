import JapanTaxLaw.OkinawaArt19Bracket8M10MSpec

/-
# OkinawaArt19Bracket8M10MTests — kernel-decided checks for 沖縄特例政令 art.19(1)(3)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: zero, small input, both boundaries of the
八百万円以上千万円未満 bracket, a Nat identity at the lower bound, and
impl/spec agreement at boundary points.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket8M10M

-- (a) pinned statutory values.
example : lowerBound = 8_000_000 := rfl
example : upperBound = 10_000_000 := rfl

-- (b) zero and small positive inputs are outside the bracket.
example : inBracket 0 = false := by decide
example : inBracket 1 = false := by decide

-- (c) just below the lower bound fails.
example : inBracket 7_999_999 = false := by decide

-- (d) 以上 is inclusive: exactly 八百万円 qualifies.
example : inBracket 8_000_000 = true := by decide

-- (e) just below the upper bound qualifies; 未満 is exclusive at 千万円.
example : inBracket 9_999_999 = true := by decide
example : inBracket 10_000_000 = false := by decide

-- (f) Nat identity / saturation at the lower bound.
example : 8_000_000 + 0 = 8_000_000 := by decide

-- (g) kernel-decided impl/spec agreement at boundary points.
example : inBracket 8_000_000 = specInBracket 8_000_000 := by decide
example : inBracket 10_000_000 = specInBracket 10_000_000 := by decide
example : inBracket 0 = specInBracket 0 := by decide

-- (h) universal theorem applied to an arbitrary amount.
example (x : Nat) : inBracket x = specInBracket x := agree_bracket x

-- (i) independent spec constants are the same statutory values.
example : specLowerBound = 8_000_000 := rfl
example : specUpperBound = 10_000_000 := rfl

end JapanTaxLaw.OkinawaArt19Bracket8M10M

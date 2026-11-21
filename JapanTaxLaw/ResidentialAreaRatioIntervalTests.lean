import JapanTaxLaw.ResidentialAreaRatioInterval
import JapanTaxLaw.ResidentialAreaRatioIntervalSpec

/-
# ResidentialAreaRatioIntervalTests — kernel-decided checks (地価税法施行令 第九条)

Pinned: law 403CO0000000174 / revision 403CO0000000174_20250722_507CO0000000249.
Every check is a closed Nat/Bool expression discharged by `by decide`, or the
universal impl/spec bridge theorem. Coverage: zero total, the 25%/26%/50%/51%
boundaries (超え strict / 以下 inclusive), small positive inputs, Nat
cross-multiplication saturation identities, and impl/spec agreement.
-/

namespace JapanTaxLaw.ResidentialAreaRatioInterval

-- (a) zero total: undefined ratio, treated as not applying.
example : ratioInInterval 26 0 = false := by decide
example : ratioInInterval 0 0 = false := by decide
example : specInInterval 26 0 = false := by decide

-- (b) the explicit interval boundaries from the pinned 原文.
example : ratioInInterval 25 100 = false := by decide  -- 25% は 超え でない
example : ratioInInterval 26 100 = true := by decide   -- 26% は > 25%
example : ratioInInterval 50 100 = true := by decide   -- 50% は 以下 inclusive
example : ratioInInterval 51 100 = false := by decide  -- 51% は > 50%
example : specInInterval 25 100 = false := by decide
example : specInInterval 26 100 = true := by decide
example : specInInterval 50 100 = true := by decide
example : specInInterval 51 100 = false := by decide

-- (c) small positive inputs (exact integer cross-multiplication).
example : ratioInInterval 1 3 = true := by decide   -- 100*1=100, 25*3=75, 50*3=150
example : ratioInInterval 1 4 = false := by decide  -- exactly 25% -> excluded
example : ratioInInterval 13 40 = true := by decide -- 1300/40 = 32.5%
example : ratioInInterval 1 100 = false := by decide

-- (d) Nat cross-multiplication saturation / identity boundaries.
example : 100 * 26 - 25 * 100 = 100 := by decide
example : 100 * 25 - 25 * 100 = 0 := by decide
example : 0 * 0 = 0 := by decide

-- (e) impl/spec agreement: concrete points plus the universal omega bridge.
example : ratioInInterval 26 100 = specInInterval 26 100 := by decide
example : ratioInInterval 25 100 = specInInterval 25 100 := by decide
example : ratioInInterval 50 100 = specInInterval 50 100 := by decide
example : ratioInInterval 26 0 = specInInterval 26 0 := by decide
example (residential total : Nat) :
    ratioInInterval residential total = specInInterval residential total := by
  exact agree_ratioInInterval residential total

end JapanTaxLaw.ResidentialAreaRatioInterval

import JapanTaxLaw.TonTaxPunishment
import JapanTaxLaw.TonTaxPunishmentSpec

/-
# TonTaxPunishmentTests — kernel-decided checks for とん税法 第十二条（罰則）

Pinned to law 332AC0000000037 / revision 332AC0000000037_20250601_504AC0000000068.
Every check is a closed Nat/Bool expression discharged by `by decide`, or a
universal Nat fact closed by `omega` / theorem application.

Coverage: zero, small positives, year ceilings (3 within / 4 over), yen ceilings
(499999 / 500000 within, 500001 over), all four sentencing flag combinations
(imprisonment-only, fine-only, concurrent both, neither), impl/spec agreement at
points and universally, plus inclusive-「以下」 Nat boundary identities.
-/

namespace JapanTaxLaw.TonTaxPunishment

-- (a) zero input is within both ceilings.
example : withinImprisonmentCeiling 0 = true := by decide
example : withinFineCeiling 0 = true := by decide
example : specWithinImprisonment 0 = true := by decide
example : specWithinFine 0 = true := by decide

-- (b) small positive inputs.
example : withinImprisonmentCeiling 1 = true := by decide
example : withinImprisonmentCeiling 2 = true := by decide
example : withinFineCeiling 3 = true := by decide

-- (c) year ceiling: 以下 is inclusive (3 within, 4 over).
example : withinImprisonmentCeiling 3 = true := by decide
example : withinImprisonmentCeiling 4 = false := by decide
example : specWithinImprisonment 3 = true := by decide
example : specWithinImprisonment 4 = false := by decide

-- (d) yen ceiling: 499999 / 500000 within, 500001 over.
example : withinFineCeiling 499_999 = true := by decide
example : withinFineCeiling 500_000 = true := by decide
example : withinFineCeiling 500_001 = false := by decide
example : specWithinFine 499_999 = true := by decide
example : specWithinFine 500_000 = true := by decide
example : specWithinFine 500_001 = false := by decide

-- (e) sentencing modes.
example : validSentence 3 500_000 true true = true := by decide   -- concurrent both, at ceilings
example : validSentence 4 500_001 true true = false := by decide  -- concurrent both, over ceilings
example : validSentence 2 0 true false = true := by decide        -- imprisonment only
example : validSentence 3 500_001 true false = true := by decide   -- unapplied fine ignored
example : validSentence 0 500_000 false true = true := by decide  -- fine only
example : validSentence 4 500_000 false true = true := by decide   -- unapplied imprisonment ignored
example : validSentence 0 0 false false = false := by decide
example : specSentenceValid 3 500_000 true true = true := by decide
example : specSentenceValid 0 0 false false = false := by decide

-- (f) decoded constants, impl and spec.
example : imprisonmentCeilingYears = 3 := by decide
example : fineCeilingYen = 500_000 := by decide
example : specImprisonmentCeiling = 3 := by decide
example : specFineCeiling = 500_000 := by decide

-- (g) impl/spec agreement at boundary points and universally.
example : withinImprisonmentCeiling 3 = specWithinImprisonment 3 := by decide
example : withinImprisonmentCeiling 4 = specWithinImprisonment 4 := by decide
example : withinFineCeiling 500_000 = specWithinFine 500_000 := by decide
example : withinFineCeiling 500_001 = specWithinFine 500_001 := by decide
example : validSentence 3 500_000 true true = specSentenceValid 3 500_000 true true := by decide
example (years yen : Nat) (imprisoned fined : Bool) :
    validSentence years yen imprisoned fined = specSentenceValid years yen imprisoned fined := by
  exact agreeSentence years yen imprisoned fined

-- (h) monotonicity in leniency, via the universal impl theorem (`omega`-proved).
theorem lenient_at_ceiling {years' yen' : Nat} (hy : years' <= 3) (hyen : yen' <= 500_000) :
    validSentence years' yen' true true = true := by
  exact monotonic_leniency at_ceiling_concurrent hy hyen

-- (i) inclusive-「以下」 Nat boundary identities / saturating subtraction.
example : 3 - 4 = 0 := by decide
example : 500_000 - 500_000 = 0 := by decide
example : 500_000 - 0 = 500_000 := by decide

end JapanTaxLaw.TonTaxPunishment

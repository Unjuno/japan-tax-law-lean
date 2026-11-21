import JapanTaxLaw.ThousandYenTruncationSpec

/-
# ThousandYenTruncationTests — 石油ガス譲与税法施行規則 art.5 smoke checks

Pinned source: law 341M50000008002 / revision 341M50000008002_20191128_501M60000008059.
境界: 999→0, 1000→1000, 1500→1000, 12345→12000, saturation 100000→100000.
All Nat/Bool, kernel-decided; finite smoke checks only (the universal proofs
live in the implementation and in `agreeTruncation`).
-/

namespace JapanTaxLaw.ThousandYenTruncation

-- Implementation: zero, small positives, exact unit, rounding-down, saturation.
example : roundingUnit = 1_000 := by decide
example : truncateThousand 0 = 0 := by decide
example : truncateThousand 1 = 0 := by decide
example : truncateThousand 999 = 0 := by decide
example : truncateThousand 1_000 = 1_000 := by decide
example : truncateThousand 1_500 = 1_000 := by decide
example : truncateThousand 12_345 = 12_000 := by decide
example : truncateThousand 100_000 = 100_000 := by decide

-- Idempotence (kernel-decided spot checks).
example : truncateThousand (truncateThousand 12_345) = truncateThousand 12_345 := by decide
example : truncateThousand (truncateThousand 1_501) = 1_000 := by decide

-- Independent spec: the same boundary points via floor division.
example : specRoundingUnit = 1_000 := by decide
example : specTruncate 0 = 0 := by decide
example : specTruncate 999 = 0 := by decide
example : specTruncate 1_000 = 1_000 := by decide
example : specTruncate 1_500 = 1_000 := by decide
example : specTruncate 12_345 = 12_000 := by decide

-- Impl/spec agreement at several points (kernel-decided Bool grid).
def agreeTruncationGrid : Bool :=
  [0, 1, 999, 1_000, 1_001, 1_500, 12_345, 100_000].all fun a =>
    truncateThousand a == specTruncate a

example : agreeTruncationGrid = true := by decide

end JapanTaxLaw.ThousandYenTruncation

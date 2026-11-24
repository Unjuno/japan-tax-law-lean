import JapanTaxLaw.StatutoryFractions

/-!
# StatutoryFractionsSpec — 独立分数表と全称照合証明

Independent association list; `agreeFractions` proves implementation == table
lookup for ALL 16 constructors by exhaustive case analysis.
-/

namespace JapanTaxLaw.StatutoryFractions

/-- 独立分数表（原文の漢数字を算用数字に対応させた対）。 -/
def fractionTable : List (FractionKind × Nat × Nat) :=
  [ (FractionKind.f22_78, 22, 78), (FractionKind.f1_3, 1, 3),
    (FractionKind.f1_2, 1, 2), (FractionKind.f1_5, 1, 5),
    (FractionKind.f4_5, 4, 5), (FractionKind.f1_10, 1, 10),
    (FractionKind.f9_10, 9, 10), (FractionKind.f90_100, 90, 100),
    (FractionKind.f94_100, 94, 100), (FractionKind.f25_100, 25, 100),
    (FractionKind.f5_100, 5, 100), (FractionKind.f50_100, 50, 100),
    (FractionKind.f80_100, 80, 100), (FractionKind.f6_100, 6, 100),
    (FractionKind.f60_100, 60, 100), (FractionKind.f10_100, 10, 100) ]

def specFraction (k : FractionKind) : Nat × Nat :=
  match fractionTable.find? (fun p => p.1 == k) with
  | some p => (p.2.1, p.2.2)
  | none => (0, 1)

/-- 実装 ≡ 独立表（全 16 規定を網羅する全称証明）。 -/
theorem agreeFractions (k : FractionKind) : fractionOf k = specFraction k := by
  cases k <;> native_decide

end JapanTaxLaw.StatutoryFractions

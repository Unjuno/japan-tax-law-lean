import JapanTaxLaw.PenaltyCaps

/-! Independent cap table and universal agreement over all 23 constructors. -/

namespace JapanTaxLaw.PenaltyCaps

def capTable : List (PenaltyKind × Nat × Nat) :=
[
    (PenaltyKind.p00, 300000, 0),
    (PenaltyKind.p01, 300000, 1),
    (PenaltyKind.p02, 30000000, 5),
    (PenaltyKind.p03, 3000000, 5),
    (PenaltyKind.p04, 200000, 0),
    (PenaltyKind.p05, 200000, 0),
    (PenaltyKind.p06, 2000000, 1),
    (PenaltyKind.p07, 2000000, 10),
    (PenaltyKind.p08, 50000, 0),
    (PenaltyKind.p09, 500000, 0),
    (PenaltyKind.p10, 500000, 1),
    (PenaltyKind.p11, 500000, 3),
    (PenaltyKind.p12, 5000000, 3),
    (PenaltyKind.p13, 5000000, 5),
    (PenaltyKind.p14, 100000, 0),
    (PenaltyKind.p15, 10000000, 5),
    (PenaltyKind.p16, 10000000, 10),
    (PenaltyKind.p17, 1000000, 0),
    (PenaltyKind.p18, 1000000, 1),
    (PenaltyKind.p19, 1000000, 3),
    (PenaltyKind.p20, 1000000, 2),
    (PenaltyKind.p21, 1000000, 5),
    (PenaltyKind.p22, 1000000, 10),
]

def specFine (k : PenaltyKind) : Nat × Nat :=
  match capTable.find? (fun p => p.1 == k) with
  | some p => (p.2.1, p.2.2)
  | none => (0, 0)

theorem agreeCaps (k : PenaltyKind) : fineOf k = specFine k := by
  cases k <;> native_decide

end JapanTaxLaw.PenaltyCaps

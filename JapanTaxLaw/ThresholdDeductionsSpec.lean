import JapanTaxLaw.ThresholdDeductions

set_option maxRecDepth 10000

/-! Independent specs: reversed-comparison table forms. -/

namespace JapanTaxLaw.ThresholdDeductions

def specSpouse (income : Nat) (elder : Bool) : Nat :=
  if 9_000_000 < income then
    if 9_500_000 < income then
      if 10_000_000 < income then 0 else (if elder then 160_000 else 130_000)
    else (if elder then 320_000 else 260_000)
  else (if elder then 480_000 else 380_000)

theorem spouse_agrees (income : Nat) (elder : Bool) :
    spouseDeduction income elder = specSpouse income elder := by
  unfold spouseDeduction specSpouse
  by_cases h1 : income ≤ 9_000_000
  · have n1 : ¬ 9_000_000 < income := by omega
    simp [h1, n1]
  · have p1 : 9_000_000 < income := by omega
    by_cases h2 : income ≤ 9_500_000
    · have n2 : ¬ 9_500_000 < income := by omega
      simp [h1, p1, h2, n2]
    · have p2 : 9_500_000 < income := by omega
      by_cases h3 : income ≤ 10_000_000
      · have n3 : ¬ 10_000_000 < income := by omega
        simp [h1, p1, h2, p2, h3, n3]
      · have p3 : 10_000_000 < income := by omega
        simp [h1, p1, h2, p2, h3, p3]

def specLongTerm (premium : Nat) : Nat :=
  if 10_000 < premium then
    if 20_000 < premium then 15_000 else 10_000 + (premium - 10_000) / 2
  else premium

theorem longTerm_agrees (premium : Nat) : longTermDeduction premium = specLongTerm premium := by
  unfold longTermDeduction specLongTerm
  by_cases h1 : premium ≤ 10_000
  · have n1 : ¬ 10_000 < premium := by omega
    simp [h1, n1]
  · have p1 : 10_000 < premium := by omega
    by_cases h2 : premium ≤ 20_000
    · have n2 : ¬ 20_000 < premium := by omega
      simp [h1, p1, h2, n2]
    · have p2 : 20_000 < premium := by omega
      simp [h1, p1, h2, p2]

end JapanTaxLaw.ThresholdDeductions

/-!
# PopulationDensityBands — 処理区域内人口密度の四区分（36 units）

Pinned sources (2026-11 snapshot revisions):
- 505M60000008043 art.2 (item 3 / item 5 / item 35)
- 507M60000008043 art.2 (item 3 / item 5 / item 41)
- 508M60000008066 art.2 (item 3 / item 5 / item 45)

All 36 units express the same four-band partition of 処理区域内人口密度:
  [25,50) [50,75) [75,100) [100,∞)  persons per hectare
(「以上」 lower-inclusive, 「未満」 upper-exclusive, last band open-ended).

d is a caller-established Nat density. The four bands are jointly exhaustive
for d >= 25 (the first band's lower edge) and globally pairwise exclusive.
Nine source groups (3 laws x 3 items) share one kernel-proven function; aliases
and cross-group identity theorems record that structure.
Nothing else about the calculation or legal effect is modelled.
-/
namespace JapanTaxLaw.PopulationDensityBands

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (25 <= d ∧ d < 50)
  | 1 => decide (50 <= d ∧ d < 75)
  | 2 => decide (75 <= d ∧ d < 100)
  | _ => decide (100 <= d)

def pickVal (d : Nat) : Nat :=
  if d < 50 then 0 else if d < 75 then 1 else if d < 100 then 2 else 3

theorem pickVal_lt_four (d : Nat) : pickVal d < 4 := by
  unfold pickVal
  by_cases h0 : d < 50 <;> simp [h0]
  by_cases h1 : d < 75 <;> simp [h0, h1]
  by_cases h2 : d < 100 <;> simp [h0, h1, h2]

theorem pickVal_inBand (d : Nat) (hd : 25 <= d) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d < 50
  · simp [h0, hd]
  · by_cases h1 : d < 75
    · simp [h0, h1]
      omega
    · by_cases h2 : d < 100
      · simp [h0, h1, h2]
        omega
      · simp [h0, h1, h2]
        omega

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 4)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi.2]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      have hn0 : ¬ d < 50 := by omega
      simp [pickVal, hn0, hi.2]
    · by_cases h2 : i = 2
      · subst i
        simp [inBand] at hi
        have hn0 : ¬ d < 50 := by omega
        have hn1 : ¬ d < 75 := by omega
        simp [pickVal, hn0, hn1, hi.2]
      · have hi3 : i = 3 := by omega
        subst i
        simp [inBand] at hi
        have hn0 : ¬ d < 50 := by omega
        have hn1 : ¬ d < 75 := by omega
        have hn2 : ¬ d < 100 := by omega
        simp [pickVal, hn0, hn1, hn2]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 4) (hjl : j < 4)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) (hd : 25 <= d) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d hd⟩

-- nine source groups, identical band structure
namespace G505_3
def inBand := JapanTaxLaw.PopulationDensityBands.inBand
end G505_3
namespace G505_5
def inBand := JapanTaxLaw.PopulationDensityBands.inBand
end G505_5
namespace G505_35
def inBand := JapanTaxLaw.PopulationDensityBands.inBand
end G505_35
namespace G507_3
def inBand := JapanTaxLaw.PopulationDensityBands.inBand
end G507_3
namespace G507_5
def inBand := JapanTaxLaw.PopulationDensityBands.inBand
end G507_5
namespace G507_41
def inBand := JapanTaxLaw.PopulationDensityBands.inBand
end G507_41
namespace G508_3
def inBand := JapanTaxLaw.PopulationDensityBands.inBand
end G508_3
namespace G508_5
def inBand := JapanTaxLaw.PopulationDensityBands.inBand
end G508_5
namespace G508_45
def inBand := JapanTaxLaw.PopulationDensityBands.inBand
end G508_45

theorem cross_group_505_507 (i d : Nat) : G505_3.inBand i d = G507_3.inBand i d := by rfl
theorem cross_group_507_508 (i d : Nat) : G507_3.inBand i d = G508_3.inBand i d := by rfl
theorem all_nine_groups_agree (i d : Nat) :
    G505_3.inBand i d = G505_5.inBand i d ∧
    G505_3.inBand i d = G505_35.inBand i d ∧
    G505_3.inBand i d = G507_3.inBand i d ∧
    G505_3.inBand i d = G507_5.inBand i d ∧
    G505_3.inBand i d = G507_41.inBand i d ∧
    G505_3.inBand i d = G508_3.inBand i d ∧
    G505_3.inBand i d = G508_5.inBand i d ∧
    G505_3.inBand i d = G508_45.inBand i d := by
  simp [G505_3.inBand, G505_5.inBand, G505_35.inBand, G507_3.inBand,
        G507_5.inBand, G507_41.inBand, G508_3.inBand, G508_5.inBand, G508_45.inBand]

end JapanTaxLaw.PopulationDensityBands

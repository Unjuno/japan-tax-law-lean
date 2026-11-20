/-!
# PayloadCapacityBands — 325AC0000000226 art.154（最大積載量の九区分）

Pinned source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Nine units from the 最大積載量 table (（１）〜（９）):
  （１）一トン以下 （２）一トンを超え二トン以下 … （８）七トンを超え八トン以下
  （９）八トンを超えるもの

d : Nat is a caller-established payload in tons. The first band is d <= 1, the
last is open-ended (d > 8), so the nine bands cover ALL d : Nat. Lower-exclusive
「超え」, upper-inclusive 「以下」. Finite index (9), universally quantified d.
-/
namespace JapanTaxLaw.PayloadCapacityBands

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (d <= 1)
  | 1 => decide (1 < d ∧ d <= 2)
  | 2 => decide (2 < d ∧ d <= 3)
  | 3 => decide (3 < d ∧ d <= 4)
  | 4 => decide (4 < d ∧ d <= 5)
  | 5 => decide (5 < d ∧ d <= 6)
  | 6 => decide (6 < d ∧ d <= 7)
  | 7 => decide (7 < d ∧ d <= 8)
  | _ => decide (8 < d)

def pickVal (d : Nat) : Nat :=
  if d <= 1 then 0
  else if d <= 2 then 1
  else if d <= 3 then 2
  else if d <= 4 then 3
  else if d <= 5 then 4
  else if d <= 6 then 5
  else if d <= 7 then 6
  else if d <= 8 then 7
  else 8

theorem pickVal_lt_nine (d : Nat) : pickVal d < 9 := by
  unfold pickVal
  by_cases h0 : d <= 1 <;> simp [h0]
  by_cases h1 : d <= 2 <;> simp [h0, h1]
  by_cases h2 : d <= 3 <;> simp [h0, h1, h2]
  by_cases h3 : d <= 4 <;> simp [h0, h1, h2, h3]
  by_cases h4 : d <= 5 <;> simp [h0, h1, h2, h3, h4]
  by_cases h5 : d <= 6 <;> simp [h0, h1, h2, h3, h4, h5]
  by_cases h6 : d <= 7 <;> simp [h0, h1, h2, h3, h4, h5, h6]
  by_cases h7 : d <= 8 <;> simp [h0, h1, h2, h3, h4, h5, h6, h7]

theorem pickVal_inBand (d : Nat) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d <= 1
  · simp [h0]
  · by_cases h1 : d <= 2
    · simp [h0, h1]
      omega
    · by_cases h2 : d <= 3
      · simp [h0, h1, h2]
        omega
      · by_cases h3 : d <= 4
        · simp [h0, h1, h2, h3]
          omega
        · by_cases h4 : d <= 5
          · simp [h0, h1, h2, h3, h4]
            omega
          · by_cases h5 : d <= 6
            · simp [h0, h1, h2, h3, h4, h5]
              omega
            · by_cases h6 : d <= 7
              · simp [h0, h1, h2, h3, h4, h5, h6]
                omega
              · by_cases h7 : d <= 8
                · simp [h0, h1, h2, h3, h4, h5, h6, h7]
                  omega
                · simp [h0, h1, h2, h3, h4, h5, h6, h7]
                  omega

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 9)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      have hn0 : ¬ d <= 1 := by omega
      simp [pickVal, hn0, hi.2]
    · by_cases h2 : i = 2
      · subst i
        simp [inBand] at hi
        have hn0 : ¬ d <= 1 := by omega
        have hn1 : ¬ d <= 2 := by omega
        simp [pickVal, hn0, hn1, hi.2]
      · by_cases h3 : i = 3
        · subst i
          simp [inBand] at hi
          have hn0 : ¬ d <= 1 := by omega
          have hn1 : ¬ d <= 2 := by omega
          have hn2 : ¬ d <= 3 := by omega
          simp [pickVal, hn0, hn1, hn2, hi.2]
        · by_cases h4 : i = 4
          · subst i
            simp [inBand] at hi
            have hn0 : ¬ d <= 1 := by omega
            have hn1 : ¬ d <= 2 := by omega
            have hn2 : ¬ d <= 3 := by omega
            have hn3 : ¬ d <= 4 := by omega
            simp [pickVal, hn0, hn1, hn2, hn3, hi.2]
          · by_cases h5 : i = 5
            · subst i
              simp [inBand] at hi
              have hn0 : ¬ d <= 1 := by omega
              have hn1 : ¬ d <= 2 := by omega
              have hn2 : ¬ d <= 3 := by omega
              have hn3 : ¬ d <= 4 := by omega
              have hn4 : ¬ d <= 5 := by omega
              simp [pickVal, hn0, hn1, hn2, hn3, hn4, hi.2]
            · by_cases h6 : i = 6
              · subst i
                simp [inBand] at hi
                have hn0 : ¬ d <= 1 := by omega
                have hn1 : ¬ d <= 2 := by omega
                have hn2 : ¬ d <= 3 := by omega
                have hn3 : ¬ d <= 4 := by omega
                have hn4 : ¬ d <= 5 := by omega
                have hn5 : ¬ d <= 6 := by omega
                simp [pickVal, hn0, hn1, hn2, hn3, hn4, hn5, hi.2]
              · by_cases h7 : i = 7
                · subst i
                  simp [inBand] at hi
                  have hn0 : ¬ d <= 1 := by omega
                  have hn1 : ¬ d <= 2 := by omega
                  have hn2 : ¬ d <= 3 := by omega
                  have hn3 : ¬ d <= 4 := by omega
                  have hn4 : ¬ d <= 5 := by omega
                  have hn5 : ¬ d <= 6 := by omega
                  have hn6 : ¬ d <= 7 := by omega
                  simp [pickVal, hn0, hn1, hn2, hn3, hn4, hn5, hn6, hi.2]
                · have hi8 : i = 8 := by omega
                  subst i
                  simp [inBand] at hi
                  have hn0 : ¬ d <= 1 := by omega
                  have hn1 : ¬ d <= 2 := by omega
                  have hn2 : ¬ d <= 3 := by omega
                  have hn3 : ¬ d <= 4 := by omega
                  have hn4 : ¬ d <= 5 := by omega
                  have hn5 : ¬ d <= 6 := by omega
                  have hn6 : ¬ d <= 7 := by omega
                  have hn7 : ¬ d <= 8 := by omega
                  simp [pickVal, hn0, hn1, hn2, hn3, hn4, hn5, hn6, hn7]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 9) (hjl : j < 9)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d⟩

end JapanTaxLaw.PayloadCapacityBands

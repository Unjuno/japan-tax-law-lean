/-!
# VehicleDisplacementBands — 325AC0000000226 art.154（総排気量の十区分）

Pinned source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
Article 154, Paragraph 1, TableStruct — ten table rows （１）〜（１０）.

原文の十区分（verbatim, U+3000 ideographic space after the index）:
  （１）総排気量が一リットル以下のもの
  （２）一リットルを超え、一・五リットル以下のもの
  （３）一・五リットルを超え、二リットル以下のもの
  （４）二リットルを超え、二・五リットル以下のもの
  （５）二・五リットルを超え、三リットル以下のもの
  （６）三リットルを超え、三・五リットル以下のもの
  （７）三・五リットルを超え、四リットル以下のもの
  （８）四リットルを超え、四・五リットル以下のもの
  （９）四・五リットルを超え、六リットル以下のもの
  （１０）六リットルを超えるもの

d : Nat は総排気量をデシリットル（0.1 リットル）単位で表した値
（caller-established）。一・五 / 二・五 等の小数境界は整数 15 / 25 として
丸めなしで正確に表現される。

Ten norms form a PARTITION: jointly exhaustive and pairwise exclusive over ALL
d : Nat. The index is finite (0..9) but d is universally quantified.
-/
namespace JapanTaxLaw.VehicleDisplacementBands

/-- 十区分のうち i 番目（0-based）が d に適用されるか（i < 10 を前提）。 -/
def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (d <= 10)
  | 1 => decide (10 < d ∧ d <= 15)
  | 2 => decide (15 < d ∧ d <= 20)
  | 3 => decide (20 < d ∧ d <= 25)
  | 4 => decide (25 < d ∧ d <= 30)
  | 5 => decide (30 < d ∧ d <= 35)
  | 6 => decide (35 < d ∧ d <= 40)
  | 7 => decide (40 < d ∧ d <= 45)
  | 8 => decide (45 < d ∧ d <= 60)
  | _ => decide (60 < d)

/-- 任意の d をちょうど一つの区分へ分類する（計算的定義）。 -/
def pickVal (d : Nat) : Nat :=
  if d <= 10 then 0
  else if d <= 15 then 1
  else if d <= 20 then 2
  else if d <= 25 then 3
  else if d <= 30 then 4
  else if d <= 35 then 5
  else if d <= 40 then 6
  else if d <= 45 then 7
  else if d <= 60 then 8
  else 9

theorem pickVal_lt_ten (d : Nat) : pickVal d < 10 := by
  unfold pickVal
  by_cases h0 : d <= 10 <;> simp [h0]
  by_cases h1 : d <= 15 <;> simp [h0, h1]
  by_cases h2 : d <= 20 <;> simp [h0, h1, h2]
  by_cases h3 : d <= 25 <;> simp [h0, h1, h2, h3]
  by_cases h4 : d <= 30 <;> simp [h0, h1, h2, h3, h4]
  by_cases h5 : d <= 35 <;> simp [h0, h1, h2, h3, h4, h5]
  by_cases h6 : d <= 40 <;> simp [h0, h1, h2, h3, h4, h5, h6]
  by_cases h7 : d <= 45 <;> simp [h0, h1, h2, h3, h4, h5, h6, h7]
  by_cases h8 : d <= 60 <;> simp [h0, h1, h2, h3, h4, h5, h6, h7, h8]

theorem pickVal_inBand (d : Nat) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d <= 10
  · simp [h0]
  · by_cases h1 : d <= 15
    · simp [h0, h1, Nat.lt_of_not_ge h0]
    · by_cases h2 : d <= 20
      · simp [h0, h1, h2, Nat.lt_of_not_ge h1]
      · by_cases h3 : d <= 25
        · simp [h0, h1, h2, h3, Nat.lt_of_not_ge h2]
        · by_cases h4 : d <= 30
          · simp [h0, h1, h2, h3, h4, Nat.lt_of_not_ge h3]
          · by_cases h5 : d <= 35
            · simp [h0, h1, h2, h3, h4, h5, Nat.lt_of_not_ge h4]
            · by_cases h6 : d <= 40
              · simp [h0, h1, h2, h3, h4, h5, h6, Nat.lt_of_not_ge h5]
              · by_cases h7 : d <= 45
                · simp [h0, h1, h2, h3, h4, h5, h6, h7, Nat.lt_of_not_ge h6]
                · by_cases h8 : d <= 60
                  · simp [h0, h1, h2, h3, h4, h5, h6, h7, h8, Nat.lt_of_not_ge h7]
                  · simp [h0, h1, h2, h3, h4, h5, h6, h7, h8, Nat.lt_of_not_ge h8]

/-- 成立する区分は一意（pickVal d に等しい）。 -/
theorem unique_band (d : Nat) (i : Nat) (hilt : i < 10)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      have hn0 : ¬ d <= 10 := by omega
      simp [pickVal, hn0, hi.2]
    · by_cases h2 : i = 2
      · subst i
        simp [inBand] at hi
        have hn0 : ¬ d <= 10 := by omega
        have hn1 : ¬ d <= 15 := by omega
        simp [pickVal, hn0, hn1, hi.2]
      · by_cases h3 : i = 3
        · subst i
          simp [inBand] at hi
          have hn0 : ¬ d <= 10 := by omega
          have hn1 : ¬ d <= 15 := by omega
          have hn2 : ¬ d <= 20 := by omega
          simp [pickVal, hn0, hn1, hn2, hi.2]
        · by_cases h4 : i = 4
          · subst i
            simp [inBand] at hi
            have hn0 : ¬ d <= 10 := by omega
            have hn1 : ¬ d <= 15 := by omega
            have hn2 : ¬ d <= 20 := by omega
            have hn3 : ¬ d <= 25 := by omega
            simp [pickVal, hn0, hn1, hn2, hn3, hi.2]
          · by_cases h5 : i = 5
            · subst i
              simp [inBand] at hi
              have hn0 : ¬ d <= 10 := by omega
              have hn1 : ¬ d <= 15 := by omega
              have hn2 : ¬ d <= 20 := by omega
              have hn3 : ¬ d <= 25 := by omega
              have hn4 : ¬ d <= 30 := by omega
              simp [pickVal, hn0, hn1, hn2, hn3, hn4, hi.2]
            · by_cases h6 : i = 6
              · subst i
                simp [inBand] at hi
                have hn0 : ¬ d <= 10 := by omega
                have hn1 : ¬ d <= 15 := by omega
                have hn2 : ¬ d <= 20 := by omega
                have hn3 : ¬ d <= 25 := by omega
                have hn4 : ¬ d <= 30 := by omega
                have hn5 : ¬ d <= 35 := by omega
                simp [pickVal, hn0, hn1, hn2, hn3, hn4, hn5, hi.2]
              · by_cases h7 : i = 7
                · subst i
                  simp [inBand] at hi
                  have hn0 : ¬ d <= 10 := by omega
                  have hn1 : ¬ d <= 15 := by omega
                  have hn2 : ¬ d <= 20 := by omega
                  have hn3 : ¬ d <= 25 := by omega
                  have hn4 : ¬ d <= 30 := by omega
                  have hn5 : ¬ d <= 35 := by omega
                  have hn6 : ¬ d <= 40 := by omega
                  simp [pickVal, hn0, hn1, hn2, hn3, hn4, hn5, hn6, hi.2]
                · by_cases h8 : i = 8
                  · subst i
                    simp [inBand] at hi
                    have hn0 : ¬ d <= 10 := by omega
                    have hn1 : ¬ d <= 15 := by omega
                    have hn2 : ¬ d <= 20 := by omega
                    have hn3 : ¬ d <= 25 := by omega
                    have hn4 : ¬ d <= 30 := by omega
                    have hn5 : ¬ d <= 35 := by omega
                    have hn6 : ¬ d <= 40 := by omega
                    have hn7 : ¬ d <= 45 := by omega
                    simp [pickVal, hn0, hn1, hn2, hn3, hn4, hn5, hn6, hn7, hi.2]
                  · have hi9 : i = 9 := by omega
                    subst i
                    simp [inBand] at hi
                    have hn0 : ¬ d <= 10 := by omega
                    have hn1 : ¬ d <= 15 := by omega
                    have hn2 : ¬ d <= 20 := by omega
                    have hn3 : ¬ d <= 25 := by omega
                    have hn4 : ¬ d <= 30 := by omega
                    have hn5 : ¬ d <= 35 := by omega
                    have hn6 : ¬ d <= 40 := by omega
                    have hn7 : ¬ d <= 45 := by omega
                    have hn8 : ¬ d <= 60 := by omega
                    simp [pickVal, hn0, hn1, hn2, hn3, hn4, hn5, hn6, hn7, hn8]

/-- 排他性: 異なる二区分は同時に成立しない（全称 d について）。 -/
theorem pairwise_exclusive (d : Nat) (i j : Nat) (hi_lt : i < 10) (hj_lt : j < 10)
    (hij : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hi_lt hi
  have hpj := unique_band d j hj_lt hj
  exact hij (hpi.trans hpj.symm)

/-- 網羅性: いずれかの区分が必ず成立する。 -/
theorem exhaustive (d : Nat) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d⟩

end JapanTaxLaw.VehicleDisplacementBands

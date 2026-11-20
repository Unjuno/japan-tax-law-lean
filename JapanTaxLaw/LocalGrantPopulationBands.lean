/-!
# LocalGrantPopulationBands — 337M50000008017 art.11（昼間流入人口の六区分）

Pinned source: data/raw/337M50000008017_20260724_508M60000008092.law.json
Article 11, Paragraph 1, Item 1, Subitem1 #1, Subitem2 #4 table （１）〜（６）:
  （１）１，０００人以上６，０００人未満
  （２）６，０００人以上１１，０００人未満
  （３）１１，０００人以上５５，０００人未満
  （４）５５，０００人以上１１０，０００人未満
  （５）１１０，０００人以上２２０，０００人未満
  （６）２２０，０００人以上

Lower-inclusive 「以上」 / upper-exclusive 「未満」. First band starts at 1,000,
so exhaustiveness holds for d >= 1,000; d < 1,000 is NOT MODELLED (outside the
table). Exclusiveness is global over all d : Nat. d is a caller-established
population count. Finite index (six), universally quantified d.
-/
namespace JapanTaxLaw.LocalGrantPopulationBands

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (1_000 <= d ∧ d < 6_000)
  | 1 => decide (6_000 <= d ∧ d < 11_000)
  | 2 => decide (11_000 <= d ∧ d < 55_000)
  | 3 => decide (55_000 <= d ∧ d < 110_000)
  | 4 => decide (110_000 <= d ∧ d < 220_000)
  | _ => decide (220_000 <= d)

def pickVal (d : Nat) : Nat :=
  if d < 6_000 then 0
  else if d < 11_000 then 1
  else if d < 55_000 then 2
  else if d < 110_000 then 3
  else if d < 220_000 then 4
  else 5

theorem pickVal_lt_six (d : Nat) : pickVal d < 6 := by
  unfold pickVal
  by_cases h0 : d < 6_000 <;> simp [h0]
  by_cases h1 : d < 11_000 <;> simp [h0, h1]
  by_cases h2 : d < 55_000 <;> simp [h0, h1, h2]
  by_cases h3 : d < 110_000 <;> simp [h0, h1, h2, h3]
  by_cases h4 : d < 220_000 <;> simp [h0, h1, h2, h3, h4]

theorem pickVal_inBand (d : Nat) (hd : 1_000 <= d) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d < 6_000
  · simp [h0, hd]
  · by_cases h1 : d < 11_000
    · have hge : 6_000 <= d := by omega
      simp [h0, h1, hge]
    · by_cases h2 : d < 55_000
      · have hge : 11_000 <= d := by omega
        simp [h0, h1, h2, hge]
      · by_cases h3 : d < 110_000
        · have hge : 55_000 <= d := by omega
          simp [h0, h1, h2, h3, hge]
        · by_cases h4 : d < 220_000
          · have hge : 110_000 <= d := by omega
            simp [h0, h1, h2, h3, h4, hge]
          · have hge : 220_000 <= d := by omega
            simp [h0, h1, h2, h3, h4, hge]

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 6)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi.2]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      have hn0 : ¬ d < 6_000 := by omega
      simp [pickVal, hn0, hi.2]
    · by_cases h2 : i = 2
      · subst i
        simp [inBand] at hi
        have hn0 : ¬ d < 6_000 := by omega
        have hn1 : ¬ d < 11_000 := by omega
        simp [pickVal, hn0, hn1, hi.2]
      · by_cases h3 : i = 3
        · subst i
          simp [inBand] at hi
          have hn0 : ¬ d < 6_000 := by omega
          have hn1 : ¬ d < 11_000 := by omega
          have hn2 : ¬ d < 55_000 := by omega
          simp [pickVal, hn0, hn1, hn2, hi.2]
        · by_cases h4 : i = 4
          · subst i
            simp [inBand] at hi
            have hn0 : ¬ d < 6_000 := by omega
            have hn1 : ¬ d < 11_000 := by omega
            have hn2 : ¬ d < 55_000 := by omega
            have hn3 : ¬ d < 110_000 := by omega
            simp [pickVal, hn0, hn1, hn2, hn3, hi.2]
          · have hi5 : i = 5 := by omega
            subst i
            simp [inBand] at hi
            have hn0 : ¬ d < 6_000 := by omega
            have hn1 : ¬ d < 11_000 := by omega
            have hn2 : ¬ d < 55_000 := by omega
            have hn3 : ¬ d < 110_000 := by omega
            have hn4 : ¬ d < 220_000 := by omega
            simp [pickVal, hn0, hn1, hn2, hn3, hn4]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 6) (hjl : j < 6)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) (hd : 1_000 <= d) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d hd⟩

end JapanTaxLaw.LocalGrantPopulationBands

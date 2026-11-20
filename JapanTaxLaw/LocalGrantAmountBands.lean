/-!
# LocalGrantAmountBands — 337M50000008017 art.11（金額の六区分）

Pinned source: data/raw/337M50000008017_20260724_508M60000008092.law.json
Article 11, Paragraph 1, Item 1, Subitem1 #1, Subitem2 #1 table.

原文の六区分（verbatim）:
  （１）３，０００以上２５，０００未満
  （２）２５，０００以上５０，０００未満
  （３）５０，０００以上１００，０００未満
  （４）１００，０００以上４００，０００未満
  （５）４００，０００以上９００，０００未満
  （６）９００，０００以上

d : Nat は当該金額（円、caller-established）。「以上」は下限包含、
「未満」は上限排他。最初の帯が 3,000 から始まるため、網羅性は
3,000 <= d の範囲で成り立つ（3,000 未満は表の射程外として明示的に
未モデル化）。排他性は全 d について成り立つ。

Six norms form a PARTITION of d >= 3,000: jointly exhaustive there and globally
pairwise exclusive. d is universally quantified; only the six indices are
case-analysed.
-/
namespace JapanTaxLaw.LocalGrantAmountBands

/-- i 番目（0-based）の金額帯が d に適用されるか。 -/
def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (3_000 <= d ∧ d < 25_000)
  | 1 => decide (25_000 <= d ∧ d < 50_000)
  | 2 => decide (50_000 <= d ∧ d < 100_000)
  | 3 => decide (100_000 <= d ∧ d < 400_000)
  | 4 => decide (400_000 <= d ∧ d < 900_000)
  | _ => decide (900_000 <= d)

/-- 金額 d をちょうど一つの帯へ分類する。 -/
def pickVal (d : Nat) : Nat :=
  if d < 25_000 then 0
  else if d < 50_000 then 1
  else if d < 100_000 then 2
  else if d < 400_000 then 3
  else if d < 900_000 then 4
  else 5

theorem pickVal_lt_six (d : Nat) : pickVal d < 6 := by
  unfold pickVal
  by_cases h0 : d < 25_000 <;> simp [h0]
  by_cases h1 : d < 50_000 <;> simp [h0, h1]
  by_cases h2 : d < 100_000 <;> simp [h0, h1, h2]
  by_cases h3 : d < 400_000 <;> simp [h0, h1, h2, h3]
  by_cases h4 : d < 900_000 <;> simp [h0, h1, h2, h3, h4]

/-- 3,000 <= d のとき、分類した帯が成立する。 -/
theorem pickVal_inBand (d : Nat) (hd : 3_000 <= d) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d < 25_000
  · simp [h0, hd]
  · by_cases h1 : d < 50_000
    · simp [h0, h1]
      omega
    · by_cases h2 : d < 100_000
      · simp [h0, h1, h2]
        omega
      · by_cases h3 : d < 400_000
        · simp [h0, h1, h2, h3]
          omega
        · by_cases h4 : d < 900_000
          · simp [h0, h1, h2, h3, h4]
            omega
          · simp [h0, h1, h2, h3, h4]
            omega

/-- 成立する帯は一意（pickVal d に等しい）。全 d について。 -/
theorem unique_band (d : Nat) (i : Nat) (hilt : i < 6)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi.2]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      have hn0 : ¬ d < 25_000 := by omega
      simp [pickVal, hn0, hi.2]
    · by_cases h2 : i = 2
      · subst i
        simp [inBand] at hi
        have hn0 : ¬ d < 25_000 := by omega
        have hn1 : ¬ d < 50_000 := by omega
        simp [pickVal, hn0, hn1, hi.2]
      · by_cases h3 : i = 3
        · subst i
          simp [inBand] at hi
          have hn0 : ¬ d < 25_000 := by omega
          have hn1 : ¬ d < 50_000 := by omega
          have hn2 : ¬ d < 100_000 := by omega
          simp [pickVal, hn0, hn1, hn2, hi.2]
        · by_cases h4 : i = 4
          · subst i
            simp [inBand] at hi
            have hn0 : ¬ d < 25_000 := by omega
            have hn1 : ¬ d < 50_000 := by omega
            have hn2 : ¬ d < 100_000 := by omega
            have hn3 : ¬ d < 400_000 := by omega
            simp [pickVal, hn0, hn1, hn2, hn3, hi.2]
          · have hi5 : i = 5 := by omega
            subst i
            simp [inBand] at hi
            have hn0 : ¬ d < 25_000 := by omega
            have hn1 : ¬ d < 50_000 := by omega
            have hn2 : ¬ d < 100_000 := by omega
            have hn3 : ¬ d < 400_000 := by omega
            have hn4 : ¬ d < 900_000 := by omega
            simp [pickVal, hn0, hn1, hn2, hn3, hn4]

/-- 排他性: 異なる二帯は同時に成立しない（全 d）。 -/
theorem pairwise_exclusive (d : Nat) (i j : Nat) (hi_lt : i < 6) (hj_lt : j < 6)
    (hij : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hi_lt hi
  have hpj := unique_band d j hj_lt hj
  exact hij (hpi.trans hpj.symm)

/-- 網羅性: 3,000 <= d のときいずれかの帯が必ず成立する。 -/
theorem exhaustive (d : Nat) (hd : 3_000 <= d) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d hd⟩

end JapanTaxLaw.LocalGrantAmountBands

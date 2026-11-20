/-!
# LocalGrantIndexBands — 337M50000008017 art.11（指数の二つの区分表）

Pinned source: data/raw/337M50000008017_20260724_508M60000008092.law.json

Two independent full-coverage partitions from Article 11:

* C 区分（宅地平均価格指数, Subitem2#3）— 四区分
  （１）１００未満 / （２）１００以上２００未満 / （３）２００以上３００未満 / （４）３００以上
* E 区分（Subitem1#2/Subitem2#4）— 五区分
  （１）１０未満 / （２）１０以上１１０未満 / （３）１１０以上２２０未満 /
  （４）２２０以上３３０未満 / （５）３３０以上

Both use lower-inclusive 「以上」 / upper-exclusive 「未満」 and cover ALL
d : Nat (the first band starts at 0). d is a caller-established Nat index.
Universally quantified exclusiveness/exhaustiveness; only the fixed indices
are case-analysed.
-/
namespace JapanTaxLaw.LocalGrantIndexBands

-- ── C 区分（四区分） ────────────────────────────────────────────────
namespace C

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (d < 100)
  | 1 => decide (100 <= d ∧ d < 200)
  | 2 => decide (200 <= d ∧ d < 300)
  | _ => decide (300 <= d)

def pickVal (d : Nat) : Nat :=
  if d < 100 then 0 else if d < 200 then 1 else if d < 300 then 2 else 3

theorem pickVal_lt_four (d : Nat) : pickVal d < 4 := by
  unfold pickVal
  by_cases h0 : d < 100 <;> simp [h0]
  by_cases h1 : d < 200 <;> simp [h0, h1]
  by_cases h2 : d < 300 <;> simp [h0, h1, h2]

theorem pickVal_inBand (d : Nat) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d < 100
  · simp [h0]
  · by_cases h1 : d < 200
    · have hge : 100 <= d := by omega
      simp [h0, h1, hge]
    · by_cases h2 : d < 300
      · have hge : 200 <= d := by omega
        simp [h0, h1, h2, hge]
      · have hge : 300 <= d := by omega
        simp [h0, h1, h2, hge]

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 4)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      simp [pickVal, hi.1, hi.2]
    · by_cases h2 : i = 2
      · subst i
        simp [inBand] at hi
        have hn0 : ¬ d < 100 := by omega
        simp [pickVal, hn0, hi.1, hi.2]
      · have hi3 : i = 3 := by omega
        subst i
        simp [inBand] at hi
        have hn0 : ¬ d < 100 := by omega
        have hn1 : ¬ d < 200 := by omega
        have hn2 : ¬ d < 300 := by omega
        simp [pickVal, hn0, hn1, hn2]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 4) (hjl : j < 4)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d⟩

end C

-- ── E 区分（五区分） ────────────────────────────────────────────────
namespace E

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (d < 10)
  | 1 => decide (10 <= d ∧ d < 110)
  | 2 => decide (110 <= d ∧ d < 220)
  | 3 => decide (220 <= d ∧ d < 330)
  | _ => decide (330 <= d)

def pickVal (d : Nat) : Nat :=
  if d < 10 then 0 else if d < 110 then 1 else if d < 220 then 2
  else if d < 330 then 3 else 4

theorem pickVal_lt_five (d : Nat) : pickVal d < 5 := by
  unfold pickVal
  by_cases h0 : d < 10 <;> simp [h0]
  by_cases h1 : d < 110 <;> simp [h0, h1]
  by_cases h2 : d < 220 <;> simp [h0, h1, h2]
  by_cases h3 : d < 330 <;> simp [h0, h1, h2, h3]

theorem pickVal_inBand (d : Nat) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d < 10
  · simp [h0]
  · by_cases h1 : d < 110
    · have hge : 10 <= d := by omega
      simp [h0, h1, hge]
    · by_cases h2 : d < 220
      · have hge : 110 <= d := by omega
        simp [h0, h1, h2, hge]
      · by_cases h3 : d < 330
        · have hge : 220 <= d := by omega
          simp [h0, h1, h2, h3, hge]
        · have hge : 330 <= d := by omega
          simp [h0, h1, h2, h3, hge]

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 5)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      simp [pickVal, hi.1, hi.2]
    · by_cases h2 : i = 2
      · subst i
        simp [inBand] at hi
        have hn0 : ¬ d < 10 := by omega
        simp [pickVal, hn0, hi.1, hi.2]
      · by_cases h3 : i = 3
        · subst i
          simp [inBand] at hi
          have hn0 : ¬ d < 10 := by omega
          have hn1 : ¬ d < 110 := by omega
          simp [pickVal, hn0, hn1, hi.1, hi.2]
        · have hi4 : i = 4 := by omega
          subst i
          simp [inBand] at hi
          have hn0 : ¬ d < 10 := by omega
          have hn1 : ¬ d < 110 := by omega
          have hn2 : ¬ d < 220 := by omega
          have hn3 : ¬ d < 330 := by omega
          simp [pickVal, hn0, hn1, hn2, hn3]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 5) (hjl : j < 5)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d⟩

end E
end JapanTaxLaw.LocalGrantIndexBands

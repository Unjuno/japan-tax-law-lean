/-!
# LocalGrantRemainingBands — 337M50000008017 art.11（距離・経済構造の区分）

Pinned source: data/raw/337M50000008017_20260724_508M60000008092.law.json

Two further full/partial-coverage partitions of Article 11:

* A 区分（Ⅰの地域からの距離, Subitem1#2/Subitem2#1）— 五区分
  （１）２００点以上３５０点未満 （２）３５０点以上６５０点未満
  （３）６５０点以上９５０点未満 （４）９５０点以上９９０点未満
  （５）９９０点以上  — exhaustive for d >= 200; d < 200 NOT MODELLED.
* B 区分（経済構造, Subitem1#1/Subitem2#2）— 二区分
  （１）９６未満 （２）９６以上  — exhaustive over ALL Nat d.

Lower-inclusive 「以上」 / upper-exclusive 「未満」. d is a caller-established
Nat index. Finite indices (5 and 2), universally quantified d.
-/
namespace JapanTaxLaw.LocalGrantRemainingBands

namespace A

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (200 <= d ∧ d < 350)
  | 1 => decide (350 <= d ∧ d < 650)
  | 2 => decide (650 <= d ∧ d < 950)
  | 3 => decide (950 <= d ∧ d < 990)
  | _ => decide (990 <= d)

def pickVal (d : Nat) : Nat :=
  if d < 350 then 0 else if d < 650 then 1 else if d < 950 then 2
  else if d < 990 then 3 else 4

theorem pickVal_lt_five (d : Nat) : pickVal d < 5 := by
  unfold pickVal
  by_cases h0 : d < 350 <;> simp [h0]
  by_cases h1 : d < 650 <;> simp [h0, h1]
  by_cases h2 : d < 950 <;> simp [h0, h1, h2]
  by_cases h3 : d < 990 <;> simp [h0, h1, h2, h3]

theorem pickVal_inBand (d : Nat) (hd : 200 <= d) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d < 350
  · simp [h0, hd]
  · by_cases h1 : d < 650
    · have hge : 350 <= d := by omega
      simp [h0, h1, hge]
    · by_cases h2 : d < 950
      · have hge : 650 <= d := by omega
        simp [h0, h1, h2, hge]
      · by_cases h3 : d < 990
        · have hge : 950 <= d := by omega
          simp [h0, h1, h2, h3, hge]
        · have hge : 990 <= d := by omega
          simp [h0, h1, h2, h3, hge]

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 5)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi.2]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      have hn0 : ¬ d < 350 := by omega
      simp [pickVal, hn0, hi.2]
    · by_cases h2 : i = 2
      · subst i
        simp [inBand] at hi
        have hn0 : ¬ d < 350 := by omega
        have hn1 : ¬ d < 650 := by omega
        simp [pickVal, hn0, hn1, hi.2]
      · by_cases h3 : i = 3
        · subst i
          simp [inBand] at hi
          have hn0 : ¬ d < 350 := by omega
          have hn1 : ¬ d < 650 := by omega
          have hn2 : ¬ d < 950 := by omega
          simp [pickVal, hn0, hn1, hn2, hi.2]
        · have hi4 : i = 4 := by omega
          subst i
          simp [inBand] at hi
          have hn0 : ¬ d < 350 := by omega
          have hn1 : ¬ d < 650 := by omega
          have hn2 : ¬ d < 950 := by omega
          have hn3 : ¬ d < 990 := by omega
          simp [pickVal, hn0, hn1, hn2, hn3]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 5) (hjl : j < 5)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) (hd : 200 <= d) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d hd⟩

end A

namespace B

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (d < 96)
  | _ => decide (96 <= d)

def pickVal (d : Nat) : Nat := if d < 96 then 0 else 1

theorem pickVal_lt_two (d : Nat) : pickVal d < 2 := by
  unfold pickVal
  by_cases h : d < 96 <;> simp [h]

theorem pickVal_inBand (d : Nat) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h : d < 96
  · simp [h]
  · have hge : 96 <= d := by omega
    simp [h, hge]

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 2)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi]
  · have hi1 : i = 1 := by omega
    subst i
    simp [inBand] at hi
    have hn0 : ¬ d < 96 := by omega
    simp [pickVal, hn0]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 2) (hjl : j < 2)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d⟩

end B
end JapanTaxLaw.LocalGrantRemainingBands

/-!
# MeshPopulationBands — 337M50000008017 附則19の14の3(5) メッシュ人口七区分

Pinned source: data/raw/337M50000008017_20260724_508M60000008092.law.json
LawBody[5]/SupplProvision/SupplProvision[46]/Article:19_14_3(5) e2..e8:

  e2 １００人以上２００人未満   e3 ２００人以上３００人未満
  e4 ３００人以上４００人未満   e5 ４００人以上５００人未満
  e6 ５００人以上１，０００人未満 e7 １，０００人以上２，０００人未満
  e8 ２，０００人以上４，０００人未満

Two parallel series (prefecture-level and municipality-level) use the SAME band
structure; P/M below alias one proven function. The band partition is proved
once (finite indices 7, universally quantified d). First band starts at 100,
so exhaustiveness holds for 100 <= d < 4000; outside that range NOT MODELLED.
-/
namespace JapanTaxLaw.MeshPopulationBands

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (100 <= d ∧ d < 200)
  | 1 => decide (200 <= d ∧ d < 300)
  | 2 => decide (300 <= d ∧ d < 400)
  | 3 => decide (400 <= d ∧ d < 500)
  | 4 => decide (500 <= d ∧ d < 1000)
  | 5 => decide (1000 <= d ∧ d < 2000)
  | 6 => decide (2000 <= d ∧ d < 4000)
  | _ => false

def pickVal (d : Nat) : Nat :=
  if d < 200 then 0
  else if d < 300 then 1
  else if d < 400 then 2
  else if d < 500 then 3
  else if d < 1000 then 4
  else if d < 2000 then 5
  else 6

theorem pickVal_lt_seven (d : Nat) : pickVal d < 7 := by
  unfold pickVal
  by_cases h0 : d < 200 <;> simp [h0]
  by_cases h1 : d < 300 <;> simp [h0, h1]
  by_cases h2 : d < 400 <;> simp [h0, h1, h2]
  by_cases h3 : d < 500 <;> simp [h0, h1, h2, h3]
  by_cases h4 : d < 1000 <;> simp [h0, h1, h2, h3, h4]
  by_cases h5 : d < 2000 <;> simp [h0, h1, h2, h3, h4, h5]

theorem pickVal_inBand (d : Nat) (hd : 100 <= d) (hd2 : d < 4000) :
    inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d < 200
  · simp [h0, hd]
  · by_cases h1 : d < 300
    · have hge : 200 <= d := by omega
      simp [h0, h1, hge]
    · by_cases h2 : d < 400
      · have hge : 300 <= d := by omega
        simp [h0, h1, h2, hge]
      · by_cases h3 : d < 500
        · have hge : 400 <= d := by omega
          simp [h0, h1, h2, h3, hge]
        · by_cases h4 : d < 1000
          · have hge : 500 <= d := by omega
            simp [h0, h1, h2, h3, h4, hge]
          · by_cases h5 : d < 2000
            · have hge : 1000 <= d := by omega
              simp [h0, h1, h2, h3, h4, h5, hge]
            · have hge : 2000 <= d := by omega
              simp [h0, h1, h2, h3, h4, h5, hge, hd2]

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 7)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi.2]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      have hn0 : ¬ d < 200 := by omega
      simp [pickVal, hn0, hi.2]
    · by_cases h2 : i = 2
      · subst i
        simp [inBand] at hi
        have hn0 : ¬ d < 200 := by omega
        have hn1 : ¬ d < 300 := by omega
        simp [pickVal, hn0, hn1, hi.2]
      · by_cases h3 : i = 3
        · subst i
          simp [inBand] at hi
          have hn0 : ¬ d < 200 := by omega
          have hn1 : ¬ d < 300 := by omega
          have hn2 : ¬ d < 400 := by omega
          simp [pickVal, hn0, hn1, hn2, hi.2]
        · by_cases h4 : i = 4
          · subst i
            simp [inBand] at hi
            have hn0 : ¬ d < 200 := by omega
            have hn1 : ¬ d < 300 := by omega
            have hn2 : ¬ d < 400 := by omega
            have hn3 : ¬ d < 500 := by omega
            simp [pickVal, hn0, hn1, hn2, hn3, hi.2]
          · by_cases h5 : i = 5
            · subst i
              simp [inBand] at hi
              have hn0 : ¬ d < 200 := by omega
              have hn1 : ¬ d < 300 := by omega
              have hn2 : ¬ d < 400 := by omega
              have hn3 : ¬ d < 500 := by omega
              have hn4 : ¬ d < 1000 := by omega
              simp [pickVal, hn0, hn1, hn2, hn3, hn4, hi.2]
            · have hi6 : i = 6 := by omega
              subst i
              simp [inBand] at hi
              have hn0 : ¬ d < 200 := by omega
              have hn1 : ¬ d < 300 := by omega
              have hn2 : ¬ d < 400 := by omega
              have hn3 : ¬ d < 500 := by omega
              have hn4 : ¬ d < 1000 := by omega
              have hn5 : ¬ d < 2000 := by omega
              simp [pickVal, hn0, hn1, hn2, hn3, hn4, hn5]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 7) (hjl : j < 7)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) (hd : 100 <= d) (hd2 : d < 4000) :
    ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d hd hd2⟩

/- 都道府県系列と市町村系列は同じ帯構造（拡張的に同一）。 -/
namespace P
def inBand := JapanTaxLaw.MeshPopulationBands.inBand
def pickVal := JapanTaxLaw.MeshPopulationBands.pickVal
end P

namespace M
def inBand := JapanTaxLaw.MeshPopulationBands.inBand
def pickVal := JapanTaxLaw.MeshPopulationBands.pickVal
end M

theorem cross_scope_inBand (i d : Nat) : P.inBand i d = M.inBand i d := by rfl
theorem cross_scope_pickVal (d : Nat) : P.pickVal d = M.pickVal d := by rfl

end JapanTaxLaw.MeshPopulationBands

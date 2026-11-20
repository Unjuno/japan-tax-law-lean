/-!
# ProgressiveAgriculturalPoints — 337M50000008017 附則14の9(3)

Pinned source: data/raw/337M50000008017_20260724_508M60000008092.law.json
LawBody[5]/SupplProvision/SupplProvision[29]/Article:14_9(3) ArithFormula:

  ｍ１≦２，０００のとき　ｍ１×０．０３
  ２，０００＜ｍ１≦７，０００のとき　（ｍ１－２，０００）×０．０８＋６０
  ７，０００＜ｍ１のとき　（ｍ１－７，０００）×０．１＋４６０

The three decimal rates (0.03 / 0.08 / 0.1) are represented EXACTLY as
hundredths (×3 / ×8 / ×10 with a fixed denominator 100), so no floating-point
error enters. `hundredths m1` is the formula value in hundredths of a point:
  band 0: m1 * 3
  band 1: (m1 - 2000) * 8 + 6000
  band 2: (m1 - 7000) * 10 + 46000

Rounding of these products to integer points is specified in a NEIGHBOURING
sentence (四捨五入), not in these three fragments; it is NOT MODELLED here.
Only the three formula fragments are formalized. d is a caller-established Nat.
-/
namespace JapanTaxLaw.ProgressiveAgriculturalPoints

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (d <= 2_000)
  | 1 => decide (2_000 < d ∧ d <= 7_000)
  | _ => decide (7_000 < d)

/-- 式の値を 100 分の 1 点単位の整数で表す（丸めは NOT MODELLED）。 -/
def hundredths (i : Nat) (d : Nat) : Nat :=
  match i with
  | 0 => d * 3
  | 1 => (d - 2_000) * 8 + 6_000
  | _ => (d - 7_000) * 10 + 46_000

def pickVal (d : Nat) : Nat :=
  if d <= 2_000 then 0 else if d <= 7_000 then 1 else 2

theorem pickVal_lt_three (d : Nat) : pickVal d < 3 := by
  unfold pickVal
  by_cases h0 : d <= 2_000 <;> simp [h0]
  by_cases h1 : d <= 7_000 <;> simp [h0, h1]

theorem pickVal_inBand (d : Nat) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d <= 2_000
  · simp [h0]
  · by_cases h1 : d <= 7_000
    · simp [h0, h1]
      omega
    · simp [h0, h1]
      omega

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 3)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      have hn0 : ¬ d <= 2_000 := by omega
      simp [pickVal, hn0, hi.2]
    · have hi2 : i = 2 := by omega
      subst i
      simp [inBand] at hi
      have hn0 : ¬ d <= 2_000 := by omega
      have hn1 : ¬ d <= 7_000 := by omega
      simp [pickVal, hn0, hn1]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 3) (hjl : j < 3)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d⟩

/-- 境界 2,000 で両式は同じ値（6,000 = 60.00 点）。 -/
theorem continuous_at_2000 : hundredths 0 2_000 = hundredths 1 2_000 := by
  decide

/-- 境界 7,000 で両式は同じ値（46,000 = 460.00 点）。 -/
theorem continuous_at_7000 : hundredths 1 7_000 = hundredths 2 7_000 := by
  decide

/-- 各帯内で式は単調非減少（kW の増加で点数は減らない）。 -/
theorem band_monotone (i : Nat) (hil : i < 3) (a b : Nat) (hab : a <= b)
    (ha : inBand i a = true) (hb : inBand i b = true) :
    hundredths i a <= hundredths i b := by
  by_cases h0 : i = 0
  · subst i
    simp [hundredths]
    omega
  · by_cases h1 : i = 1
    · subst i
      simp [hundredths] at ha hb ⊢
      omega
    · have hi2 : i = 2 := by omega
      subst i
      simp [hundredths] at ha hb ⊢
      omega

end JapanTaxLaw.ProgressiveAgriculturalPoints

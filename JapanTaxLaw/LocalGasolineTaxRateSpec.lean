import JapanTaxLaw.LocalGasolineTaxRate

/-!
# LocalGasolineTaxRateSpec — independent spec for 地方揮発油税法 art.4

Law id: 330AC0000000104
Revision: 330AC0000000104_20260401_508AC0000000012
Statutory article: art. 4
Normative unit: NORM|7eb549f9aeb97856ee098142bf07352e2d9dd52855e9afdd5db3e8c5236a64f8

The spec is deliberately a different formulation from the implementation:
the implementation multiplies the quantity by the rate, while the spec
expresses the amount as primitive-recursive repeated addition of ¥4,400.
The kernel proves their agreement for ALL quantities (not a finite sample).

Variable contract: `kilolitres : Money` = 揮発油の数量, unit キロリットル,
domain Nat. Result unit: 円.

Not modelled (exact captions from the pinned law): 第三条（課税標準）,
第五条（納税義務者）, 第六条（未納税移出等）,
第七条（申告及び納付等, including the 二百八十七分の四十四 rate interaction）,
第八条（担保の提供）, 第九条（戻入れの場合の地方揮発油税の控除等）,
第十条（延滞税）, 第十一条〜第十五条, 附則 経過措置.
-/

namespace JapanTaxLaw.LocalGasolineTaxRate

open JapanTaxLaw.TaxFinance

/-- Spec: 4,400円をキロリットル数だけ加算した額 (recursive formulation). -/
def specSum : Money → Money
  | 0 => 0
  | n + 1 => specSum n + 4_400

/-- Soundness/correspondence: implementation agrees with the independent spec
    for every quantity. Universal, kernel-checked; no `sorry`/`admit`. -/
theorem agree_local_gasoline_tax (kilolitres : Money) :
    taxForKilolitres kilolitres = specSum kilolitres := by
  induction kilolitres with
  | zero =>
      simp [taxForKilolitres, specSum]
  | succ n ih =>
      unfold taxForKilolitres at ih ⊢
      simp [ratePerKilolitre] at ih
      simp [ratePerKilolitre, specSum, Nat.succ_mul, ih]

/-- Boundary: zero quantity gives zero tax. -/
theorem specSum_zero : specSum 0 = 0 := rfl

/-- Boundary: one kilolitre gives exactly ¥4,400. -/
example : specSum 1 = 4_400 := by decide

/-- Boundary: two kilolitres give exactly ¥8,800. -/
example : specSum 2 = 8_800 := by decide

/-- Boundary: strictly positive quantity gives strictly positive tax. -/
theorem specSum_pos_of_pos (n : Money) (h : 0 < n) : 0 < specSum n := by
  cases n with
  | zero => contradiction
  | succ k =>
      change 0 < specSum k + 4_400
      exact Nat.lt_of_lt_of_le (by decide : 0 < 4_400)
        (Nat.le_add_left 4_400 (specSum k))

/-- Monotonicity: more fuel never lowers the tax. -/
theorem taxForKilolitres_mono {a b : Money} (h : a ≤ b) :
    taxForKilolitres a ≤ taxForKilolitres b := by
  unfold taxForKilolitres
  exact Nat.mul_le_mul_right 4_400 h

/-- Rejects ten-fold transcription errors (四万四千円 / 四百四十円). -/
theorem rate_not_scaled : ratePerKilolitre ≠ 44_000 ∧ ratePerKilolitre ≠ 440 := by
  decide

/-- Finite smoke check only; `agree_local_gasoline_tax` is the proof. -/
def agreeLocalGasolineTax : Bool :=
  [0, 1, 2, 3, 5, 10].all fun n =>
    taxForKilolitres n == specSum n

example : agreeLocalGasolineTax = true := by decide

end JapanTaxLaw.LocalGasolineTaxRate

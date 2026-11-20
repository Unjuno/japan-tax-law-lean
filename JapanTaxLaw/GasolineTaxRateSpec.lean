import JapanTaxLaw.GasolineTaxRate

/-!
# GasolineTaxRateSpec — independent spec for 揮発油税法 art.9

Law id: 332AC0000000055
Revision: 332AC0000000055_20260525_506AC0000000052
Statutory article: art. 9
Normative unit: NORM|8bf684764da81b921477924a5e17db0d25d2ddfae535431c99302894578f927c

The spec is deliberately a different formulation from the implementation:
the implementation multiplies the quantity by the rate, while the spec
expresses the amount as primitive-recursive repeated addition of ¥24,300.
The kernel proves their agreement for ALL quantities (not a finite sample).

Variable contract: `kilolitres : Money` = 揮発油の数量, unit キロリットル,
domain Nat. Result unit: 円.

Not modelled (exact captions): 第三条（納税義務者）, 第八条（課税標準）,
第十条 / 第十一条（申告）, 第十四条（未納税移出）,
第十五条（輸出免税）, 第十六条（移出に係る灯油の免税）,
第十七条（戻入れの場合の揮発油税の控除等）, 第十八条（保全担保）,
附則・経過措置.
-/

namespace JapanTaxLaw.GasolineTaxRate

open JapanTaxLaw.TaxFinance

/-- Spec: 24,300円をキロリットル数だけ加算した額 (recursive formulation). -/
def specSum : Money → Money
  | 0 => 0
  | n + 1 => specSum n + 24_300

/-- Soundness/correspondence: implementation agrees with the independent spec
    for every quantity. Universal, kernel-checked; no `sorry`/`admit`. -/
theorem agree_gasoline_tax (kilolitres : Money) :
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

/-- Boundary: one kilolitre gives exactly ¥24,300. -/
example : specSum 1 = 24_300 := by decide

/-- Boundary: two kilolitres give exactly ¥48,600. -/
example : specSum 2 = 48_600 := by decide

/-- Boundary: strictly positive quantity gives strictly positive tax. -/
theorem specSum_pos_of_pos (n : Money) (h : 0 < n) : 0 < specSum n := by
  cases n with
  | zero => contradiction
  | succ k =>
      change 0 < specSum k + 24_300
      exact Nat.lt_of_lt_of_le (by decide : 0 < 24_300)
        (Nat.le_add_left 24_300 (specSum k))

/-- Monotonicity: more fuel never lowers the tax. -/
theorem taxForKilolitres_mono {a b : Money} (h : a ≤ b) :
    taxForKilolitres a ≤ taxForKilolitres b := by
  unfold taxForKilolitres
  exact Nat.mul_le_mul_right 24_300 h

/-- Rejects ten-fold transcription errors (二十四万三千円 = 243,000 /
    二千四百三十円 = 2,430). -/
theorem rate_not_scaled : ratePerKilolitre ≠ 243_000 ∧ ratePerKilolitre ≠ 2_430 := by
  decide

/-- Cross-law relation: the national 揮発油税 rate (art.9, ¥24,300/kL) plus
    the 地方揮発油税 rate (art.4, ¥4,400/kL) is ¥28,700/kL. Both rates are
    pinned in their own verified modules. This is a RATE-SUM of two statutory
    per-kilolitre constants, NOT a modelled tax liability: taxable quantity,
    exemptions (第十四条〜第十六条) and collection procedure are out of scope. -/
theorem combined_gasoline_rate :
    JapanTaxLaw.GasolineTaxRate.ratePerKilolitre
      + JapanTaxLaw.LocalGasolineTaxRate.ratePerKilolitre = 28_700 := by
  decide

/-- Finite smoke check only; `agree_gasoline_tax` is the proof. -/
def agreeGasolineTax : Bool :=
  [0, 1, 2, 3, 5, 10].all fun n =>
    taxForKilolitres n == specSum n

example : agreeGasolineTax = true := by decide

end JapanTaxLaw.GasolineTaxRate

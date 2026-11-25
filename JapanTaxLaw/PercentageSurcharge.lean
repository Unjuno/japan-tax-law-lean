import JapanTaxLaw.TaxFinance

/-!
# PercentageSurcharge — 18 の pinned 割合乗算規定

14 units state a 15% surcharge on the tax amount (地方税法 不申告加算金), and
2 units state a 35% addition on the shortfall (自動車税・軽自動車税). One
unit contains 15%/20% withholding rates and one is a 15% rate listing.

The model computes `amount × rate / 100` with floor. The eligibility of the
underlying tax amount and any caps are caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.PercentageSurcharge

/-- 15% (百分の十五). -/
def surcharge15 (tax : Nat) : Nat := tax * 15 / 100
/-- 35% (百分の三十五). -/
def addition35 (shortfall : Nat) : Nat := shortfall * 35 / 100
/-- 20% (百分の二十) — 配当等. -/
def rate20 (amount : Nat) : Nat := amount * 20 / 100

theorem monotone15 : ∀ a b, a ≤ b → surcharge15 a ≤ surcharge15 b := by
  intro a b h
  unfold surcharge15
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 15 h)

end JapanTaxLaw.PercentageSurcharge

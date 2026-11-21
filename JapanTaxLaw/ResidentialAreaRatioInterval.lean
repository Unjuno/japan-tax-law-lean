import JapanTaxLaw.TaxFinance

/-
# ResidentialAreaRatioInterval — 地価税法施行令 第九条（居住面積割合の区間）明示区間モデル

Pinned source:
  Law id: 403CO0000000174
  Revision: 403CO0000000174_20250722_507CO0000000249
  Raw snapshot: data/raw/403CO0000000174_20250722_507CO0000000249.law.json
  sha256: 580d177620a136513316a476f404e643b0b4522c6e1bf06ce54ae4e9dd6580ee
  Article: 第九条 (attr.Num = "9"), scoped/normalized leaf text 1131 chars.
  原文逐語: 「居住面積割合が百分の二十五を超え百分の五十以下である場合」

Variables (contract):
  residential = 居住面積 (Nat, unit m²)
  total       = 総面積 (Nat, unit m²)
  The ratio 居住面積割合 is dimensionless (%). 百分の二十五 = 25/100 = 25%;
  百分の五十 = 50/100 = 50%. 「超え」 is STRICT (>), 「以下」 is INCLUSIVE (<=).

Computation (exact integer cross-multiplication, no division/rounding):
  ratio = 100 * residential / total, so
    25/100 < ratio  <=>  25 * total < 100 * residential  (strict 超え)
    ratio <= 50/100  <=>  100 * residential <= 50 * total  (inclusive 以下)
  ratioInInterval is the conjunction. total = 0 has an undefined ratio and is
  treated as NOT applying (false): 25*0 < 100*residential may hold, but
  100*residential <= 50*0 = 0 only for residential = 0, which also fails the
  strict lower bound.

Scope / NOT MODELLED: the surrounding 地価税法施行令第九条 conditions
  (宅地の利用状況, 地積の認定, 特例の適用判断) and any legal interpretation.
  This model provides no legal review.
-/

namespace JapanTaxLaw.ResidentialAreaRatioInterval

/-- 百分の二十五 = 25/100 の分子（%） -/
def lowerPct : Nat := 25

/-- 百分の五十 = 50/100 の分子（%） -/
def upperPct : Nat := 50

/-- 百分 = 100（尺度）。割合は residential*100/total。 -/
def scale : Nat := 100

/-- 居住面積割合が 25% を超え 50% 以下か。総面積 0 は false（定義不能）。 -/
def ratioInInterval (residential total : Nat) : Bool :=
  decide (lowerPct * total < scale * residential && scale * residential <= upperPct * total)

/-- 明示的な境界例（原文の 超え = strict, 以下 = inclusive）。 -/
theorem boundary_26_of_100 : ratioInInterval 26 100 = true := by
  unfold ratioInInterval lowerPct upperPct scale
  have hlow : 25 * 100 < 100 * 26 := by omega
  have hup : 100 * 26 <= 50 * 100 := by omega
  simp [hlow, hup]

theorem boundary_25_of_100 : ratioInInterval 25 100 = false := by
  unfold ratioInInterval lowerPct upperPct scale
  have hnlow : ¬ 25 * 100 < 100 * 25 := by omega
  simp [hnlow]

theorem boundary_50_of_100 : ratioInInterval 50 100 = true := by
  unfold ratioInInterval lowerPct upperPct scale
  have hlow : 25 * 100 < 100 * 50 := by omega
  have hup : 100 * 50 <= 50 * 100 := by omega
  simp [hlow, hup]

theorem boundary_51_of_100 : ratioInInterval 51 100 = false := by
  unfold ratioInInterval lowerPct upperPct scale
  have hlow : 25 * 100 < 100 * 51 := by omega
  have hnup : ¬ 100 * 51 <= 50 * 100 := by omega
  simp [hlow, hnup]

theorem boundary_zero_total : ratioInInterval 26 0 = false := by
  unfold ratioInInterval lowerPct upperPct scale
  have hlow : 25 * 0 < 100 * 26 := by omega
  have hnup : ¬ 100 * 26 <= 50 * 0 := by omega
  simp [hlow, hnup]

/-- 単調性は `Monotone` を使わず直接不等式で述べる（尺度 100 の左掛け）。 -/
theorem scale_mul_mono (a b : Nat) (h : a <= b) : scale * a <= scale * b :=
  Nat.mul_le_mul_left scale h

end JapanTaxLaw.ResidentialAreaRatioInterval

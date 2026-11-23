/-\!
# InheritanceTaxSuperficiesValuation — 相続税法 第二十三条（地上権等の評価）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000073_20260401_506AC0000000008.law.json Article:23

原文の規範構造：地上権・永小作権の価額 = 土地の時価 × 残存期間に応じた割合。
  ≤10年 5%; (10,15] 10%; (15,20] 20%; (20,25] 30%;
  (25,30] 又は 期間不定 40% ← 対象単位(1); (30,35] 50%; (35,40] 60%;
  (40,45] 70%; (45,50] 80%; >50年 90% ← 対象単位(2)

変数: `years` 残存期間[年]（Nat）, `indefinite` 存続期間の定めなし。
時価は呼出側が与える（NOT MODELLED）。割合は百分率の整数値（5=5%）。
-/
namespace JapanTaxLaw.InheritanceTaxSuperficiesValuation

-- 残存期間→割合（百分率整数）
def rateForPeriod (years : Nat) (indefinite : Bool) : Nat :=
  if indefinite then 40
  else if years <= 10 then 5
  else if years <= 15 then 10
  else if years <= 20 then 20
  else if years <= 25 then 30
  else if years <= 30 then 40
  else if years <= 35 then 50
  else if years <= 40 then 60
  else if years <= 45 then 70
  else if years <= 50 then 80
  else 90

theorem band_le10 (y : Nat) (h : y <= 10) : rateForPeriod y false = 5 := by simp [rateForPeriod, h]
theorem band_11_15 (y : Nat) (h1 : 10 < y) (h2 : y <= 15) : rateForPeriod y false = 10 := by
  have hn10 : ¬ y <= 10 := Nat.not_le_of_gt h1
  simp [rateForPeriod, hn10, h2]
-- 対象単位(1): (25,30] → 40%
theorem band_25_30_object (y : Nat) (h1 : 25 < y) (h2 : y <= 30) : rateForPeriod y false = 40 := by
  have hn10 : ¬ y <= 10 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 10 < 25) h1)
  have hn15 : ¬ y <= 15 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 15 < 25) h1)
  have hn20 : ¬ y <= 20 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 20 < 25) h1)
  have hn25 : ¬ y <= 25 := Nat.not_le_of_gt h1
  simp [rateForPeriod, hn10, hn15, hn20, hn25, h2]
theorem band_indefinite : rateForPeriod 0 true = 40 := by simp [rateForPeriod]
-- 対象単位(2): >50 → 90%
theorem band_over50_object (y : Nat) (h : 50 < y) : rateForPeriod y false = 90 := by
  have hn10 : ¬ y <= 10 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 10 < 50) h)
  have hn15 : ¬ y <= 15 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 15 < 50) h)
  have hn20 : ¬ y <= 20 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 20 < 50) h)
  have hn25 : ¬ y <= 25 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 25 < 50) h)
  have hn30 : ¬ y <= 30 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 30 < 50) h)
  have hn35 : ¬ y <= 35 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 35 < 50) h)
  have hn40 : ¬ y <= 40 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 40 < 50) h)
  have hn45 : ¬ y <= 45 := Nat.not_le_of_gt (Nat.lt_trans (by decide : 45 < 50) h)
  have hn50 : ¬ y <= 50 := Nat.not_le_of_gt h
  simp [rateForPeriod, hn10, hn15, hn20, hn25, hn30, hn35, hn40, hn45, hn50]

def superficiesValuationDeclared : Bool := true
theorem superficies_valuation_is_declaration : superficiesValuationDeclared = true := rfl

end JapanTaxLaw.InheritanceTaxSuperficiesValuation

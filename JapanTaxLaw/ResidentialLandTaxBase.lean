/-\!
# ResidentialLandTaxBase — 地方税法 第三百四十九条の三の二（住宅用地の課税標準特例）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000226_20261101_508AC0000000002.law.json Article:349_3_2

原文の規範構造：
- 第1項：住宅用地の固定資産税の課税標準 = 価格の「三分の一」(1/3)。
- 第2項：小規模住宅用地（次に掲げる区分に該当するもの）は「六分の一」(1/6)。
  - 号1：住宅用地で面積が二百平方メートル以下であるもの ← 対象単位
  - 号2：面積が二百平方メートルを超えるもののうち、面積を住居数で除した
    面積が二百平方メートル以下のもの ← 対象単位

変数: `price` 課税標準となるべき価格[円], `area` 面積[m²], `dwellings` 住居数[個]。
次元: area[m²], price[円] → 課税標準[円] (=price/3 または price/6)。
「政令で定める住宅用地」「住居数」の具体的認定は NOT MODELLED。
-/
namespace JapanTaxLaw.ResidentialLandTaxBase

-- 小規模判定：面積<=200 または (面積>200 かつ 面積/住居数<=200)
def smallScale (area dwellings : Nat) : Bool :=
  if area <= 200 then true
  else if dwellings == 0 then false
  else (area / dwellings) <= 200

theorem small_if_le200 (a d : Nat) (h : a <= 200) : smallScale a d = true := by simp [smallScale, h]
theorem not_small_if_over200_zero_dwellings (a : Nat) (h : 200 < a) : smallScale a 0 = false := by
  simp [smallScale, h]
theorem small_if_per_dwelling_le200 (a d : Nat) (h1 : 200 < a) (hd : d > 0)
    (h2 : a / d <= 200) : smallScale a d = true := by
  have hn : ¬ a <= 200 := Nat.not_le_of_gt h1
  have hd0 : ¬ d = 0 := Nat.ne_of_gt hd
  simp [smallScale, hn, hd0, h2]

-- 課税標準率：小規模なら 1/6、そうでなければ 1/3（分母で表現）
def taxBaseRateDenominator (small : Bool) : Nat := if small then 6 else 3
theorem small_denom : taxBaseRateDenominator true = 6 := by rfl
theorem normal_denom : taxBaseRateDenominator false = 3 := by rfl

-- 課税標準額 = price / 分母
def taxBaseAmount (price : Nat) (small : Bool) : Nat := price / taxBaseRateDenominator small
theorem small_base (p : Nat) : taxBaseAmount p true = p / 6 := by simp [taxBaseAmount, taxBaseRateDenominator]
theorem normal_base (p : Nat) : taxBaseAmount p false = p / 3 := by simp [taxBaseAmount, taxBaseRateDenominator]

def residentialLandTaxBaseDeclared : Bool := true
theorem residential_land_tax_base_is_declaration : residentialLandTaxBaseDeclared = true := rfl

end JapanTaxLaw.ResidentialLandTaxBase

import JapanTaxLaw.TaxFinance

/-!
# RoadAreaRate — 道路の面積の補正率（地方揮発油譲与税法施行規則 art.3 §3）bounded L4 モデル

Sources (pinned):
  Law id: 331M50000002007
  Revision: 331M50000002007_20230401_505M60000008036
  Raw snapshot: data/raw/331M50000002007_20230401_505M60000008036.law.json
  Article Num 3 (§3 table), flat/normalized leaf text 1858 chars, U+3000 count 0.

表の内容（§3、平坦化）:
  「道路の面積は、次表の上欄に掲げる道路の種別に応じ、それぞれ下欄に掲げる率を
   乗じて補正するものとする。
    指定区間内の一般国道 〇・八 / 指定区間外の一般国道 一・〇 /
    高速自動車国道 〇・八 / 都道府県道 一・〇 / 橋りよう 四・〇」

Computation（原文逐語から導出、種別→率の表のみ）:
  道路種別を Nat 列挙:
    指定区内一般国道=0 → 0.8 (800/1000)
    指定区外一般国道=1 → 1.0 (1000/1000)
    高速自動車国道=2   → 0.8 (800/1000)
    都道府県道=3       → 1.0 (1000/1000)
    橋りよう=4         → 4.0 (4000/1000)
  ratePerMille(t) = 木の表に従う（800/1000/800/1000/4000）

Scope / NOT MODELLED:
  - §2 の延長補正（人口/km による率表）・§4 の面積再補正は NOT MODELLED。
  - 道路種別の認定・補正の適用手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RoadAreaRate

open JapanTaxLaw.TaxFinance

/-- 指定区間内の一般国道 = 0。 -/
def designatedNational : Nat := 0
/-- 指定区間外の一般国道 = 1。 -/
def nonDesignatedNational : Nat := 1
/-- 高速自動車国道 = 2。 -/
def expressway : Nat := 2
/-- 都道府県道 = 3。 -/
def prefectural : Nat := 3
/-- 橋りよう = 4。 -/
def bridge : Nat := 4

/-- 道路種別ごとの補正率（千分率）。 -/
def ratePerMille (roadType : Nat) : Nat :=
  match roadType with
  | 0 => 800
  | 1 => 1000
  | 2 => 800
  | 3 => 1000
  | 4 => 4000
  | _ => 0

example : ratePerMille designatedNational = 800 := by decide
example : ratePerMille nonDesignatedNational = 1000 := by decide
example : ratePerMille expressway = 800 := by decide
example : ratePerMille prefectural = 1000 := by decide
example : ratePerMille bridge = 4000 := by decide

end JapanTaxLaw.RoadAreaRate

import JapanTaxLaw.TaxFinance

/-!
# ContainerSpec — 大型コンテナの規格（関税法施行令 art.78）bounded L4 モデル

Sources (pinned):
  Law id: 329CO0000000155
  Revision: 329CO0000000155_20260401_508CO0000000085
  Raw snapshot: data/raw/329CO0000000155_20260401_508CO0000000085.law.json
  Article Num 78, flat/normalized leaf text 147 chars, U+3000 count 0.

原文逐語:
  「…大型のコンテナは、幅及び高さが二・四メートル以上で長さが二・九メートル以上の
   コンテナのうち、…強度を有するものとする。」

Computation（原文逐語から導出、寸法閾値のみ）:
  widthMeters >= 2.4（二・四メートル以上）
  heightMeters >= 2.4（二・四メートル以上）
  lengthMeters >= 2.9（二・九メートル以上）
  厳密表現: 1/10 m 単位で 24 / 29 と比較（小数を避ける）。
    meetsDimensions(w,h,l) = w>=24 && h>=24 && l>=29  （各 1/10 m 単位）

Scope / NOT MODELLED:
  - 「日本産業規格に定める国際大型コンテナの積重ね強度」の判定は NOT MODELLED。
  - コンテナの品目区分（別表の号）は NOT MODELLED。
  - 本スライスは寸法閾値（幅・高さ 2.4m、長さ 2.9m）のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ContainerSpec

open JapanTaxLaw.TaxFinance

/-- 幅・高さの閾値 = 2.4m = 24（1/10m 単位）。 -/
def minWidthHeightDm : Nat := 24
/-- 長さの閾値 = 2.9m = 29（1/10m 単位）。 -/
def minLengthDm : Nat := 29

/-- 大型コンテナの寸法条件（各 1/10m 単位）。 -/
def meetsDimensions (widthDm heightDm lengthDm : Nat) : Bool :=
  widthDm >= minWidthHeightDm && heightDm >= minWidthHeightDm && lengthDm >= minLengthDm

example : minWidthHeightDm = 24 := by decide
example : minLengthDm = 29 := by decide
example : meetsDimensions 24 24 29 = true := by decide
example : meetsDimensions 23 24 29 = false := by decide
example : meetsDimensions 24 23 29 = false := by decide
example : meetsDimensions 24 24 28 = false := by decide
example : meetsDimensions 30 25 120 = true := by decide

end JapanTaxLaw.ContainerSpec

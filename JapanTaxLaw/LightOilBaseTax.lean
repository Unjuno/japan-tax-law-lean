import JapanTaxLaw.TaxFinance

/-!
# LightOilBaseTax — 軽油引取税法施行令 art. 23の2（軽油引取税の基準税額の算定方法）の bounded L4 モデル

Source (pinned):

  Law id: 337M50000008017
  Revision: 337M50000008017_20260724_508M60000008092
  Amendment enforcement date: 2026-07-24 (revision date)
  Raw snapshot: data/raw/337M50000008017_20260724_508M60000008092.law.json

担当範囲原文（一字も変更せず、pinned JSON の正規化テキストから抽出、全文）:

  「軽油引取税の基準税額は、一一、二五〇円に、前年度における軽油引取税の課税標準となつた数量（一キロリットル未満の端数があるときは、その端数を四捨五入する。）に別表第十一に定める率を乗じて得た数量（一キロリットル未満の端数があるときは、その端数を四捨五入する。）を乗じて得た額とする。ただし、指定都市を包括する都道府県の基準税額は、当該額から当該都道府県の区域内の指定都市ごとに第三十八条の規定によつて算定した額を控除した額とする。」

  （見出し「（軽油引取税の基準税額の算定方法）第二十三条の二」は情報保持のため
    本 doc-comment にのみ記載し、計算には使わない。）

Computational result (bounded):

  基準税額 = 11,250 円 × roundKiloliter(数量 × 率)

  * `lightOilBaseAmount` = 一一、二五〇円 = 11_250。
  * `roundKiloliter` は「一キロリットル未満の端数を四捨五入」を round-half-up
    （0.5 を切り上げ）の整数算術で表現する: round(a / b) = floor((2a + b) / (2b))。
    原文の率適用「後」の四捨五入をここでモデル化する。率適用「前」の課税標準数量の
    四捨五入は caller-established（呼出側で丸め済みの数量を渡す）とする。
  * ただし書の指定都市控除は、基準税額から指定都市ごとの第 38 条算定額の合計を
    Nat saturating 減算する。各指定都市額は caller-established。
  * 指定都市を包括する都道府県か否かは caller-established の Bool で表し、
    Bool は金額式には入れず「どの算定関数を呼ぶか」の選択にのみ使用する。

Out of scope / honesty notes:

  * 別表第十一条の率の値・適用、第三十八条の指定都市ごとの額の算定、
    前年度課税標準数量の確定、指定都市の該当性・一覧、前年度の定義などは
    NOT MODELLED（すべて caller-established）。
  * 率・数量・各指定都市額・該当性は本モジュールでは一切推定しない。
  * `roundKiloliter` の round-half-up は原文「四捨五入」の整数モデルであり、
    「五捨五入」等别的な丸め慣行を断定するものではない。
  * 減算は Nat の saturating 減算（控除額が基準税額を超える場合は 0）。
  * 原文の見出し・ただし書の詳細は情報保持のため doc-comment に記載するのみ。
  * 軽油引取税・地方税全体の完成・網羅を主張しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.LightOilBaseTax

open JapanTaxLaw.TaxFinance

/-- 軽油の数量（キロリットル、非負の Nat）。caller-established。 -/
abbrev Quantity := Nat

-- ==== 法定額定数 ====

/-- 原文「一一、二五〇円」= 11_250。 -/
def lightOilBaseAmount : Money := 11_250

-- ==== 端数処理（一キロリットル未満を四捨五入） ====

/-- a / b を四捨五入（round half up、0.5 は切り上げ）した整数。
    floor((2a + b) / (2b)) で表現する。b > 0 を要求（率の分母は TaxRate が保証）。 -/
def roundDiv (a b : Nat) : Nat :=
  (2 * a + b) / (2 * b)

/-- 数量に率を乗じ、一キロリットル未満の端数を四捨五入した数量。
    率適用後の四捨五入をモデル化する。 -/
def roundKiloliter (quantity : Quantity) (rate : TaxRate) : Quantity :=
  roundDiv (quantity * rate.num) rate.den

-- ==== 基準税額 ====

/-- 軽油引取税の基準税額 = 一一、二五〇円 × 四捨五入後数量。 -/
def lightOilBaseTax (quantity : Quantity) (rate : TaxRate) : Money :=
  lightOilBaseAmount * roundKiloliter quantity rate

-- ==== ただし書：指定都市を包括する都道府県の控除 ====

/-- 指定都市ごとの第 38 条算定額の合計（各額は caller-established）。 -/
def designatedCityDeduction (amounts : List Money) : Money :=
  amounts.sum

/-- 指定都市を包括する都道府県の基準税額 =
    基準税額 − Σ(指定都市ごとの第 38 条算定額)（Nat saturating 減算）。 -/
def lightOilBaseTaxAfterDesignatedCityDeduction
    (quantity : Quantity) (rate : TaxRate) (designatedAmounts : List Money) : Money :=
  lightOilBaseTax quantity rate - designatedCityDeduction designatedAmounts

/-- 指定都市を包括する都道府県か否かは caller-established の Bool。
    Bool は金額式には入れず、どの算定関数を呼ぶかの選択にのみ使用する。 -/
def baseTaxFor (includesDesignatedCity : Bool) (quantity : Quantity)
    (rate : TaxRate) (designatedAmounts : List Money) : Money :=
  if includesDesignatedCity then
    lightOilBaseTaxAfterDesignatedCityDeduction quantity rate designatedAmounts
  else
    lightOilBaseTax quantity rate

-- ==== positivity ====

theorem lightOilBaseAmount_pos : 0 < lightOilBaseAmount := by decide

theorem roundDiv_den_pos_two_mul (r : TaxRate) : 0 < 2 * r.den := by
  exact Nat.mul_pos (by decide) r.den_pos

-- ==== 法定リテラルへの接続（exact 定理） ====

theorem lightOilBaseAmount_eq : lightOilBaseAmount = 11_250 := rfl

theorem roundDiv_eq (a b : Nat) : roundDiv a b = (2 * a + b) / (2 * b) := rfl

theorem roundKiloliter_eq (quantity : Quantity) (rate : TaxRate) :
    roundKiloliter quantity rate = roundDiv (quantity * rate.num) rate.den := rfl

theorem lightOilBaseTax_eq (quantity : Quantity) (rate : TaxRate) :
    lightOilBaseTax quantity rate = lightOilBaseAmount * roundKiloliter quantity rate := rfl

theorem lightOilBaseTax_eq_literal (quantity : Quantity) (rate : TaxRate) :
    lightOilBaseTax quantity rate =
      11_250 * ((2 * (quantity * rate.num) + rate.den) / (2 * rate.den)) := rfl

theorem designatedCityDeduction_eq (amounts : List Money) :
    designatedCityDeduction amounts = amounts.sum := rfl

theorem lightOilBaseTaxAfterDesignatedCityDeduction_eq
    (quantity : Quantity) (rate : TaxRate) (designatedAmounts : List Money) :
    lightOilBaseTaxAfterDesignatedCityDeduction quantity rate designatedAmounts =
      lightOilBaseTax quantity rate - designatedCityDeduction designatedAmounts := rfl

theorem baseTaxFor_true (quantity : Quantity) (rate : TaxRate)
    (designatedAmounts : List Money) :
    baseTaxFor true quantity rate designatedAmounts =
      lightOilBaseTaxAfterDesignatedCityDeduction quantity rate designatedAmounts := rfl

theorem baseTaxFor_false (quantity : Quantity) (rate : TaxRate)
    (designatedAmounts : List Money) :
    baseTaxFor false quantity rate designatedAmounts =
      lightOilBaseTax quantity rate := rfl

-- ==== 単調性・境界のモデル性質（有限の総称的性質、況用法判断ではない） ====

/-- 控除額が基準税額を超えれば 0（saturating 減算）。 -/
theorem afterDeduction_eq_zero_of_ge
    (quantity : Quantity) (rate : TaxRate) (designatedAmounts : List Money)
    (h : lightOilBaseAmount * roundKiloliter quantity rate ≤
         designatedCityDeduction designatedAmounts) :
    lightOilBaseTaxAfterDesignatedCityDeduction quantity rate designatedAmounts = 0 := by
  unfold lightOilBaseTaxAfterDesignatedCityDeduction lightOilBaseTax
  exact Nat.sub_eq_zero_of_le h

end JapanTaxLaw.LightOilBaseTax

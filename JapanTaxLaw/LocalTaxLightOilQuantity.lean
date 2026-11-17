import JapanTaxLaw.TaxFinance

/-!
# LocalTaxLightOilQuantity — 地方税法施行令 第四十三条の十三（軽油の引取りの際減少すべき軽油の数量）の bounded L4 モデル

Source (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json

担当範囲原文（一字も変更せず、pinned JSON の正規化テキストから抽出）:

  見出し「（法第百四十四条の十四第三項の引取りの際減少すべき軽油の数量）
  第四十三条の十三」
  本文「法第百四十四条の十四第三項に規定する政令で定める数量は、特約業者からの引取りに
  係る軽油については当該軽油の数量に百分の一を乗じて得た数量とし、元売業者からの
  引取りに係る軽油については当該軽油の数量に百分の〇・三を乗じて得た数量とする。」

Computational result (bounded):

  特約業者: 減少数量 = 軽油の数量 × 1 / 100     （百分の一、切り捨て）
  元売業者: 減少数量 = 軽油の数量 × 30 / 10000  （百分の〇・三、切り捨て）

  「百分の〇・三」は小数点を含む率なので分母 10000・分子 30 で表現する
  （30/10000 = 3/1000 = 0.003 = 0.3%）。分子 3 を分母 100 もしくは 1000 と
  誤って組むと 10 倍過大／過小になるため注意:
    正しい例: 数量 1000 → 3（0.3%）／ 誤った例: 同 1000 → 30（3%）。

区分（特約業者／元売業者）は caller-established の Bool で選択し、Bool は金額式には
入れず率の選択にのみ使用する。軽油の数量・課税標準・該当性もすべて caller-established。

Out of scope / honesty notes:

  * 法第百四十四条の十四第三項の該当性、「政令で定める数量」の他条との関係、
    特約業者／元売業者の定義・判定、数量の算定基礎、軽油引取税の課税標準・税額、
    端数処理の通達等は NOT MODELLED（すべて caller-established）。
  * Nat による切り捨て（floor）は本モデルの丸め規則であり、条文の端数処理を
    断定するものではない。
  * 原文の見出しは情報保持のため本 doc-comment にのみ記載し、計算には使わない。
  * 地方税法・軽油引取税全体の完成・網羅を主張しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.LocalTaxLightOilQuantity

open JapanTaxLaw.TaxFinance

/-- 軽油の数量（非負の Nat）。 caller-established。 -/
abbrev Quantity := Nat

-- ==== 法定割合（原文の百分率を分数として保持） ====

/-- 特約業者「百分の一」→ 1/100。 -/
def tokuteiReductionRate : TaxRate := ⟨1, 100, by decide⟩

/-- 元売業者「百分の〇・三」→ 0.3/100 = 30/10000 = 3/1000。
    小数点率なので分母 10000・分子 30（10 倍過大バグへの注意）。 -/
def motouriReductionRate : TaxRate := ⟨30, 10000, by decide⟩

/-- 区分は caller-established の Bool。true = 特約業者、false = 元売業者。
    Bool は率の選択にだけ使い、金額式には入れない。 -/
def reductionRate (isTokutei : Bool) : TaxRate :=
  if isTokutei then tokuteiReductionRate else motouriReductionRate

-- ==== 引取りの際減少すべき軽油の数量 ====

/-- 特約業者: 当該軽油の数量 × 1 / 100（切り捨て）。 -/
def lightOilReduction (quantity : Quantity) : Quantity :=
  quantity * 1 / 100

/-- 元売業者: 当該軽油の数量 × 30 / 10000（＝ × 3 / 1000、切り捨て）。 -/
def motouriLightOilReduction (quantity : Quantity) : Quantity :=
  quantity * 30 / 10000

/-- 区分別の減少数量。Bool は上の率選択にのみ使用し、金額式には入れない。 -/
def lightOilReductionForDealer (isTokutei : Bool) (quantity : Quantity) : Quantity :=
  if isTokutei then lightOilReduction quantity else motouriLightOilReduction quantity

-- ==== positivity ====

theorem tokuteiReductionRate_num_pos : 0 < tokuteiReductionRate.num := by decide
theorem tokuteiReductionRate_den_pos : 0 < tokuteiReductionRate.den := by decide
theorem motouriReductionRate_num_pos : 0 < motouriReductionRate.num := by decide
theorem motouriReductionRate_den_pos : 0 < motouriReductionRate.den := by decide

-- ==== 率選択の characterization ====

theorem reductionRate_true : reductionRate true = tokuteiReductionRate := rfl
theorem reductionRate_false : reductionRate false = motouriReductionRate := rfl

-- ==== 法定リテラルへの接続（exact 定理） ====

/-- 特約業者は `quantity * 1 / 100`（担当指定の定式そのもの）。 -/
theorem lightOilReduction_eq (quantity : Quantity) :
    lightOilReduction quantity = quantity * 1 / 100 := rfl

/-- 元売業者は `quantity * 30 / 10000`（百分の〇・三）。 -/
theorem motouriLightOilReduction_eq (quantity : Quantity) :
    motouriLightOilReduction quantity = quantity * 30 / 10000 := rfl

theorem lightOilReductionForDealer_true (quantity : Quantity) :
    lightOilReductionForDealer true quantity = lightOilReduction quantity := rfl

theorem lightOilReductionForDealer_false (quantity : Quantity) :
    lightOilReductionForDealer false quantity = motouriLightOilReduction quantity := rfl

theorem lightOilReduction_eq_applyFloor (quantity : Quantity) :
    lightOilReduction quantity = tokuteiReductionRate.applyFloor quantity := rfl

theorem motouriLightOilReduction_eq_applyFloor (quantity : Quantity) :
    motouriLightOilReduction quantity = motouriReductionRate.applyFloor quantity := rfl

theorem lightOilReductionForDealer_eq_applyFloor (isTokutei : Bool) (quantity : Quantity) :
    lightOilReductionForDealer isTokutei quantity = (reductionRate isTokutei).applyFloor quantity := by
  cases isTokutei <;> rfl

-- ==== kernel-decided smoke checks ====

-- 特約業者: 0 / 1 / 99 / 100 / 端数切り捨て
example : lightOilReduction 0 = 0 := by decide
example : lightOilReduction 1 = 0 := by decide
example : lightOilReduction 99 = 0 := by decide
example : lightOilReduction 100 = 1 := by decide
example : lightOilReduction 150 = 1 := by decide
-- 元売業者: 0 / 1 / 99 / 100 / 333 / 334 / 1000（10 倍過大バグのガード）
example : motouriLightOilReduction 0 = 0 := by decide
example : motouriLightOilReduction 1 = 0 := by decide
example : motouriLightOilReduction 99 = 0 := by decide
example : motouriLightOilReduction 100 = 0 := by decide
example : motouriLightOilReduction 333 = 0 := by decide
example : motouriLightOilReduction 334 = 1 := by decide
example : motouriLightOilReduction 1000 = 3 := by decide
-- 区分選択（Bool は率選択のみ）
example : lightOilReductionForDealer true 100 = 1 := by decide
example : lightOilReductionForDealer false 100 = 0 := by decide
example : lightOilReductionForDealer true 1000 = 10 := by decide
example : lightOilReductionForDealer false 1000 = 3 := by decide

end JapanTaxLaw.LocalTaxLightOilQuantity

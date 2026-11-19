import JapanTaxLaw.TaxFinance

/-!
# ResidentTaxTransitionalRates — 地方税法施行令 art. 12（市町村民税に関する経過措置の税率）bounded L4 モデル

Source (pinned):
  Law id: 347CO0000000161
  Revision: 347CO0000000161_20010106_412CO0000000304
  Raw snapshot: data/raw/347CO0000000161_20010106_412CO0000000304.law.json
  担当範囲の原文: C7_localrate.txt（UTF-8, 5921 文字, art. 12 全体）
  （Equals the pinned JSON 第12条 leaf-text; verified verbatim, see STAGING_RTTR.md）

Models only 第1項の各号（政令で定める率＝税率・年額の算術）:

* 一 均等割
    - イ 標準税率 年額 290 円（人口五万未満の市及び町村にあつては、150 円）
    - ロ 制限税率 年額 430 円（人口五万未満の市及び町村にあつては、230 円）
* 二 所得割
    - イ 標準税率 = 地方税法 314 条の3 1項の表の下欄の率 × 百分の八十 (80/100)
    - ロ 制限税率 = イの率 × 一・五 (15/10)
* 三 退職手当等に係る所得割
    - = 地方税法 328 条の3 の表の下欄の率 × 百分の八十 (80/100)

Scope & honest boundaries (overclaim 防止):

* 表の率（314 条の3 / 328 条の3 の表の下欄の率）・その金額区分・該当性は
  **caller-established**。本モジュールは `tableRate` を既に確定した数値（Money = Nat、
  例えば「百分の十」なら 10）として受け取り、乗算・切り捨ての算術のみを扱う。
  表そのものの丸め・区分判定・納税者の該当性判定は **Bool は金額式に入れず**、
  呼び出し側で行う。
* 人口区分（「人口五万未満」）も **caller-established**。`populationUnder50k` は
  原文の境界 50,000 を表す述語にすぎず、どの金額式にも現れない。実際の市町村の
  人口・区分の認定は呼び出し側が行い、対応する定数（standard/limit × small/通常）を
  選ぶ。２つの小規模用定数と２つの通常用定数は独立に与える。
* 端数処理は `TaxRate.applyFloor`（Nat 切り捨て）に委ねる。原文は「乗じて得た率」とし
  端数規定を本条に持たないため、丸め規則は per-law business data として floor を
  採用したことを明示する。税法上の丸めの妥当性は human legal review 待ち。
* 第2項以降（他条文の規定の適用・沖縄県の市町村に関する経過措置・読み替え表・
  医療費/生命保険料控除・簡易税額表・税額控除・四分の三特例等）は
  **NOT MODELLED**。本スライスは第1項の率・年額の算術のみを写す。

Pinned evidence in doc-comments only; all theorems here claim properties of
the model only, never of the real legal semantics (誠実性の原則 —
Pin ↔ 原文一致 is the trust boundary; interpretation is not guaranteed).
-/

namespace JapanTaxLaw.ResidentTaxTransitionalRates

open JapanTaxLaw.TaxFinance

-- ==== 一 均等割 — 年額（円、caller-established の区分に対応する 4 定数） ====

/-- 一 イ 標準税率（年額 290 円）。 -/
def standardPerCapita : Money := 290

/-- 一 イ 標準税率・人口五万未満の市及び町村（年額 150 円）。 -/
def standardPerCapitaSmall : Money := 150

/-- 一 ロ 制限税率（年額 430 円）。 -/
def limitPerCapita : Money := 430

/-- 一 ロ 制限税率・人口五万未満の市及び町村（年額 230 円）。 -/
def limitPerCapitaSmall : Money := 230

/-- 原文「人口五万未満」の境界述語。金額式には一切現れず、境界の smoke のみに用いる。
    実際の人口区分の認定は caller-established。 -/
def populationUnder50k (population : Nat) : Bool := population < 50_000

-- ==== 乗ずる率（原文の百分の八十 / 一・五をそのまま分子・分母に写す） ====

/-- 百分の八十 = 80/100（二 イ および三）。 -/
def percent80Rate : TaxRate := ⟨80, 100, by decide⟩

/-- 一・五 = 15/10（二 ロ）。10 倍過大の 150/10 ではない。 -/
def oneAndHalfRate : TaxRate := ⟨15, 10, by decide⟩

-- ==== 二 所得割 / 三 退職手当等に係る所得割 ====

/-- 二 イ 所得割標準税率 = 表の率に百分の八十を乗じて得た率（floor）。
    `tableRate` は caller-established の表の率の数値。 -/
def incomeTaxStandardRate (tableRate : Money) : Money :=
  percent80Rate.applyFloor tableRate

/-- 二 ロ 所得割制限税率 = イの率に一・五を乗じて得た率（floor）。
    15/10（150/10 ではない）を `incomeTaxStandardRate` の結果に掛ける。 -/
def incomeTaxLimitRate (tableRate : Money) : Money :=
  oneAndHalfRate.applyFloor (incomeTaxStandardRate tableRate)

/-- 三 退職手当等に係る所得割 = 表の率に百分の八十を乗じて得た率（floor）。
    二 イ と同じ 80/100 算術だが、根拠表（328 条の3）が異なるため別名とする。 -/
def retirementIncomeTaxStandardRate (tableRate : Money) : Money :=
  percent80Rate.applyFloor tableRate

-- ==== positivity / well-definedness ====

theorem standardPerCapita_pos : 0 < standardPerCapita := by decide
theorem standardPerCapitaSmall_pos : 0 < standardPerCapitaSmall := by decide
theorem limitPerCapita_pos : 0 < limitPerCapita := by decide
theorem limitPerCapitaSmall_pos : 0 < limitPerCapitaSmall := by decide

theorem percent80Rate_den_pos : 0 < percent80Rate.den := by decide
theorem oneAndHalfRate_den_pos : 0 < oneAndHalfRate.den := by decide

-- ==== model properties（実法の性質ではなくモデルの性質のみ） ====

/-- 境界述語: 49,999 は五万未満、50,000 は五万未満ではない。 -/
theorem populationUnder50k_boundary :
    populationUnder50k 49_999 = true ∧ populationUnder50k 50_000 = false := by
  decide

/-- 二 イ: 表の率 0 は 0。 -/
theorem incomeTaxStandardRate_zero : incomeTaxStandardRate 0 = 0 := by decide

/-- 二 ロ: 表の率 0 は 0。 -/
theorem incomeTaxLimitRate_zero : incomeTaxLimitRate 0 = 0 := by decide

/-- 三: 表の率 0 は 0。 -/
theorem retirementIncomeTaxStandardRate_zero : retirementIncomeTaxStandardRate 0 = 0 := by
  decide

/-- 三 と 二 イ は同じ 80/100 算術（根拠表のみ異なる）。 -/
theorem retirementIncomeTaxStandardRate_eq (tableRate : Money) :
    retirementIncomeTaxStandardRate tableRate = incomeTaxStandardRate tableRate := by
  rfl

/-- 一・五倍トラップ: 制限税率は 15/10 であり 150/10 ではない（2 → 1、30 ではない）。 -/
theorem incomeTaxLimitRate_no_tenfold_trap :
    incomeTaxLimitRate 2 = 1 ∧ incomeTaxLimitRate 2 ≠ 30 := by
  decide

/-- 二 イ: 算出額は caller-established の表の率について単調。 -/
theorem incomeTaxStandardRate_mono {a b : Money} (h : a ≤ b) :
    incomeTaxStandardRate a ≤ incomeTaxStandardRate b := by
  simp [incomeTaxStandardRate, percent80Rate, TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 80 h)

/-- 二 ロ: 制得税率も単調（内側の標準税率の単調性と 15/10 の単調性を合成）。 -/
theorem incomeTaxLimitRate_mono {a b : Money} (h : a ≤ b) :
    incomeTaxLimitRate a ≤ incomeTaxLimitRate b := by
  simp [incomeTaxLimitRate, oneAndHalfRate, TaxRate.applyFloor]
  exact Nat.div_le_div_right
    (Nat.mul_le_mul_right 15 (Nat.div_le_div_right (Nat.mul_le_mul_right 80 h)))

/-- 三: 算出額は単調。 -/
theorem retirementIncomeTaxStandardRate_mono {a b : Money} (h : a ≤ b) :
    retirementIncomeTaxStandardRate a ≤ retirementIncomeTaxStandardRate b := by
  simp [retirementIncomeTaxStandardRate, percent80Rate, TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 80 h)

end JapanTaxLaw.ResidentTaxTransitionalRates

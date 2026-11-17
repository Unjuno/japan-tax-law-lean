import JapanTaxLaw.TaxFinance

/-!
# IncomeWithholdingRates — 所得税法 art. 208 / 175 / 179（源泉徴収税率）の bounded L4 モデル

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B
  (data/raw/340AC0000000033_20261001_507AC0000000070.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as IndividualIncomeTax.lean / IncomeMiscDeductions.lean)

Pinned bytes 逐語 (needle evidence, transcribed one-for-one from the normalized source):

  art. 208 「…その支払われる年金の額に対応するものとして政令で定めるところにより
            計算した金額を控除した金額に百分の十の税率を乗じて計算した金額とする。」
  art. 175 「給付補てん金、利息、利益若しくは差益その金額に百分の十五の税率を…
            配当等又は同条第九号に掲げる利益の分配その金額に百分の二十の税率を…」
  art. 179 「…第百六十九条第二号、第四号及び第五号…に掲げる国内源泉所得については、
            これらの規定に定める金額）に百分の二十の税率を…
            第百六十一条第一項第五号（国内源泉所得）に掲げる国内源泉所得その金額に
            百分の十の税率を…
            第百六十一条第一項第八号及び第十五号に掲げる国内源泉所得…に
            百分の十五の税率を…」

Computational result (bounded):

  art. 208  徴収税額 = (年金 − 保険料対応額) × 10 / 100 (floor)
             控除は saturating Nat（年金 < 保険料対応額 なら控除後 = 0）
  art. 175  利子等 = 金額 × 15 / 100, 配当等 = 金額 × 20 / 100 (2 区分, floor)
  art. 179  一号 = 金額 × 20 / 100, 二号 = 金額 × 10 / 100,
             三号 = 金額 × 15 / 100 (3 区分, floor)

Out of scope / honesty notes:

  * 課税標準額（年金の額・利子等／配当等の金額・国内源泉所得の金額）、
    利子等／配当等の区分、国内源泉所得の一号／二号／三号の区分、
    および art. 208 の「政令で定めるところにより計算した金額」（保険料対応額）は
    すべて caller-established とし、算出式には入れない（Bool を金額式に混入させない）。
  * art. 179 の区分判定そのもの、第百六十九条一号・二号・四号・五号による課税標準の
    読み替え、第百六十一条各号の該当性、租税条約上の軽減・免除、
    また art. 175 第三号（賞金・政令控除・10%）は **NOT MODELLED**。
  * 丸めは切り捨て（TaxRate.applyFloor）。端数処理（通則法 art. 118 / 119）、
    復興特別所得税・防衛特別所得税、確定申告上の調整は非モデル化。
  * 所得税法全体の完成・網羅を主張しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.IncomeWithholdingRates

open JapanTaxLaw.TaxFinance

private theorem natSubEqZeroOfLeFree {a b : Nat} (h : a ≤ b) : a - b = 0 := by
  induction b generalizing a with
  | zero =>
      cases a with
      | zero => rfl
      | succ a => exact (Nat.not_succ_le_zero a h).elim
  | succ b ih =>
      cases a with
      | zero => exact Nat.zero_sub (Nat.succ b)
      | succ a =>
          rw [Nat.succ_sub_succ]
          exact ih (Nat.succ_le_succ_iff.mp h)

-- ============================================================
-- art. 208（徴収税額）: 年金 − 保険料対応額 × 10%
-- ============================================================

/-- art. 208（徴収税額）: 百分の十。 -/
def article208WithholdingRate : TaxRate := ⟨10, 100, by decide⟩

/-- art. 208: 控除後年金 = 年金の額 − 保険料対応額（saturating Nat）。
    保険料対応額（政令で定めるところにより計算した金額）は caller-established。 -/
def article208DeductedAnnuity (annuityAmount : Money)
    (premiumCorrespondingAmount : Money) : Money :=
  annuityAmount - premiumCorrespondingAmount

/-- art. 208: 徴収税額 = 控除後年金 × 10 / 100（切り捨て）。 -/
def article208WithholdingTax (annuityAmount : Money)
    (premiumCorrespondingAmount : Money) : Money :=
  article208WithholdingRate.applyFloor
    (article208DeductedAnnuity annuityAmount premiumCorrespondingAmount)

-- --- positivity ---

theorem article208WithholdingRate_num_pos : 0 < article208WithholdingRate.num := by decide
theorem article208WithholdingRate_den_pos : 0 < article208WithholdingRate.den := by decide

-- --- exact 定理（saturating 減算の2分岐を明示） ---

theorem article208DeductedAnnuity_of_ge (annuityAmount : Money)
    (premiumCorrespondingAmount : Money) (_h : premiumCorrespondingAmount ≤ annuityAmount) :
    article208DeductedAnnuity annuityAmount premiumCorrespondingAmount =
      annuityAmount - premiumCorrespondingAmount := rfl

theorem article208DeductedAnnuity_of_lt (annuityAmount : Money)
    (premiumCorrespondingAmount : Money) (h : annuityAmount < premiumCorrespondingAmount) :
    article208DeductedAnnuity annuityAmount premiumCorrespondingAmount = 0 := by
  unfold article208DeductedAnnuity
  exact natSubEqZeroOfLeFree (Nat.le_of_lt h)

theorem article208DeductedAnnuity_le_annuity (annuityAmount : Money)
    (premiumCorrespondingAmount : Money) :
    article208DeductedAnnuity annuityAmount premiumCorrespondingAmount ≤ annuityAmount := by
  unfold article208DeductedAnnuity
  exact Nat.sub_le _ _

theorem article208WithholdingTax_eq (annuityAmount : Money)
    (premiumCorrespondingAmount : Money) :
    article208WithholdingTax annuityAmount premiumCorrespondingAmount =
      (annuityAmount - premiumCorrespondingAmount) * 10 / 100 := rfl

-- ============================================================
-- art. 175（内国法人に課する所得税の税率）: 利子等 15% / 配当等 20%
-- ============================================================

/-- art. 175 第一号（利子等）: 百分の十五。
    名称 `annuityWithholdingRate` は担当指定に従う（実際の対象は利子等）。 -/
def annuityWithholdingRate : TaxRate := ⟨15, 100, by decide⟩

/-- art. 175 第二号（配当等）: 百分の二十。 -/
def dividendWithholdingRate : TaxRate := ⟨20, 100, by decide⟩

/-- art. 175 の2区分。利子等か配当等かは caller-established Bool。
    true = 配当等（20%）、false = 利子等（15%）。 -/
def article175Rate (isDividend : Bool) : TaxRate :=
  if isDividend then dividendWithholdingRate else annuityWithholdingRate

/-- art. 175: 徴収税額 = 金額 × (15% or 20%)（切り捨て）。 -/
def article175WithholdingTax (isDividend : Bool) (amount : Money) : Money :=
  (article175Rate isDividend).applyFloor amount

-- --- positivity ---

theorem annuityWithholdingRate_num_pos : 0 < annuityWithholdingRate.num := by decide
theorem dividendWithholdingRate_num_pos : 0 < dividendWithholdingRate.num := by decide

-- --- 率選択の characterization ---

theorem article175Rate_dividend : article175Rate true = dividendWithholdingRate := rfl
theorem article175Rate_interest : article175Rate false = annuityWithholdingRate := rfl

-- --- exact 定理（法定リテラルへの接続） ---

theorem article175WithholdingTax_dividend (amount : Money) :
    article175WithholdingTax true amount = amount * 20 / 100 := rfl

theorem article175WithholdingTax_interest (amount : Money) :
    article175WithholdingTax false amount = amount * 15 / 100 := rfl

-- ============================================================
-- art. 179（外国法人に課する所得税の税率）: 一号 20% / 二号 10% / 三号 15%
-- ============================================================

/-- art. 179 第一号（前条に規定する国内源泉所得のうち次号・第三号を除くもの）: 百分の二十。 -/
def foreignCorpGeneralRate : TaxRate := ⟨20, 100, by decide⟩

/-- art. 179 第二号（第百六十一条第一項第五号の国内源泉所得）: 百分の十。 -/
def foreignCorpArticle161Item5Rate : TaxRate := ⟨10, 100, by decide⟩

/-- art. 179 第三号（第百六十一条第一項第八号及び第十五号の国内源泉所得）: 百分の十五。 -/
def foreignCorpArticle161Item8Or15Rate : TaxRate := ⟨15, 100, by decide⟩

/-- art. 179 の3区分。いずれの号に該当するかは caller-established。
    区分判定ロジック・第百六十九条による課税標準の読み替えは NOT MODELLED。 -/
inductive ForeignCorpDomesticSourceCategory where
  | general
  | item5
  | item8Or15

/-- art. 179 の率選択（3区分）。 -/
def article179Rate (category : ForeignCorpDomesticSourceCategory) : TaxRate :=
  match category with
  | .general => foreignCorpGeneralRate
  | .item5 => foreignCorpArticle161Item5Rate
  | .item8Or15 => foreignCorpArticle161Item8Or15Rate

/-- art. 179: 徴収税額 = 金額 × (20% or 10% or 15%)（切り捨て）。
    課税標準額は caller-established。 -/
def article179WithholdingTax (category : ForeignCorpDomesticSourceCategory)
    (amount : Money) : Money :=
  (article179Rate category).applyFloor amount

-- --- positivity ---

theorem foreignCorpGeneralRate_num_pos : 0 < foreignCorpGeneralRate.num := by decide
theorem foreignCorpArticle161Item5Rate_num_pos : 0 < foreignCorpArticle161Item5Rate.num := by decide
theorem foreignCorpArticle161Item8Or15Rate_num_pos : 0 < foreignCorpArticle161Item8Or15Rate.num := by decide

-- --- 率選択の characterization ---

theorem article179Rate_general :
    article179Rate .general = foreignCorpGeneralRate := rfl
theorem article179Rate_item5 :
    article179Rate .item5 = foreignCorpArticle161Item5Rate := rfl
theorem article179Rate_item8Or15 :
    article179Rate .item8Or15 = foreignCorpArticle161Item8Or15Rate := rfl

-- --- exact 定理（法定リテラルへの接続） ---

theorem article179WithholdingTax_general (amount : Money) :
    article179WithholdingTax .general amount = amount * 20 / 100 := rfl

theorem article179WithholdingTax_item5 (amount : Money) :
    article179WithholdingTax .item5 amount = amount * 10 / 100 := rfl

theorem article179WithholdingTax_item8Or15 (amount : Money) :
    article179WithholdingTax .item8Or15 amount = amount * 15 / 100 := rfl

-- ==== kernel-decided smoke checks ====

example : article208WithholdingRate.num = 10 := by decide
example : article208DeductedAnnuity 1_000_000 250_000 = 750_000 := by decide
example : article208DeductedAnnuity 100 101 = 0 := by decide
example : article208WithholdingTax 1_000_000 250_000 = 75_000 := by decide
example : article208WithholdingTax 1_000 1_100 = 0 := by decide

example : annuityWithholdingRate.num = 15 := by decide
example : dividendWithholdingRate.num = 20 := by decide
example : article175WithholdingTax false 1_000_000 = 150_000 := by decide
example : article175WithholdingTax true 1_000_000 = 200_000 := by decide
example : article175WithholdingTax true 100 > article175WithholdingTax false 100 := by decide

example : foreignCorpGeneralRate.num = 20 := by decide
example : foreignCorpArticle161Item5Rate.num = 10 := by decide
example : foreignCorpArticle161Item8Or15Rate.num = 15 := by decide
example : article179WithholdingTax .general 1_000_000 = 200_000 := by decide
example : article179WithholdingTax .item5 1_000_000 = 100_000 := by decide
example : article179WithholdingTax .item8Or15 1_000_000 = 150_000 := by decide

end JapanTaxLaw.IncomeWithholdingRates

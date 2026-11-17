import JapanTaxLaw.TaxFinance

/-!
# IncomeMiscDeductions — 所得税法 art. 80 / 81 / 82（寡婦・ひとり親・勤労学生控除）と
   art. 170 / 182 / 209の3 / 211（源泉徴収・分離課税の税率）の bounded L4 モデル

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B
  (data/raw/340AC0000000033_20261001_507AC0000000070.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as IndividualIncomeTax.lean)

Namespace note: a dedicated sub-namespace `JapanTaxLaw.IncomeMiscDeductions` is used
on purpose. The flat `JapanTaxLaw` namespace already owns `widowDeduction` /
`singleParentDeduction` / `workingStudentDeduction` from 地方税法 art. 34
(LocalIncomeTax.lean) with DIFFERENT amounts (¥260,000 / ¥300,000 / ¥260,000).
The 所得税法 constants modelled here are ¥270,000 / ¥350,000 / ¥270,000.

Pinned bytes 逐語 (needle evidence, transcribed one-for-one from the normalized source):

  art. 80  「居住者が寡婦である場合には、その者のその年分の総所得金額、退職所得金額又は山林所得金額から二十七万円を控除する。」
           「前項の規定による控除は、寡婦控除という。」
  art. 81  「居住者がひとり親である場合には、その者のその年分の総所得金額、退職所得金額又は山林所得金額から三十五万円を控除する。」
           「前項の規定による控除は、ひとり親控除という。」
  art. 82  「居住者が勤労学生である場合には、その者のその年分の総所得金額、退職所得金額又は山林所得金額から二十七万円を控除する。」
           「前項の規定による控除は、勤労学生控除という。」
  art. 170 「…国内源泉所得の金額に百分の二十（…については、百分の十五）の税率を乗じて計算した金額とする。」
  art. 182 「一利子等その金額に百分の十五の税率を乗じて計算した金額二配当等その金額に百分の二十の税率を乗じて計算した金額」
  art. 209の3 「…給付補てん金、利息、利益又は差益の額に百分の十五の税率を乗じて計算した金額とする。」
  art. 211 「…契約に基づき支払われる利益の分配の額に百分の二十の税率を乗じて計算した金額とする。」

Computational result (bounded):

  控除3条:
    widowDeduction          = 270_000
    singleParentDeduction   = 350_000
    workingStudentDeduction = 270_000
    incomeAfter<X>Deduction totalIncome = totalIncome − <X>Deduction  (saturating Nat)

  税率条:
    art. 211     徴収税額 = 利益分配額 × 20 / 100  (floor)
    art. 209の3  徴収税額 = 給付補てん金等 × 15 / 100  (floor)
    art. 182     利子等 = 金額 × 15 / 100, 配当等 = 金額 × 20 / 100 (2区分, floor)
    art. 170     国内源泉所得 = 金額 × 20 / 100,
                 一部（161条1項8号・15号の国内源泉所得）= 15 / 100 (floor)

Out of scope / honesty notes:

  * 該当性（寡婦・ひとり親・勤労学生であること、利子等／配当等の区分、
    161条1項8号及び15号に掲げる国内源泉所得に該当すること）はすべて
    caller-established とし、控除額・税率の算出式には入れない（Bool を式に混入させない）。
  * 控除の適用順序・所得の金額（totalIncome）自体の算定・復興特別所得税・
    防衛特別所得税・確定申告上の調整・端数処理（通則法 art. 118 / 119）は非モデル化。
  * art. 170 の「前条に規定する所得税の額」の算定そのものは当スライスの外。
  * 所得税法全体の完成・網羅を主張しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.IncomeMiscDeductions

open JapanTaxLaw.TaxFinance

-- ============================================================
-- 控除3条: art. 80 / 81 / 82（控除額定数 + saturating 控除後）
-- ============================================================

/-- art. 80（寡婦控除）: 二十七万円。 -/
def widowDeduction : Money := 270_000

/-- art. 80: 控除後の金額 = 総所得等 − 二十七万円（saturating Nat）。
    寡婦であることの該当性は caller-established で、この式には入れない。 -/
def incomeAfterWidowDeduction (totalIncome : Money) : Money :=
  totalIncome - widowDeduction

/-- art. 81（ひとり親控除）: 三十五万円。 -/
def singleParentDeduction : Money := 350_000

/-- art. 81: 控除後の金額 = 総所得等 − 三十五万円（saturating Nat）。 -/
def incomeAfterSingleParentDeduction (totalIncome : Money) : Money :=
  totalIncome - singleParentDeduction

/-- art. 82（勤労学生控除）: 二十七万円。 -/
def workingStudentDeduction : Money := 270_000

/-- art. 82: 控除後の金額 = 総所得等 − 二十七万円（saturating Nat）。 -/
def incomeAfterWorkingStudentDeduction (totalIncome : Money) : Money :=
  totalIncome - workingStudentDeduction

-- --- positivity ---

theorem widowDeduction_pos : 0 < widowDeduction := by decide
theorem singleParentDeduction_pos : 0 < singleParentDeduction := by decide
theorem workingStudentDeduction_pos : 0 < workingStudentDeduction := by decide

/-- `a ≤ b → a - b = 0` の axiom-free 証明。core の `Nat.sub_eq_zero_of_le` は
    `propext` に依存するため、ここでは `Nat.zero_sub` / `Nat.succ_sub_succ`
    （いずれも axiom-free）を用いた帰納法で自前で示す。 -/
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

-- --- exact 定理（saturating 減算の2分岐を明示） ---

theorem incomeAfterWidowDeduction_of_ge (totalIncome : Money)
    (_h : widowDeduction ≤ totalIncome) :
    incomeAfterWidowDeduction totalIncome = totalIncome - widowDeduction := rfl

theorem incomeAfterWidowDeduction_of_lt (totalIncome : Money)
    (h : totalIncome < widowDeduction) :
    incomeAfterWidowDeduction totalIncome = 0 := by
  unfold incomeAfterWidowDeduction
  exact natSubEqZeroOfLeFree (Nat.le_of_lt h)

theorem incomeAfterSingleParentDeduction_of_ge (totalIncome : Money)
    (_h : singleParentDeduction ≤ totalIncome) :
    incomeAfterSingleParentDeduction totalIncome = totalIncome - singleParentDeduction := rfl

theorem incomeAfterSingleParentDeduction_of_lt (totalIncome : Money)
    (h : totalIncome < singleParentDeduction) :
    incomeAfterSingleParentDeduction totalIncome = 0 := by
  unfold incomeAfterSingleParentDeduction
  exact natSubEqZeroOfLeFree (Nat.le_of_lt h)

theorem incomeAfterWorkingStudentDeduction_of_ge (totalIncome : Money)
    (_h : workingStudentDeduction ≤ totalIncome) :
    incomeAfterWorkingStudentDeduction totalIncome = totalIncome - workingStudentDeduction := rfl

theorem incomeAfterWorkingStudentDeduction_of_lt (totalIncome : Money)
    (h : totalIncome < workingStudentDeduction) :
    incomeAfterWorkingStudentDeduction totalIncome = 0 := by
  unfold incomeAfterWorkingStudentDeduction
  exact natSubEqZeroOfLeFree (Nat.le_of_lt h)

/-- 控除後は元の総所得を超えない。 -/
theorem incomeAfterWidowDeduction_le_total (totalIncome : Money) :
    incomeAfterWidowDeduction totalIncome ≤ totalIncome := by
  unfold incomeAfterWidowDeduction
  exact Nat.sub_le _ _

theorem incomeAfterSingleParentDeduction_le_total (totalIncome : Money) :
    incomeAfterSingleParentDeduction totalIncome ≤ totalIncome := by
  unfold incomeAfterSingleParentDeduction
  exact Nat.sub_le _ _

theorem incomeAfterWorkingStudentDeduction_le_total (totalIncome : Money) :
    incomeAfterWorkingStudentDeduction totalIncome ≤ totalIncome := by
  unfold incomeAfterWorkingStudentDeduction
  exact Nat.sub_le _ _

-- ============================================================
-- 税率条: art. 211 / 209の3 / 182 / 170（TaxRate.applyFloor）
-- ============================================================

/-- art. 211（徴収税額）: 利益の分配の額に百分の二十。 -/
def profitDistributionRate : TaxRate := ⟨20, 100, by decide⟩

/-- art. 211: 徴収税額 = 利益分配額 × 20 / 100（切り捨て）。 -/
def profitDistributionWithholdingTax (profitDistributionAmount : Money) : Money :=
  profitDistributionRate.applyFloor profitDistributionAmount

/-- art. 209の3（徴収税額）: 給付補てん金、利息、利益又は差益の額に百分の十五。 -/
def benefitSupplementRate : TaxRate := ⟨15, 100, by decide⟩

/-- art. 209の3: 徴収税額 = 給付補てん金等 × 15 / 100（切り捨て）。 -/
def benefitSupplementWithholdingTax (supplementAmount : Money) : Money :=
  benefitSupplementRate.applyFloor supplementAmount

/-- art. 182 第一号（利子等）: 百分の十五。 -/
def interestWithholdingRate : TaxRate := ⟨15, 100, by decide⟩

/-- art. 182 第二号（配当等）: 百分の二十。 -/
def dividendWithholdingRate : TaxRate := ⟨20, 100, by decide⟩

/-- art. 182 の2区分。利子等か配当等かは caller-established Bool。
    true = 配当等（20%）、false = 利子等（15%）。 -/
def article182Rate (isDividend : Bool) : TaxRate :=
  if isDividend then dividendWithholdingRate else interestWithholdingRate

/-- art. 182: 徴収税額 = 金額 × (15% or 20%)（切り捨て）。 -/
def article182WithholdingTax (isDividend : Bool) (amount : Money) : Money :=
  (article182Rate isDividend).applyFloor amount

/-- art. 170 原則: 国内源泉所得に百分の二十。 -/
def separateTaxationRate : TaxRate := ⟨20, 100, by decide⟩

/-- art. 170 ただし書（161条1項8号・15号の国内源泉所得）: 百分の十五。 -/
def separateTaxationReducedRate : TaxRate := ⟨15, 100, by decide⟩

/-- art. 170 の率選択。該当性は caller-established Bool。
    true = 軽減（15%）、false = 原則（20%）。 -/
def article170Rate (isReduced : Bool) : TaxRate :=
  if isReduced then separateTaxationReducedRate else separateTaxationRate

/-- art. 170: 分離課税額 = 国内源泉所得 × (20% or 15%)（切り捨て）。 -/
def article170SeparateTax (isReduced : Bool) (domesticSourceIncome : Money) : Money :=
  (article170Rate isReduced).applyFloor domesticSourceIncome

-- --- positivity（全率の分子は正） ---

theorem profitDistributionRate_num_pos : 0 < profitDistributionRate.num := by decide
theorem benefitSupplementRate_num_pos : 0 < benefitSupplementRate.num := by decide
theorem interestWithholdingRate_num_pos : 0 < interestWithholdingRate.num := by decide
theorem dividendWithholdingRate_num_pos : 0 < dividendWithholdingRate.num := by decide
theorem separateTaxationRate_num_pos : 0 < separateTaxationRate.num := by decide
theorem separateTaxationReducedRate_num_pos : 0 < separateTaxationReducedRate.num := by decide

-- --- 率選択の characterization ---

theorem article182Rate_dividend : article182Rate true = dividendWithholdingRate := rfl
theorem article182Rate_interest : article182Rate false = interestWithholdingRate := rfl
theorem article170Rate_reduced : article170Rate true = separateTaxationReducedRate := rfl
theorem article170Rate_standard : article170Rate false = separateTaxationRate := rfl

-- --- exact 定理（法定リテラルへの接続） ---

theorem profitDistributionWithholdingTax_eq (amount : Money) :
    profitDistributionWithholdingTax amount = amount * 20 / 100 := rfl

theorem benefitSupplementWithholdingTax_eq (amount : Money) :
    benefitSupplementWithholdingTax amount = amount * 15 / 100 := rfl

theorem article182WithholdingTax_dividend (amount : Money) :
    article182WithholdingTax true amount = amount * 20 / 100 := rfl

theorem article182WithholdingTax_interest (amount : Money) :
    article182WithholdingTax false amount = amount * 15 / 100 := rfl

theorem article170SeparateTax_reduced (amount : Money) :
    article170SeparateTax true amount = amount * 15 / 100 := rfl

theorem article170SeparateTax_standard (amount : Money) :
    article170SeparateTax false amount = amount * 20 / 100 := rfl

-- ==== kernel-decided smoke checks ====

example : incomeAfterWidowDeduction 1_000_000 = 730_000 := by decide
example : incomeAfterWidowDeduction 270_000 = 0 := by decide
example : incomeAfterWidowDeduction 100_000 = 0 := by decide
example : incomeAfterSingleParentDeduction 1_000_000 = 650_000 := by decide
example : incomeAfterSingleParentDeduction 350_000 = 0 := by decide
example : incomeAfterWorkingStudentDeduction 1_000_000 = 730_000 := by decide
example : incomeAfterWorkingStudentDeduction 270_000 = 0 := by decide

example : profitDistributionWithholdingTax 1_000_000 = 200_000 := by decide
example : profitDistributionWithholdingTax 5 = 1 := by decide
example : benefitSupplementWithholdingTax 1_000_000 = 150_000 := by decide
example : benefitSupplementWithholdingTax 9 = 1 := by decide
example : article182WithholdingTax true 1_000_000 = 200_000 := by decide
example : article182WithholdingTax false 1_000_000 = 150_000 := by decide
example : article170SeparateTax false 1_000_000 = 200_000 := by decide
example : article170SeparateTax true 1_000_000 = 150_000 := by decide
example : article170SeparateTax false 1 = 0 := by decide

end JapanTaxLaw.IncomeMiscDeductions

import JapanTaxLaw.GiftTax
import JapanTaxLaw.GiftTaxSpec
import JapanTaxLaw.CorporateTaxRate
import JapanTaxLaw.CorporateTaxRateSpec
import JapanTaxLaw.IndividualIncomeTax
import JapanTaxLaw.IndividualIncomeTaxSpec
import JapanTaxLaw.InheritanceTax
import JapanTaxLaw.InheritanceTaxSpec
import JapanTaxLaw.InheritanceSurcharge
import JapanTaxLaw.InheritanceSurchargeSpec
import JapanTaxLaw.InheritanceSuccessiveDeduction
import JapanTaxLaw.InheritanceSuccessiveDeductionSpec
import JapanTaxLaw.GiftAddBack
import JapanTaxLaw.GiftAddBackSpec
import JapanTaxLaw.SpousalGiftDeduction
import JapanTaxLaw.SpousalGiftDeductionSpec
import JapanTaxLaw.StampTable
import JapanTaxLaw.StampTableSpec
import JapanTaxLaw.RegistrationTax
import JapanTaxLaw.RegistrationTaxSpec
import JapanTaxLaw.LocalIncomeTax
import JapanTaxLaw.LocalIncomeTaxSpec
import JapanTaxLaw.ConsumptionTaxRate
import JapanTaxLaw.ConsumptionTaxRateSpec
import JapanTaxLaw.CorporateSurtax
import JapanTaxLaw.CorporateSurtaxSpec

/-!
# CounterexampleSweep — bounded counterexample discovery for pinned L4 models (L6 v1)

本モジュールは、**マージ済みの L4 モデルとその仕様モジュールの間に、列挙した
有限領域内で反例が存在しないこと** を、カーネルに `decide` させて機械検査する
L6（Counterexample Discovery）の第一段階である。

## 何を保証するか（誠実な射程）

* 各 `sweep_*` 定理は、仕様（Spec）と実装の一致を、**列挙した有限領域で全ての点** において
  確認する。いかなる反例があっても、`decide` は `false` を返すので証明が失敗する —
  すなわちこれらの定理の採用は「列挙領域内に反例が存在しないこと」の機械的証明である。
* 列挙領域は **任意の標本ではなく、各モデルの全ての分岐条件をカバーするように設計した
  境界点集合**（各 if の端点・if の直上/直下・saturating 減算が 0 になる点・非課税閾値）
  である。所与の bound を超えた入力についての主張はしない。
* **このモジュールは法解釈の正しさ・法の欠陥の発見を意味しない。**
  モデルと法文の対応は各スライスの pin（Law id / Revision / sha256）によってのみ担保される。
* 列挙領域のサイズ: GiftTax 25 点・法人税 1,920 組・所得税 20 点・相続税 21 点 + 相続人数 10 通り・
  相次相続控除 25 組 + 12 通り・特殊同族会社 1,152 組・印紙税 156 文書・登録免許税 150 組・
  地方税 24 所得 + 配偶者控除 2 通り・消費税 16 基礎・贈与加算 7 事実 + 16 与信対・
  配偶者控除 128 組。**これらの領域外の反例の不存在は保証しない。**
* SPEC ↔ impl の普遍等式（任意入力についての同一性）は **主張しない**。
  各モデルの Spec との差異は上記の有限領域でのみ検証済み。
* このモジュールは検出候補を法的欠陥として報告しない。候補は独立レビュー前に
  欠陥と呼ばない（docs/METHODOLOGY.md の discipline を維持）。

Reporting artifacts (this file's `example`s print nothing): the *verification* is the
set of `sweep_*` theorems below; CI builds all of them. A failing `sweep_*` theorem is
by definition an in-domain counterexample and must block the build.

Pinned evidence in doc-comments only; all theorems here only claim properties of the
model, never of the real legal semantics（誠実性の原則 — Pin ↔ 原文一致 is the trust
boundary; interpretation is not guaranteed)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Sweep helper: cartesian pairs of two lists. -/
def pairs {α β : Type} (xs : List α) (ys : List β) : List (α × β) :=
  xs.flatMap fun x => ys.map fun y => (x, y)

/-! ## A. 贈与税 art. 21-5 / art. 21-7 -/

def giftSweepIncomes : List Money :=
  [0, 1, 599_999, 600_000, 600_001, 2_000_000, 2_000_001, 3_000_000, 3_000_001,
   4_000_000, 4_000_001, 6_000_000, 6_000_001, 10_000_000, 10_000_001,
   15_000_000, 15_000_001, 25_000_000, 30_000_000, 30_000_001, 40_000_000,
   100_000_000, 500_000_000, 2_000_000_000]

theorem sweep_gift :
    giftSweepIncomes.all (fun x => giftPortionTax x == specGiftPortion x) = true := by
  decide

theorem sweep_gift_total :
    giftSweepIncomes.all
      (fun x => giftTax x ==
        (if x ≤ 600_000 then 0 else specGiftPortion (x - 600_000))) = true := by
  decide

/-! ## B. 法人税法 art. 66(1)–(3) -/

def corpFactsSweep : List CorpFacts :=
  [0, 50_000_000, 100_000_000, 100_000_001, 500_000_000].flatMap fun capital =>
  [true, false].flatMap fun noCapital =>
  [true, false].flatMap fun mutualCo =>
  [true, false].flatMap fun control =>
  [true, false].flatMap fun investment =>
  [true, false].flatMap fun spc =>
  [true, false].map fun trust =>
  ⟨capital, noCapital, mutualCo, control, investment, spc, trust⟩

def corpIncomesSweep : List Money :=
  [0, 8_000_000, 8_000_001, 10_000_000]

set_option maxRecDepth 4096 in
theorem sweep_corporate_ordinary :
    (pairs corpFactsSweep corpIncomesSweep).all
      (fun (f, i) => corporateTax .ordinary f i == specOrdinaryTax f i) = true := by
  decide

theorem sweep_corporate_public :
    corpIncomesSweep.all
      (fun i => corporateTax .publicInterestOrCoop ⟨0, true, false, false, false, false, false⟩ i
        == specPublicInterestTax i) = true := by
  decide

/-! ## C. 所得税法 art. 89 -/

def incomeSweep : List Money :=
  [0, 1, 1_000_000, 1_950_000, 1_950_001, 3_300_000, 3_300_001,
   5_000_000, 6_950_000, 6_950_001, 9_000_000, 9_000_001, 12_000_000,
   18_000_000, 18_000_001, 25_000_000, 40_000_000, 40_000_001, 60_000_000, 100_000_000]

theorem sweep_individual_income :
    incomeSweep.all (fun x => statutoryTax x == closedTax x) = true := by
  decide

theorem sweep_individual_income_woodland :
    incomeSweep.all (fun x => woodlandTax x == closedWoodlandTax x) = true := by
  decide

/-! ## D. 相続税法 art. 15 / art. 16 -/

def portionSweep : List Money :=
  [0, 1, 5_000_000, 10_000_000, 10_000_001, 25_000_000,
   30_000_000, 30_000_001, 50_000_000, 50_000_001, 85_000_000, 100_000_000,
   100_000_001, 150_000_000, 200_000_000, 200_000_001, 300_000_000, 300_000_001,
   600_000_000, 600_000_001, 900_000_000]

theorem sweep_inherited_portion :
    portionSweep.all (fun x => inheritedPortionTax x == specPortion x) = true := by
  decide

def heirsSweep : List Nat := [0, 1, 2, 3, 4, 5, 6, 7, 8, 12]

theorem sweep_basic_deduction_heirs :
    heirsSweep.all (fun n => inheritanceBasicDeduction n == specDeduction n) = true := by
  decide

/-! ## E. 相続税法 art. 18（相続税額の加算） -/

def taxAmountsSweep : List Money :=
  [0, 100_000, 500_000, 1_000_000, 5_000_000, 40_000_000, 100_000_000, 1_000_000_000]

theorem sweep_surcharge20 :
    taxAmountsSweep.all (fun x => surcharge20 x == specSurcharge x) = true := by
  decide

def taxEligibleSweep : List (Money × Bool) :=
  taxAmountsSweep.flatMap fun x => [(x, true), (x, false)]

theorem sweep_tax_with_surcharge :
    taxEligibleSweep.all
      (fun (x, elig) =>
        if elig then taxWithSurcharge elig x == x
        else taxWithSurcharge elig x == specSurchargeTotal x) = true := by
  decide

/-! ## F. 相続税法 art. 20（相次相続控除） -/

def successiveAmountsSweep : List Money :=
  [0, 100_000_000, 200_000_000, 500_000_000, 1_000_000_000]
def successiveYearsSweep : List Nat := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100]

theorem sweep_successive_rate1 :
    (pairs successiveAmountsSweep successiveAmountsSweep).all
      (fun (s, f) => successiveRate1 s f == specSuccessiveRate1 s f) = true := by
  decide

theorem sweep_successive_rate2 :
    (pairs successiveAmountsSweep successiveAmountsSweep).all
      (fun (t, s) => successiveRate2 t s == specSuccessiveRate2 t s) = true := by
  decide

theorem sweep_successive_rate3 :
    successiveYearsSweep.all
      (fun y => successiveRate3 y == specSuccessiveRate3 y) = true := by
  decide

/-! ## G. 相続税法 art. 19（相続開始前7年以内に贈与があつた場合の相続税額） -/

def giftAddBackFactsSweep : List GiftAddBackFacts :=
  [⟨0, 0, 0, 0⟩,
   ⟨5_000_000, 0, 100_000_000, 0⟩,
   ⟨0, 900_000, 0, 0⟩,
   ⟨30_000_000, 20_000_000, 400_000_000, 50_000_000⟩,
   ⟨1_000_000, 1_000_000, 0, 0⟩,
   ⟨1_000_000, 1_000_001, 0, 99_000_000⟩,
   ⟨100_000_000, 0, 0, 0⟩]

theorem sweep_gift_addback :
    giftAddBackFactsSweep.all
      (fun f => giftAddBack f == specGiftAddBack f) = true := by
  decide

theorem sweep_augmented_taxable :
    giftAddBackFactsSweep.all
      (fun f => augmentedTaxableValue f == specAugmentedTaxableValue f) = true := by
  decide

def creditAmountsSweep : List Money := [0, 1_000_000, 15_800_000, 40_000_000]
def creditPaidSweep : List Money := [0, 2_000_000, 16_000_000, 50_000_000]

theorem sweep_tax_due_credit :
    (pairs creditAmountsSweep creditPaidSweep).all
      (fun (c, g) => taxDueAfterGiftCredit c g == specTaxDueAfterGiftCredit c g) = true := by
  decide

/-! ## H. 相続税法 art. 21-6（贈与税の配偶者控除） -/

def spousalFactsSweep : List SpousalGiftFacts :=
  [true, false].flatMap fun qualifies =>
  [true, false].flatMap fun prior =>
  [true, false].flatMap fun provides =>
  [(0, 0), (7_000_000, 5_000_000), (15_000_000, 10_000_000), (25_000_000, 0)].flatMap fun mix =>
  [0, 10_000_000, 30_000_000, 100_000_000].map fun taxable =>
  ⟨qualifies, mix.1, mix.2, prior, provides, taxable⟩

theorem sweep_spousal_deduction :
    spousalFactsSweep.all
      (fun f =>
        spousalDeduction f == specSpousalDeduction f &&
        spousalDeductionBasis f == specSpousalDeductionBasis f &&
        taxableValueAfterSpousalDeduction f == specTaxableValueAfterSpousalDeduction f) = true := by
  decide

/-! ## I. 印紙税法 別表第一 第一〜三号 -/

def stampAmountsSweep : List Money :=
  [0, 1, 9_999, 10_000, 10_001, 99_999, 100_000, 100_001, 500_000, 500_001,
   1_000_000, 1_000_001, 2_000_000, 2_000_001, 3_000_000, 3_000_001, 5_000_000,
   5_000_001, 6_000_000, 10_000_000, 10_000_001, 20_000_000, 20_000_001,
   30_000_000, 30_000_001, 50_000_000, 50_000_001, 100_000_000, 100_000_001,
   200_000_000, 200_000_001, 300_000_000, 300_000_001, 500_000_000, 500_000_001,
   1_000_000_000, 1_000_000_001, 5_000_000_000, 5_000_000_001, 100_000_000_000]

def stampDocsSweep : List StampDocument :=
  (stampAmountsSweep.flatMap fun a =>
    [⟨.contract, some a, false⟩, ⟨.contractOfWork, some a, false⟩,
     ⟨.note, some a, false⟩, ⟨.note, some a, true⟩])
  ++ [⟨.contract, none, false⟩, ⟨.contractOfWork, none, false⟩,
      ⟨.note, none, false⟩, ⟨.note, none, true⟩]

theorem sweep_stamp_table :
    stampDocsSweep.all (fun d => stampDuty d == specStampDuty d) = true := by
  decide

/-! ## J. 登録免許税法 別表第一（一）不動産の登記の定率項目 + art. 15/18/19 -/

def regKindsSweep : List RealEstateRegKind :=
  [.saveOwnership, .transferByInheritance, .transferByPartition, .transferOther,
   .leaseholdSetup, .leaseholdTransferByInheritance, .leaseholdTransferByPartition,
   .leaseholdTransferOther, .spouseResidenceSetup, .mortgageSetup,
   .mortgageTransferByInheritance, .mortgageTransferOther,
   .trustOwnership, .trustMortgage, .trustOtherRights]

def regPricesSweep : List Money :=
  [0, 500, 999, 1_000, 1_001, 30_000, 800_000, 10_000_000, 100_000_000, 1_000_000_000]

theorem sweep_registration_tax :
    (pairs regKindsSweep regPricesSweep).all
      (fun (k, p) =>
        registrationTax k p == specRegistrationTax k p &&
        registrationTaxWithMinimum k p == specRegistrationTaxWithMinimum k p &&
        taxableBase p == specTaxableBase p) = true := by
  decide

theorem sweep_registration_sum :
    (pairs regKindsSweep regPricesSweep).all
      (fun (k, p) => sumRegistrationTaxes [(k, p)] == specSumRegistrationTaxes [(k, p)]) = true := by
  decide

/-! ## K. 地方税法 道府県民税 art. 34(2)/(1)十号/art. 35 -/

def localIncomesSweep : List Money :=
  [0, 1, 100_000, 1_000_000, 5_000_000, 8_000_000, 9_000_000, 9_000_001,
   9_500_000, 9_500_001, 10_000_000, 10_000_001, 15_000_000, 20_000_000,
   23_999_999, 24_000_000, 24_000_001, 24_499_999, 24_500_000, 24_500_001,
   25_000_000, 25_000_001, 50_000_000, 100_000_000]

theorem sweep_local_income :
    localIncomesSweep.all
      (fun i =>
        basicDeduction i == specLocalBasicDeduction i &&
        spouseDeduction i false == specLocalSpouseDeduction i false &&
        spouseDeduction i true == specLocalSpouseDeduction i true &&
        localPrefecturalIncomeTaxAmount i 0 0 false ==
          specLocalIncomeTaxAmount i 0 0 false &&
        localPrefecturalIncomeTaxAmount i 0 0 true ==
          specLocalIncomeTaxAmount i 0 0 true) = true := by
  decide

/-! ## L. 消費税法 art. 29 -/

def consTaxBasesSweep : List Money :=
  [0, 1, 100, 1_000, 100_000, 1_000_000, 10_000_000, 100_000_000]

def consTaxPairsSweep : List (Money × Bool) :=
  consTaxBasesSweep.flatMap fun b => [(b, true), (b, false)]

theorem sweep_consumption_tax :
    consTaxPairsSweep.all (fun (b, r) => consumptionTax b r == specConsumptionTax b r) = true := by
  decide

/-! ## M. 法人税法 art. 67（特定同族会社の特別税率） -/

def surtaxFactsSweep : List CloselyHeldFacts :=
  [0, 6, 11, 12, 18, 24].flatMap fun months =>
  [0, 10_000_000, 100_000_000].flatMap fun incomeAmount =>
  [0, 50_000_000, 250_000_000].flatMap fun retainedBefore =>
  [0, 200_000_000].flatMap fun capital =>
  [0, 500_000_000].flatMap fun rE =>
  [true, false].flatMap fun qualifies =>
  [(0, 0, 0), (20_000_000, 2_000_000, 3_000_000)].map fun creditCT =>
  ⟨qualifies, incomeAmount, 0, 0, retainedBefore,
   creditCT.1, creditCT.2.1, creditCT.2.2, rE, capital, months⟩

set_option maxRecDepth 4096 in
theorem sweep_corporate_surtax :
    surtaxFactsSweep.all (fun f =>
      specialSurtax f == specSpecialSurtax f &&
      totalTaxWithSurtax f == specTotalTaxWithSurtax f &&
      retentionDeduction f == specRetentionDeduction f &&
      retainedAmount f == specRetainedAmount f) = true := by
  decide

end JapanTaxLaw

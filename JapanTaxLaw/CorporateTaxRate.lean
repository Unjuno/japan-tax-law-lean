import JapanTaxLaw.TaxFinance

/-!
# CorporateTaxRate — 法人税法 art. 66 corporate income tax rate computation (L4)

Source (pinned):
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 3B743C0FB772A2482ED143CBE2611E3B82E929868767514A3E1DB16F5C2EF342
  (data/raw/340AC0000000034_20261001_508AC0000000012.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models 法人税法 art. 66 — 各事業年度の所得に対する法人税の税率:

* 第1項 — 普通法人（一般社団法人等を含む）の課税: 百分の二十三・二 (23.2%)
  on all income.
* 第2項 — 中小法人 (ordinary corporations that are not 通算法人 and meet
  the size condition: capital ≤ 1億円, or no capital) — the 所得のうち
  年八百万円以下の金額 is taxed at 百分の十九 (19%).
  - 年八百万円 can be prorated for fiscal years shorter than one year
    (art. 66(4)) — **not modelled here**.
  - 通算法人 / 通算親法人 conditions — **not modelled here**.
* 第3項 — 公益法人等（一般社団法人等を除く）・ 協同組合等: all income at
  百分の十九 (19%).
* 第5項 — 中小法人軽減税率を受けない法人: 普通法人のうち保有悪の大法人
  との間に完全支配関係がある法人, 投資法人, 特定目的会社, 受託法人,
  相互会社 are **excluded** from the SME reduced rate and pay 23.2%.
  (Complete-control relations — "大法人との間に完全支配関係がある" — are
  modelled as an externally established boolean, not derived here; the
  full complete-control test requires multi-entity facts beyond scope.)
* The 特定同族会社の特別税率 (art. 67), 中小通算法人の按分, 退職年金,
  生命保険会社 special table, and 通算制度 consolidation mechanics are
  all **out of scope**.

SME entitlement is modelled as follows (article 66(2) text):
  ordinary corporation (not 通算法人) or 一般社団法人等, whose capital at
  end of business year is ≤ 1億円, **or** corporations without capital,
  **or** 人格のない社団等, and not excluded by art. 66(5).
Public-interest / cooperative corporations (art. 66(3)) pay the 19% rate on
their entire income, regardless of scale.

Pinned evidence in doc-comments only; all theorems here only claim
properties of the model, never of the real legal semantics (誠実性の原則 —
Pin ↔ 原文一致 is the trust boundary; interpretation is not guaranteed).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Corporation category for the rate table. -/
inductive CorpCategory where
  /-- 普通法人（making-development business corporation, SPC etc. excluded via SME filter). -/
  | ordinary
  /-- 公益法人等（一般社団法人等を除く）又は協同組合等. -/
  | publicInterestOrCoop
  deriving DecidableEq, Repr

/-- Legally relevant facts for the art. 66 SME entitlement check. The
    complete-control relation is supplied as an *externally established*
    boolean; we do not derive it. -/
structure CorpFacts where
  /-- 事業年度終了時点の資本金・出資金の額 (0 if none). -/
  capital : Money
  /-- 資本金・出資を有しないか (true ⇔ no capital). -/
  noCapital : Bool
  /-- 保険業法の相互会社 (art. 66(5) 一号). -/
  isMutualCompany : Bool
  /-- 大法人との間に完全支配関係がある普通法人 (art. 66(5) 二号–三号) —
      externally established. -/
  hasCompleteControlByLargeCorp : Bool
  /-- 投資法人 (art. 66(5) 四号). -/
  isInvestmentCorp : Bool
  /-- 特定目的会社 (art. 66(5) 五号). -/
  isSpecificPurposeCorp : Bool
  /-- 受託法人 (art. 66(5) 六号). -/
  isTrustCorp : Bool
  deriving DecidableEq, Repr

/-- SME eligibility: an ordinary corporation (not 通算法人) or 一般社団法人等
    with capital ≤ 1億円 or no capital, and not excluded by art. 66(5).
    This is the *size* limb; public-interest / cooperative corporations are
    always at 19% and do not use this limb. -/
def smeEligible (f : CorpFacts) : Bool :=
  (f.capital ≤ 100_000_000 || f.noCapital)
    && !f.isMutualCompany
    && !f.hasCompleteControlByLargeCorp
    && !f.isInvestmentCorp
    && !f.isSpecificPurposeCorp
    && !f.isTrustCorp

/-- 23.2% — 百分の二十三・二 (art. 66(1)). -/
def ordinaryRate : TaxRate := ⟨232, 1000, by decide⟩

/-- 19% — 百分の十九 (art. 66(2) 軽減税率 / art. 66(3)). -/
def smeRate : TaxRate := ⟨19, 100, by decide⟩

/-- 年八百万円 cap — 2017 改正以前のままではない年八百万円 (art. 66(2) に明示). -/
def smeIncomeCap : Money := 8_000_000

/-- Portion of taxable income subject to the 19% reduced rate for an
    SME-eligible ordinary corporation. -/
def smeReducedPortion (f : CorpFacts) (income : Money) : Money :=
  if smeEligible f then min income smeIncomeCap else 0

/-- Portion subject to the full 23.2% ordinary rate. -/
def ordinaryPortion (f : CorpFacts) (income : Money) : Money :=
  income - smeReducedPortion f income

/-- The art. 66 (1)–(3) tax amount for an ordinary or public-interest
    corporation. `category = .publicInterestOrCoop` pays the flat 19% on the
    whole income; `.ordinary` pays 19% up to ¥8,000,000 (if SME eligible) and
    23.2% on the excess (art. 66(2)-(3)). -/
def corporateTax (category : CorpCategory) (f : CorpFacts) (income : Money) : Money :=
  match category with
  | .publicInterestOrCoop => smeRate.applyFloor income
  | .ordinary =>
      smeRate.applyFloor (smeReducedPortion f income) +
        ordinaryRate.applyFloor (ordinaryPortion f income)

/-- Art. 66(3): public-interest corporations pay 19% on **all** income. -/
def corporateTaxPublic (income : Money) : Money := smeRate.applyFloor income

-- ==== verified facts about the model (no performance of the law, only model consistency) ====

/-- The SME reduced portion never exceeds the cap. -/
theorem sme_cap_le (f : CorpFacts) (income : Money) :
    smeReducedPortion f income ≤ smeIncomeCap := by
  unfold smeReducedPortion
  cases smeEligible f
  · simp
  · exact Nat.min_le_right _ _

/-- For an excluded corporation the reduced portion is zero — full 23.2%. -/
theorem excluded_means_ordinary (f : CorpFacts) (income : Money)
    (h : smeEligible f = false) :
    smeReducedPortion f income = 0 := by
  unfold smeReducedPortion
  simp [h]

/-- The two portions always sum to the total income. -/
theorem portions_sum (f : CorpFacts) (income : Money) :
    smeReducedPortion f income + ordinaryPortion f income = income := by
  unfold ordinaryPortion smeReducedPortion
  cases smeEligible f
  · simp
  · simp only [ite_true]
    exact Nat.add_sub_cancel' (Nat.min_le_left income smeIncomeCap)

/-- SME eligibility is preserved when nothing in the exclusion list applies
    and capital does not grow beyond the threshold while the facts stay the
    same (restated as the equivalent boolean condition). -/
theorem sme_eligible_iff (f : CorpFacts) :
    smeEligible f = ((f.capital ≤ 100_000_000 || f.noCapital) &&
      !f.isMutualCompany && !f.hasCompleteControlByLargeCorp &&
      !f.isInvestmentCorp && !f.isSpecificPurposeCorp && !f.isTrustCorp) := rfl

/-- Boundary: ¥8,000,000 exactly fills the reduced band — everything above
    goes to the 23.2% band. -/
example : corporateTax .ordinary ⟨100_000_000, false, false, false, false, false, false⟩
    8_000_000 = 1_520_000 := by decide

/-- Boundary: income just above the cap gets the 23.2% band applied to the
    excess. -/
example : corporateTax .ordinary ⟨50_000_000, false, false, false, false, false, false⟩
    10_000_000 = 1_984_000 := by decide

/-- Ordinary (large) corporation pays flat 23.2%. -/
example : corporateTax .ordinary ⟨500_000_000, false, false, false, false, false, false⟩
    8_000_000 = 1_856_000 := by decide

/-- Public-interest / cooperative corporation: flat 19%. -/
example : corporateTax .publicInterestOrCoop ⟨500_000_000, false, false, false, false, false, false⟩
    3_000_000 = 570_000 := by decide

/-- Capital-exceeding corporation that is excluded by the large-corp
    complete-control test pays the full rate. -/
example : corporateTax .ordinary ⟨1, false, false, true, false, false, false⟩
    1_000_000 = 232_000 := by decide

end JapanTaxLaw

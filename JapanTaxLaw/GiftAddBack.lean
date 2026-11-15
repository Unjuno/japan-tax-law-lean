import JapanTaxLaw.InheritanceTax

/-!
# GiftAddBack — 相続税法 art. 19（相続開始前七年以内に贈与があつた場合の相続税額） L4 スライス

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

art. 19(1) の中核計算:

  相続又は遺贈により財産を取得した者が当該相続の開始前七年以内に当該相続に係る
  被相続人から贈与により財産を取得したことがある場合においては、その者については、
  当該贈与により取得した財産（…加算対象贈与財産…）の価額
  （加算対象贈与財産のうち当該相続の開始前三年以内に取得した財産以外の財産にあつては、
   当該財産の価額の合計額から百万円を控除した残額）を相続税の課税価格に加算した価額を
  相続税の課税価格とみなし、第15条から前条までの規定を適用して算出した金額
  （加算対象贈与財産の取得につき課せられた贈与税があるときは、当該金額から
   当該財産に係る贈与税の税額（第二十一条の八の規定による控除前の税額とし、延滞税、
   利子税、過少申告加算税、無申告加算税及び重加算税に相当する税額を除く。）として
   政令の定めるところにより計算した金額を控除した金額）をもつて、
  その納付すべき相続税額とする。

* `giftAddBack` — 加算価額 = （開始前3年以内の価額） + （開始前3年超7年以内の価額合計 − 100万円）。
  3〜7年分が100万円以下の場合の殊余は 0（飽和減算。文言「百万円を控除した残額」の
  当然の読みだが、明示する modeling candidate）。
* `augmentedTaxableValue` — 加算後の相続税の課税価格とみなす価額。
* `taxDueAfterGiftCredit` — 第15条〜前条適用後の金額から贈与税の税額（art. 21-8 控除前・
  附帯税を除く、政令計算）を控除した納付すべき相続税額（飽和減算）。

**第2項（特定贈与財産）** — 配偶者（婚姻期間二十年以上）への居住用不動産・金銭の贈与のうち
art. 21-6 適用相当分は加算対象から除かれる。これは金額の選別が呼出元の事実認定を要するため、
本モデルでは **caller-supplied amounts**（両バケットとも特定贈与財産を除外済みであることを
前提）として扱う。除外の検証自体は本モデルの射程外（art. 21-6 の金額計算は別モジュールの
スコープ）。

**第15条〜前条の算出経路** — 第15条〜第18条の税額機構は `InheritanceTax.lean`（art. 15-17）・
`InheritanceSurcharge.lean`（art. 18）にある。本モジュールは加算と控除の結合のみをモデル化し、
算出した金額そのものはパラメータとして受け取る（全埋め込みの完全結合は L4 全体の
統合課題であり、本スライスではしない）。試験用の一経路として、単一相続人の場合の
`singleHeirTaxComputedOnAugmentedBase` を `InheritanceTax.lean` の pinned 実装で合成する。

**スコープ外**:
* 加算対象贈与財産の選別（課税価格計算の基礎算入の判定、art. 21-2〜21-4 の適用、
  特定贈与財産の判定の事実認定）は呼出元責任。
* 贈与税の税額の政令計算（同一年分の贈与が複数ある場合の按分等）は呼出元入力 `giftTaxPaid`。
* art. 21-8 の控除前の税額、延滞税等の除外金額の計算はモデル化しない。
* 第51条第2項（連帯納付義務等）に係る手続は対象外。

Pinned evidence in doc-comments only; all theorems here only claim properties of the
model, never of the real legal semantics（誠実性の原則 — Pin ↔ 原文一致 is the trust
boundary; interpretation is not guaranteed)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 19(1) の計算に必要な事実一式。金額は呼出元が供給する。 -/
structure GiftAddBackFacts where
  /-- 相続の開始前3年以内に取得した加算対象贈与財産の価額（特定贈与財産を除く）。 -/
  giftsWithin3Years : Money
  /-- 相続の開始前3年を超え7年以内に取得した加算対象贈与財産の価額の合計額
      （特定贈与財産を除く）。この合計額から百万円を控除した残額が加算される。 -/
  giftsOver3Within7Years : Money
  /-- art. 19(1) の課税価格に相当する、加算前の相続税の課税価格。 -/
  baseTaxableValue : Money
  /-- 加算対象贈与財産の取得につき課せられた贈与税の税額
      （art. 19(1) 括弧書き: art. 21-8 控除前の税額、延滞税・利子税・過少申告加算税・
      無申告加算税・重加算税を除く、政令で定めるところにより計算した金額）。 -/
  giftTaxPaid : Money
  deriving DecidableEq, Repr

/-- art. 19(1): 課税価格に加算する価額。
    3年以内の贈与分はそのまま、3年超7年以内の贈与分は合計額から100万円を控除した残額
    （100万円以下なら 0 — 飽和減算による modeling candidate）。 -/
def giftAddBack (f : GiftAddBackFacts) : Money :=
  f.giftsWithin3Years + (f.giftsOver3Within7Years - 1_000_000)

/-- art. 19(1): 加算後の価額を相続税の課税価格とみなす。 -/
def augmentedTaxableValue (f : GiftAddBackFacts) : Money :=
  f.baseTaxableValue + giftAddBack f

/-- art. 19(1) 括弧書き: 第15条から前条までの規定を適用して算出した金額から、
    当該財産に係る贈与税の税額を控除した、納付すべき相続税額（飽和減算）。 -/
def taxDueAfterGiftCredit (taxComputedOnAugmentedBase giftTaxPaid : Money) : Money :=
  taxComputedOnAugmentedBase - giftTaxPaid

/-- 単一相続人（法定相続分100%）の場合の、art. 15-17 経路による算出例。
    加算後課税価格 − art. 15(1) 基礎控除（1人につき3,600万円）を `inheritedPortionTax`
    （art. 16）に通した金額。配偶者・子がある場合は art. 15-17 の全機構が要るため
    本モデルでは提供しない（算出した金額はパラメータ `taxComputedOnAugmentedBase` として
    受け取るのが正式な使い方）。 -/
def singleHeirTaxComputedOnAugmentedBase (f : GiftAddBackFacts) : Money :=
  inheritedPortionTax (augmentedTaxableValue f - inheritanceBasicDeduction 1)

/-- art. 19(1) の納付すべき相続税額の単一相続人経路（raise なしの端点検証用）。 -/
def singleHeirTaxDueAfterGiftCredit (f : GiftAddBackFacts) : Money :=
  taxDueAfterGiftCredit (singleHeirTaxComputedOnAugmentedBase f) f.giftTaxPaid

-- ==== verified facts about the model (no performance of the law, only model consistency) ====

/-- 加算価額は、3年以内分と3〜7年分の合計を超えない。 -/
theorem giftAddBack_le (f : GiftAddBackFacts) :
    giftAddBack f ≤ f.giftsWithin3Years + f.giftsOver3Within7Years :=
  Nat.add_le_add_left (Nat.sub_le _ _) _

/-- 3〜7年分が100万円以下なら、その部分は加算されない。 -/
theorem over3_small_adds_nothing (f : GiftAddBackFacts)
    (h : f.giftsOver3Within7Years ≤ 1_000_000) : giftAddBack f = f.giftsWithin3Years := by
  unfold giftAddBack
  rw [Nat.sub_eq_zero_of_le h]
  exact Nat.add_zero _

/-- 3〜7年分がちょうど100万円なら、その部分は 0（文言どおり「控除した残額」は 0）。 -/
theorem over3_exactly_million (f : GiftAddBackFacts)
    (h : f.giftsOver3Within7Years = 1_000_000) : giftAddBack f = f.giftsWithin3Years := by
  unfold giftAddBack
  rw [h]
  simp only [Nat.sub_self, Nat.add_zero]

/-- 3〜7年分がなければ、加算価額は3年以内分に等しい。 -/
theorem no_over3_adds_nothing (f : GiftAddBackFacts)
    (h : f.giftsOver3Within7Years = 0) : giftAddBack f = f.giftsWithin3Years := by
  unfold giftAddBack
  rw [h]
  simp only [Nat.zero_sub, Nat.add_zero]

/-- 加算後の課税価格は加算前以上。 -/
theorem augmented_ge_base (f : GiftAddBackFacts) : f.baseTaxableValue ≤ augmentedTaxableValue f := by
  unfold augmentedTaxableValue
  exact Nat.le_add_right _ _

/-- 加算対象がなければ、加算後の課税価格は加算前に等しい。 -/
theorem augmented_eq_base_when_no_gifts (f : GiftAddBackFacts)
    (h3 : f.giftsWithin3Years = 0) (h7 : f.giftsOver3Within7Years = 0) :
    augmentedTaxableValue f = f.baseTaxableValue := by
  unfold augmentedTaxableValue giftAddBack
  rw [h3, h7]
  simp

/-- 贈与税の税額を控除した後の額は、控除前を超えない。 -/
theorem taxDue_le_computed (c g : Money) : taxDueAfterGiftCredit c g ≤ c :=
  Nat.sub_le _ _

/-- 贈与税の税額が 0 なら控除後の額は控除前に等しい。 -/
theorem taxDue_eq_computed_when_no_gift_tax (c : Money) : taxDueAfterGiftCredit c 0 = c :=
  Nat.sub_zero _

/-- 贈与税の税額が算出額以上なら、控除後の納付額は 0（飽和減算）。 -/
theorem taxDue_eq_zero_when_credit_covers (c g : Money) (h : c ≤ g) :
    taxDueAfterGiftCredit c g = 0 := by
  unfold taxDueAfterGiftCredit
  exact Nat.sub_eq_zero_of_le h

/-- 加算価額は両バケットに単調。 -/
theorem giftAddBack_mono {f g : GiftAddBackFacts}
    (h3 : f.giftsWithin3Years ≤ g.giftsWithin3Years)
    (h7 : f.giftsOver3Within7Years ≤ g.giftsOver3Within7Years) :
    giftAddBack f ≤ giftAddBack g := by
  unfold giftAddBack
  exact Nat.add_le_add h3 (Nat.sub_le_sub_right h7 _)

end JapanTaxLaw

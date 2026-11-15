import JapanTaxLaw.GiftTax

/-!
# SpousalGiftDeduction — 相続税法 art. 21-6（贈与税の配偶者控除） L4 スライス

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

art. 21-6(1) の中核計算:

  その年において贈与によりその者との婚姻期間が二十年以上である配偶者から
  専ら居住の用に供する土地若しくは土地の上に存する権利若しくは家屋でこの法律の
  施行地にあるもの（以下この条において「居住用不動産」という。）又は金銭を取得した者
  （その年の前年以前のいずれかの年において贈与により当該配偶者から取得した財産に
  係る贈与税につきこの条の規定の適用を受けた者を除く。）が、当該取得の日の属する年の
  翌年三月十五日までに当該居住用不動産をその者の居住の用に供し、かつ、
  その後引き続き居住の用に供する見込みである場合又は同日までに当該金銭をもつて
  居住用不動産を取得して、これをその者の居住の用に供し、かつ、
  その後引き続き居住の用に供する見込みである場合においては、
  その年分の贈与税については、課税価格から二千万円
  （当該贈与により取得した居住用不動産の価額に相当する金額と当該贈与により取得した
   金銭のうち居住用不動産の取得に充てられた部分の金額との合計額が
   二千万円に満たない場合には、当該合計額）を控除する。

* `spousalDeductionBasis` — 合計額 = 居住用不動産の価額 + 居住用不動産取得に充てられた金銭部分
* `spousalDeduction` — 控除額 = min 20,000,000 basis（要件を満たす場合のみ）

スコープ外（過剰主張しない明示）:

* 適用要件の事実認定は呼出元: 婚姻期間20年以上（art. 21-6(4) の政令判定含む）・
  「専ら居住の用に供する」・施行地所在・翌年3月15日までの居住供用または取得見込み・
  前年以前の適用歴（一生一度）・施行地所在要件。本モデルはこれらを
  `isSpousalGift20Year` / `providesResidenceByNextMarch` / `priorApplication` の
  externally established boolean として受け取る。
* 第2項・第3項（申告書・更正請求書への添付書類・やむを得ない事情・財務省令）の手続要件は
  モデル化しない。
* 第4項（政令への委任）・婚姻期間の計算方法は対象外。
* 居住用不動産の「価額」の評価は art. 22 以下の評価規定であり、本モデルは評価済み金額を
  受け取る。
* 控除の順序: 本モデルは `giftTaxableValue - spousalDeduction` を先に適用し、その後に
  art. 21-5 の六十万円（`GiftTax.giftBasicDeduction`）と art. 21-7 を `giftTax` で
  適用する合成例を提供する。両控除の順序は saturating Nat 減算では結果を変えない
  （(x − a) − b = x − (a + b)）。
* なお、pinned revision（2026-04-01）の art. 21-5 は「六十万円」と明記している
  （`GiftTax.lean` も同じ pin に基づく）。本モデルは pin に忠実に従う。

Pinned evidence in doc-comments only; all theorems here only claim properties of the
model, never of the real legal semantics（誠実性の原則 — Pin ↔ 原文一致 is the trust
boundary; interpretation is not guaranteed)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 21-6(1) の計算に必要な事実一式。各フィールドは呼出元が供給する。 -/
structure SpousalGiftFacts where
  /-- 婚姻期間が二十年以上である配偶者からの贈与か（art. 21-6(1) 冒頭・(4)）—
      externally established. -/
  isSpousalGift20Year : Bool
  /-- 専ら居住の用に供する、この法律の施行地にある土地若しくは土地の上に存する
      権利若しくは家屋の価額。 -/
  residentialPropertyValue : Money
  /-- 贈与金銭のうち居住用不動産の取得に充てられた部分の金額。 -/
  cashAppliedToResidential : Money
  /-- その年の前年以前のいずれかの年分の贈与税につき本条の適用を受けたか
      （true ⇔ 適用済み — その場合、本条は適用できない）。 -/
  priorApplication : Bool
  /-- 当該取得の日の属する年の翌年三月十五日までに居住用不動産を居住の用に供し、
      かつ、その後引き続き居住の用に供する見込みか（又は同日までに当該金銭をもつて
      居住用不動産を取得して居住の用に供し、引き続き居住の用に供する見込みか）—
      art. 21-6(1) 後段。 -/
  providesResidenceByNextMarch : Bool
  /-- その年分の贈与税の課税価格（art. 21-6(1) 控除前）。 -/
  giftTaxableValue : Money
  deriving DecidableEq, Repr

/-- 控除の基礎合計額: 居住用不動産の価額 + 居住用不動産取得に充てられた金銭部分。 -/
def spousalDeductionBasis (f : SpousalGiftFacts) : Money :=
  f.residentialPropertyValue + f.cashAppliedToResidential

/-- 本条の適用可否（externally established な三要件の合取）。 -/
def spousalDeductionQualifies (f : SpousalGiftFacts) : Bool :=
  f.isSpousalGift20Year && !f.priorApplication && f.providesResidenceByNextMarch

/-- art. 21-6(1) 本文: 課税価格から控除する額。
    適格なら min 二千万円 basis、そうでなければ 0。 -/
def spousalDeduction (f : SpousalGiftFacts) : Money :=
  if spousalDeductionQualifies f then min 20_000_000 (spousalDeductionBasis f) else 0

/-- art. 21-6(1): 課税価格から配偶者控除を控除した価額（飽和減算）。 -/
def taxableValueAfterSpousalDeduction (f : SpousalGiftFacts) : Money :=
  f.giftTaxableValue - spousalDeduction f

/-- 合成例: art. 21-6 の控除後に art. 21-5（六十万円）・art. 21-7（税率表）を適用した
    贈与税額。`giftTax` は `GiftTax.lean` の pinned 実装。
    控除の順序は saturating Nat 減算では結果を変えない。 -/
def giftTaxAfterSpousalDeduction (f : SpousalGiftFacts) : Money :=
  giftTax (taxableValueAfterSpousalDeduction f)

-- ==== verified facts about the model (no performance of the law, only model consistency) ====

/-- 控除額は二千万円を超えない。 -/
theorem spousalDeduction_le_cap (f : SpousalGiftFacts) :
    spousalDeduction f ≤ 20_000_000 := by
  unfold spousalDeduction spousalDeductionQualifies
  by_cases h : f.isSpousalGift20Year && !f.priorApplication && f.providesResidenceByNextMarch
  · simp [h]
    exact Nat.min_le_left _ _
  · simp [h]

/-- 婚姻期間20年以上の配偶者からの贈与でなければ、控除額は 0。 -/
theorem spousalDeduction_eq_zero_of_not_spouse (f : SpousalGiftFacts)
    (h : f.isSpousalGift20Year = false) : spousalDeduction f = 0 := by
  unfold spousalDeduction spousalDeductionQualifies
  simp [h]

/-- 前年以前に本条の適用を受けていれば、控除額は 0（一生一度）。 -/
theorem spousalDeduction_eq_zero_of_prior_application (f : SpousalGiftFacts)
    (h : f.priorApplication = true) : spousalDeduction f = 0 := by
  unfold spousalDeduction spousalDeductionQualifies
  simp [h]

/-- 翌年3月15日までの居住供用見込みがなければ、控除額は 0。 -/
theorem spousalDeduction_eq_zero_of_no_residence (f : SpousalGiftFacts)
    (h : f.providesResidenceByNextMarch = false) : spousalDeduction f = 0 := by
  unfold spousalDeduction spousalDeductionQualifies
  simp [h]

/-- 基礎合計額が 0 なら、控除額は 0。 -/
theorem spousalDeduction_eq_zero_of_zero_basis (f : SpousalGiftFacts)
    (h : spousalDeductionBasis f = 0) : spousalDeduction f = 0 := by
  unfold spousalDeduction
  by_cases hq : spousalDeductionQualifies f
  · simp [hq, h]
  · simp [hq]

/-- 適格なら、控除額は基礎合計額を超えない。 -/
theorem spousalDeduction_le_basis (f : SpousalGiftFacts) (h : spousalDeductionQualifies f) :
    spousalDeduction f ≤ spousalDeductionBasis f := by
  unfold spousalDeduction
  simp [h]
  exact Nat.min_le_right _ _

/-- 適格かつ基礎合計額が二千万円以上なら、控除額はちょうど二千万円。 -/
theorem spousalDeduction_eq_cap_of_huge_basis (f : SpousalGiftFacts)
    (h : spousalDeductionQualifies f) (hb : 20_000_000 ≤ spousalDeductionBasis f) :
    spousalDeduction f = 20_000_000 := by
  unfold spousalDeduction
  simp [h, Nat.min_eq_left hb]

/-- 控除後の課税価格は控除前を超えない。 -/
theorem afterSpousalDeduction_le (f : SpousalGiftFacts) :
    taxableValueAfterSpousalDeduction f ≤ f.giftTaxableValue :=
  Nat.sub_le _ _

/-- 課税価格が控除額以下なら、控除後の課税価格は 0（飽和減算）。 -/
theorem afterSpousalDeduction_eq_zero_of_small (f : SpousalGiftFacts)
    (h : f.giftTaxableValue ≤ spousalDeduction f) :
    taxableValueAfterSpousalDeduction f = 0 := by
  unfold taxableValueAfterSpousalDeduction
  exact Nat.sub_eq_zero_of_le h

end JapanTaxLaw

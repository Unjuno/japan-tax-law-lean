import JapanTaxLaw.TaxFinance

/-!
# CorporateLossCarryforward — 法人税法 art. 57（欠損金の繰越し）L4 computation slice

Sources (pinned):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 3B743C0FB772A2482ED143CBE2611E3B82E929868767514A3E1DB16F5C2EF342
  (data/raw/340AC0000000034_20261001_508AC0000000012.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as CorporateTaxRate.lean / CorporateSurtax.lean)

Models art. 57 (1) main rule with the 50% cap and art. 57 (11) SME re-reading
(pinned bytes verbatim):

  第一項 main clause:
  「内国法人の各事業年度開始の日前十年以内に開始した事業年度において生じた欠損金額…がある場合には、
    当該欠損金額に相当する金額は、当該各事業年度の所得の金額の計算上、損金の額に算入する。」
  ただし書:
  「当該欠損金額に相当する金額が損金算入限度額（…当該各事業年度の所得の金額の百分の五十に相当する金額をいう。）
    から当該欠損金額の生じた事業年度前の事業年度において生じた欠損金額に相当する金額で
    本文の規定により当該各事業年度の所得の金額の計算上損金の額に算入される金額を控除した金額を
    超える場合は、その超える部分の金額については、この限りでない。」

  第十一項:
  「次の各号に掲げる内国法人の当該各号に定める各事業年度の所得に係る第一項ただし書の規定の適用については、
   同項ただし書中「所得の金額の百分の五十に相当する金額」とあるのは、「所得の金額」とする。」
  （イ：普通法人で資本金の額若しくは出資金の額が一億円以下であるもの、又は資本若しくは出資を有しないもの、
   又は公益法人等・協同組合等・人格のない社団等；乙：再生事実；丙：設立から7年）

Computation:

```lean
cap = incomeBeforeDeduction * 50 / 100
  -- if isSME || isReorganizationYear || isFoundingYear then incomeBeforeDeduction else above
effectiveCap = Nat.sub cap alreadyFromPriorYears
deduction = min lossAvailable effectiveCap
```

Out of scope:

* art. 57(1) 本則の下での連続青色申告要件・帳簿保存要件 — caller-established booleans
* art. 57(2)-(10): 適格合併の被合併法人等の欠損金の引継ぎ（支配関係年数・共同で事業の基準・特定資産譲渡損失等の除外）— モデル化しない
* art. 57(12)-(14): 準委任・適用関係政令委任 — モデル化しない
* art. 59: 会社更生等による債務免除等があった場合の欠損金の損金算入 — 別スライスの射程
* 大通算法人・大法人等の定義（同条第五項第二号及び第三号・第六項）は同 pin 内での canonication を呼出元へ転嫁

Eligibility booleans (caller-established):

* `isSmeOrCarveOut` — 第十一項第一号に該当するか（資本金≤1億円の普通法人・資本/出資を有しないもの・公益法人等・協同組合等・人格のない社団等）
* `isReorganizationYear` — 第十一項第二号（再生事由当該年）
* `isFoundingYear` — 第十一項第三号（設立日から7年以内）

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 57(1)/(11) の適用要件を externally established で表す。 -/
structure LossCarryforwardFacts where
  /-- 第十一項第一号: 普通法人のうち資本金の額若しくは出資金の額が一億円以下であるもの、
      又は資本若しくは出資を有しないもの、又は公益法人等・協同組合等・人格のない社団等。 -/
  isSmeOrCarveOut : Bool
  /-- 第十一項第二号: 再生事由（株式上場・再生計画認可等）の事業年度。 -/
  isReorganizationYear : Bool
  /-- 第十一項第三号: 設立日から同日以後七年を経過する日までの期間内の事業年度。 -/
  isFoundingYear : Bool
  /-- 本文の規定を適用せず、かつ、第五十九条第三項及び第四項・第六十二条の五第五項を適用しないものとして計算した場合における
      当該各事業年度の所得の金額。 -/
  incomeBeforeDeduction : Money
  /-- 当該各事業年度開始の日前十年以内に開始した事業年度において生じた欠損金額（損金算入可能分）。 -/
  lossAvailable : Money
  /-- 当該欠損金額の生じた事業年度前の事業年度において生じた欠損金額に相当する金額で
      本文の規定により当該各事業年度の所得の金額の計算上損金の額に算入される金額。 -/
  alreadyFromPriorYears : Money
  deriving DecidableEq, Repr

/-- art. 57(11): 百分の五十に相当する金額」が「所得の金額」に読み替えられるかどうか。 -/
def carveOutApplies (f : LossCarryforwardFacts) : Bool :=
  f.isSmeOrCarveOut || f.isReorganizationYear || f.isFoundingYear

/-- art. 57(1) ただし書の損金算入限度額の基礎となる金額（50% or 100% after the (11) re-reading)。 -/
def lossDeductionCapBase (f : LossCarryforwardFacts) : Money :=
  if carveOutApplies f then f.incomeBeforeDeduction else f.incomeBeforeDeduction * 50 / 100

/-- art. 57(1) ただし書の実際の上限（基礎金額から既に使用済み欠損金を除いた額、0 を下限）。 -/
def effectiveLossCap (f : LossCarryforwardFacts) : Money :=
  lossDeductionCapBase f - f.alreadyFromPriorYears

/-- art. 57(1) 柱書の損金算入額: 欠損金額と上限の小さい方。 -/
def lossCarryforwardDeduction (f : LossCarryforwardFacts) : Money :=
  min f.lossAvailable (effectiveLossCap f)

-- ==== verified facts ====

theorem lossCarryforwardDeduction_le_available (f : LossCarryforwardFacts) :
    lossCarryforwardDeduction f ≤ f.lossAvailable := Nat.min_le_left _ _

theorem lossCarryforwardDeduction_le_capBase (f : LossCarryforwardFacts) :
    lossCarryforwardDeduction f ≤ lossDeductionCapBase f := by
  unfold lossCarryforwardDeduction effectiveLossCap
  exact Nat.le_trans (Nat.min_le_right _ _) (Nat.sub_le _ _)

/-- art. 57(11) が適用される場合、上限は「所得の金額」そのもの。 -/
theorem lossDeductionCapBase_of_carveOut (f : LossCarryforwardFacts)
    (h : carveOutApplies f = true) : lossDeductionCapBase f = f.incomeBeforeDeduction := by
  unfold lossDeductionCapBase
  simp [h]

/-- SME かつ既使用ゼロなら、上限額は所得の金額そのもの。 -/
theorem lossCarryforwardDeduction_sme_no_prior (f : LossCarryforwardFacts)
    (h : carveOutApplies f = true) (hpa : f.alreadyFromPriorYears = 0) :
    lossCarryforwardDeduction f = min f.lossAvailable f.incomeBeforeDeduction := by
  unfold lossCarryforwardDeduction effectiveLossCap lossDeductionCapBase
  rw [h, hpa]
  simp

/-- 50% を超える部分は損金に算入できない（モデル・consistent-input case）。 -/
theorem lossCarryforwardDeduction_fiftyPct_bound (f : LossCarryforwardFacts)
    (h : carveOutApplies f = false) :
    lossCarryforwardDeduction f ≤ f.incomeBeforeDeduction * 50 / 100 := by
  unfold lossCarryforwardDeduction effectiveLossCap lossDeductionCapBase
  simp [h]
  exact Nat.le_trans (Nat.min_le_right _ _) (Nat.sub_le _ _)

-- ==== kernel-decided smoke checks ====

-- 50% 上限が効くケース: 所得 1,000万、欠損 600万、non-SME → 500万のみ控除可
example : lossCarryforwardDeduction ⟨false, false, false, 10_000_000, 6_000_000, 0⟩ = 5_000_000 := by decide
-- SME の場合は全額控除可
example : lossCarryforwardDeduction ⟨true, false, false, 10_000_000, 6_000_000, 0⟩ = 6_000_000 := by decide
-- 再生年度でも同じ
example : lossCarryforwardDeduction ⟨false, true, false, 10_000_000, 6_000_000, 0⟩ = 6_000_000 := by decide
-- 設立から7年以内でも同じ
example : lossCarryforwardDeduction ⟨false, false, true, 10_000_000, 6_000_000, 0⟩ = 6_000_000 := by decide
-- 既に過年度で 300万控除済み、上限 500万
example : lossCarryforwardDeduction ⟨false, false, false, 10_000_000, 6_000_000, 3_000_000⟩ = 2_000_000 := by decide
-- 過年度控除済みが上限を超えていても 0 を下回らない
example : lossCarryforwardDeduction ⟨false, false, false, 10_000_000, 6_000_000, 8_000_000⟩ = 0 := by decide
-- 欠損の方が小さい場合
example : lossCarryforwardDeduction ⟨false, false, false, 10_000_000, 3_000_000, 0⟩ = 3_000_000 := by decide
-- 所得ゼロ
example : lossCarryforwardDeduction ⟨false, false, false, 0, 1_000_000, 0⟩ = 0 := by decide
-- SME、既使用ゼロ、欠損 > 所得
example : lossCarryforwardDeduction ⟨true, false, false, 2_000_000, 9_000_000, 0⟩ = 2_000_000 := by decide

end JapanTaxLaw

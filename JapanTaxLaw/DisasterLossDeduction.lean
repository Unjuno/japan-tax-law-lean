import JapanTaxLaw.TaxFinance

/-!
# DisasterLossDeduction — 地方税法 art. 34(1)第一号（雑損控除）L4 モデル

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53
  (data/raw/325AC0000000226_20261101_508AC0000000002.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as LocalIncomeTax.lean)

Models art. 34(1)第一号（雑損控除）— pinned bytes 逐語:

  「前年中に災害又は盗難若しくは横領…により自己又は自己と生計を一にする配偶者その他の親族で政令
    で定めるものの有する資産（…）について損失を受けた場合…当該損失の金額（当該支出をした金額を含み、
    保険金、損害賠償金その他これらに類するものにより埋められた部分の金額を除く。以下この号において
    「損失の金額」という。）の合計額が、次に掲げる場合の区分に応じ、それぞれ次に定める金額を超える所得割の
    納税義務者次に掲げる場合の区分に応じ、それぞれ次に定める金額を超える場合におけるその超える金額
    イ損失の金額に含まれる災害関連支出の金額（損失の金額のうち災害に直接関連して支出をした金額として
      政令で定める金額をいう。以下この号において同じ。）が五万円以下である場合（災害関連支出の金額がない場合を含む。）
      当該納税義務者の前年の総所得金額、退職所得金額及び山林所得金額の合計額の十分の一に相当する金額
    ロ損失の金額に含まれる災害関連支出の金額が五万円を超える場合損失の金額の合計額から災害関連支出の金額のうち
      五万円を超える部分の金額を控除した金額とイに定める金額とのいずれか低い金額
    ハ損失の金額が全て災害関連支出の金額である場合五万円とイに定める金額とのいずれか低い金額」

Computational result:

  閾値(th):
    if disasterRelatedSpending ≤ ¥50,000 (or none)
      → th = floor(totalGeneralIncome * 10 / 100)            ("イ")
    else if disasterLossTotal = disasterRelatedSpending ("ハ")
      → th = min(¥50,000, イ)
    else                                                    ("ロ")
      → th = min(lossTotal − (spending − ¥50,000), イ)
  雑損控除額 = max(0, disasterLossTotal − th)

Out of scope:

* "災害関連支出の金額（損失の金額のうち災害に直接関連して支出をした金額として政令で定める金額）" は caller-established Money
* 対象資産（第三十二条第十項に規定する資産及び生活に通常必要でない資産として政令で定める資産を除く。）の適格性は caller-established booleans
* 付加: 災害等に関連して政令で定めるやむを得ない支出をした場合を含む文言は損失の金額の定義に含まれるので、
  呼出元は災害関連支出の金額を含めて `disasterLossTotal` に入れること
* art. 34(1)第十一号（控除順序）— 非モデル化
* 今年度にわたる 雑損控除額全額の総控除限度は該当年度の所得の金額での制限 — 呼出元の責任モデル

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 34(1)第一号 雑損控除の適用条件を externally established booleans / Money で表す。 -/
structure DisasterLossFacts where
  /-- 総所得金額、退職所得金額及び山林所得金額の合計額。 -/
  totalGeneralIncome : Money
  /-- 損失の金額の合計額（保険金等で補填される部分を控除した後）。 -/
  disasterLossTotal : Money
  /-- 災害関連支出の金額（損失の金額のうち災害に直接関連して支出をした金額、caller-established）。 -/
  disasterRelatedSpending : Money
  deriving DecidableEq, Repr

/-- art. 34(1)第一号 イ: 総所得金額等× 10 / 100（十分の一）。 -/
def tenth (totalGeneralIncome : Money) : Money := totalGeneralIncome * 10 / 100

/-- art. 34(1)第一号: 損失の金額 > threshold の場合に超える金額。 -/
def disasterLossDeductionThreshold (f : DisasterLossFacts) : Money :=
  if f.disasterRelatedSpending ≤ 50_000 then
    tenth f.totalGeneralIncome
  else if f.disasterLossTotal = f.disasterRelatedSpending then
    min 50_000 (tenth f.totalGeneralIncome)
  else
    min (f.disasterLossTotal - (f.disasterRelatedSpending - 50_000))
      (tenth f.totalGeneralIncome)

/-- art. 34(1)第一号: 雑損控除額（超える金額、0 を下限）。 -/
def disasterLossDeduction (f : DisasterLossFacts) : Money :=
  let th := disasterLossDeductionThreshold f
  if f.disasterLossTotal > th then f.disasterLossTotal - th else 0

theorem disasterLossThreshold_le_tenth_caseA (f : DisasterLossFacts) (h : f.disasterRelatedSpending ≤ 50_000) :
    disasterLossDeductionThreshold f = tenth f.totalGeneralIncome := by
  unfold disasterLossDeductionThreshold
  rw [ite_eq_left h]

theorem disasterLossThreshold_le_tenth_of_equals_case (f : DisasterLossFacts)
    (h1 : f.disasterRelatedSpending > 50_000) (h2 : f.disasterLossTotal = f.disasterRelatedSpending) :
    disasterLossDeductionThreshold f ≤ tenth f.totalGeneralIncome := by
  unfold disasterLossDeductionThreshold
  rw [ite_eq_right (Nat.not_le_of_gt h1), ite_eq_left h2]
  exact Nat.min_le_right _ _

/-- 雑損控除額は損失の金額を超えない。 -/
theorem disasterLossDeduction_le_lossTotal (f : DisasterLossFacts) :
    disasterLossDeduction f ≤ f.disasterLossTotal := by
  unfold disasterLossDeduction
  by_cases h : f.disasterLossTotal > disasterLossDeductionThreshold f
  · rw [ite_eq_left h]
    exact Nat.sub_le _ _
  · rw [ite_eq_right h]
    exact Nat.zero_le _

/-- threshold は tenth の 1/x を超えない（ロ/ハのケースでも、threshold = min(..., tenth) ≤ tenth）。 -/
theorem disasterLossThreshold_le_tenth (f : DisasterLossFacts) :
    disasterLossDeductionThreshold f ≤ tenth f.totalGeneralIncome := by
  unfold disasterLossDeductionThreshold
  by_cases h : f.disasterRelatedSpending ≤ 50_000
  · rw [ite_eq_left h]
    exact Nat.le_refl _
  · rw [ite_eq_right h]
    by_cases h2 : f.disasterLossTotal = f.disasterRelatedSpending
    · rw [ite_eq_left h2]
      exact Nat.min_le_right _ _
    · rw [ite_eq_right h2]
      exact Nat.min_le_right _ _

-- ==== kernel-decided smoke checks ====

example : disasterLossDeduction ⟨0, 0, 0⟩ = 0 := by decide
example : disasterLossDeduction ⟨1_000_000, 0, 0⟩ = 0 := by decide
example : disasterLossDeduction ⟨1_000_000, 100_000, 0⟩ = 0 := by decide
example : disasterLossDeduction ⟨1_000_000, 150_000, 0⟩ = 50_000 := by decide
-- イ: 無支出、総所得 1,000,000 → th = 100_000
example : disasterLossDeductionThreshold ⟨1_000_000, 150_000, 0⟩ = 100_000 := by decide
-- ロ: 支出 80_000（損失 200_000）
-- イ = 100_000; 損失 - (支出 - 50_000) = 200_000 - 30_000 = 170_000 → min(170_000, 100_000) = 100_000
example : disasterLossDeductionThreshold ⟨1_000_000, 200_000, 80_000⟩ = 100_000 := by decide
example : disasterLossDeduction ⟨1_000_000, 200_000, 80_000⟩ = 100_000 := by decide
-- ハ: 全損失が災害関連支出、loss = spending = 80_000 → min(50_000, 100_000) = 50_000
example : disasterLossDeductionThreshold ⟨1_000_000, 80_000, 80_000⟩ = 50_000 := by decide
example : disasterLossDeduction ⟨1_000_000, 80_000, 80_000⟩ = 30_000 := by decide
-- イの十分の一ゼロの case でも threshold は 0
example : disasterLossDeductionThreshold ⟨0, 100_000, 0⟩ = 0 := by decide
example : disasterLossDeduction ⟨0, 100_000, 0⟩ = 100_000 := by decide

end JapanTaxLaw

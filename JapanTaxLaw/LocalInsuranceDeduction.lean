import JapanTaxLaw.TaxFinance

/-!
# LocalInsuranceDeduction — 地方税法 art. 34(1)第五号（生命保険料控除）・art. 34(1)第五号の三（地震保険料控除）L4 モデル

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53
  (data/raw/325AC0000000226_20261101_508AC0000000002.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as LocalIncomeTax.lean)

Models art. 34(1)第五号 and art. 34(1)第五号の三 — pinned bytes 逐語:

  第五号（生命保険料控除）:
  「前年中にイに規定する新生命保険料若しくは旧生命保険料、ロに規定する介護医療保険料又は
    ハに規定する新個人年金保険料若しくは旧個人年金保険料を支払つた所得割の納税義務者
   次のイからハまでに掲げる場合の区分に応じ、それぞれイからハまでに定める金額の合計額
    （当該合計額が七万円を超える場合には、七万円）」

  イ（新・旧生命保険）:
  「（１）新生命保険料を支払つた場合（（３）に掲げる場合を除く。）…（ｉ）…一万二千円以下…当該合計額（ｉｉ）一万二千円を超え三万二千円以下…一万二千円と当該合計額から一万二千円を控除した金額の二分の一に相当する金額との合計額（ｉｉｉ）三万二千円を超え五万六千円以下…二万二千円と当該合計額から三万二千円を控除した金額の四分の一に相当する金額との合計額（ｉｖ）五万六千円を超える…二万八千円」
  「（２）旧生命保険料を支払つた場合（（３）に掲げる場合を除く。）…（ｉ）一万五千円以下…当該合計額（ｉｉ）一万五千円を超え四万円以下…一万五千円と当該合計額から一万五千円を控除した金額の二分の一に相当する金額との合計額（ｉｉｉ）四万円を超え七万円以下…二万七千五百円と当該合計額から四万円を控除した金額の四分の一に相当する金額との合計額（ｉｖ）七万円を超える…三万五千円」
  「（３）新生命保険料及び旧生命保険料の両方を支払つた場合…それぞれイからハまでに定める金額の合計額（当該合計額が二万八千円を超える場合には、二万八千円）」

  ロ（介護医療保険料）: same as 新生命保険料の brackets, cap ¥28,000:
  「前年中に支払つた介護医療保険料の金額の合計額が五万六千円を超える場合二万八千円」

  ハ（新・旧個人年金保険料）: same as 新・旧生命保険料の brackets; cap ¥28,000（両方の場合）:
  「新個人年金保険料を支払つた場合（（３）に掲げる場合を除く。）…（ｉ）一万二千円以下…（ｖｉ）五万六千円超過…二万八千円」
  「旧個人年金保険料を支払つた場合（（３）に掲げる場合を除く。）…（ｉ）一万五千円以下…（ｖｉ）七万円超過…三万五千円」
  「（３）新個人年金保険料及び旧個人年金保険料の両方を支払つた場合…合計額（当該合計額が二万八千円を超える場合には、二万八千円）」

  第五号の三（地震保険料控除）:
  「前年中に支払つた地震保険料の金額の合計額…の二分の一に相当する金額（その金額が二万五千円を超える場合には、二万五千円）」

Scope: 各保険料の金額の合計額（保険金等で補填される部分を除いた後の金額）を caller-established で受け取る。
Art. 34(1)第十一号の控除順序規定などは**非モデル化**。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance


/-- art. 34(1)第五号 新生命保険料欄 (column イ (1)/(3)): brackets, capped at ¥28,000. -/
def newLifeInsuranceDeduction (paid : Money) : Money :=
  if paid ≤ 12_000 then paid
  else if paid ≤ 32_000 then 12_000 + (paid - 12_000) / 2
  else if paid ≤ 56_000 then 22_000 + (paid - 32_000) / 4
  else 28_000

/-- art. 34(1)第五号 旧生命保険料欄 (column イ (2)/(3)): brackets, capped at ¥35,000. -/
def oldLifeInsuranceDeduction (paid : Money) : Money :=
  if paid ≤ 15_000 then paid
  else if paid ≤ 40_000 then 15_000 + (paid - 15_000) / 2
  else if paid ≤ 70_000 then 27_500 + (paid - 40_000) / 4
  else 35_000

/-- art. 34(1)第五号 介護医療保険料欄 (column ロ): same brackets as new life, capped at ¥28,000. -/
def nursingCareMedicalInsuranceDeduction (paid : Money) : Money := newLifeInsuranceDeduction paid

/-- art. 34(1)第五号 新個人年金保険料欄 (column ハ (1)/(3)): same as new life. -/
def newPersonalAnnuityDeduction (paid : Money) : Money := newLifeInsuranceDeduction paid

/-- art. 34(1)第五号 旧個人年金保険料欄 (column ハ (2)/(3)): same as old life. -/
def oldPersonalAnnuityDeduction (paid : Money) : Money := oldLifeInsuranceDeduction paid

/-- art. 34(1)第五号 イ欄: 新・旧両方支払った場合は ¥28,000 合計額で上限。 -/
def lifeInsuranceColumnI (newPaid oldPaid : Money) : Money :=
  if newPaid > 0 ∧ oldPaid > 0 then
    min 28_000 (newLifeInsuranceDeduction newPaid + oldLifeInsuranceDeduction oldPaid)
  else if newPaid > 0 then
    newLifeInsuranceDeduction newPaid
  else if oldPaid > 0 then
    oldLifeInsuranceDeduction oldPaid
  else
    0

/-- art. 34(1)第五号 ハ欄: 新個人年金・旧個人年金両方支払った場合は ¥28,000 合計額で上限。 -/
def lifeInsuranceColumnH (newAnnuityPaid oldAnnuityPaid : Money) : Money :=
  if newAnnuityPaid > 0 ∧ oldAnnuityPaid > 0 then
    min 28_000 (newPersonalAnnuityDeduction newAnnuityPaid + oldPersonalAnnuityDeduction oldAnnuityPaid)
  else if newAnnuityPaid > 0 then
    newPersonalAnnuityDeduction newAnnuityPaid
  else if oldAnnuityPaid > 0 then
    oldPersonalAnnuityDeduction oldAnnuityPaid
  else
    0

/-- art. 34(1)第五号（column ロ）: 介護医療保険料欄。 -/
def lifeInsuranceColumnM (nursingPaid : Money) : Money :=
  if nursingPaid > 0 then nursingCareMedicalInsuranceDeduction nursingPaid else 0

/-- art. 34(1)第五号 block: イ + ロ + ハ, capped at ¥70,000. -/
def lifeInsuranceDeduction (newLifePaid oldLifePaid nursingPaid newAnnuityPaid oldAnnuityPaid : Money) : Money :=
  min 70_000 (lifeInsuranceColumnI newLifePaid oldLifePaid +
    lifeInsuranceColumnM nursingPaid +
    lifeInsuranceColumnH newAnnuityPaid oldAnnuityPaid)

/-- art. 34(1)第五号の三: 地震保険料控除額（支払合計額の二分の一、¥25,000 上限）。 -/
def earthquakeInsuranceDeduction (totalPaid : Money) : Money :=
  if totalPaid / 2 ≤ 25_000 then totalPaid / 2 else 25_000

-- ==== verified model facts ====

set_option maxRecDepth 8192 in
/-- 新生命保険料／介護医療保険料／新個人年金保険料の各欄は ¥28,000 を超えない。 -/
theorem newLifeInsuranceDeduction_cap : ∀ x, newLifeInsuranceDeduction x ≤ 28_000 := by
  intro x
  unfold newLifeInsuranceDeduction
  by_cases h : x ≤ 12_000
  · rw [ite_eq_left h]
    exact Nat.le_trans h (by decide : 12_000 ≤ 28_000)
  · rw [ite_eq_right h]
    by_cases h2 : x ≤ 32_000
    · rw [ite_eq_left h2]
      have h4 : (x - 12_000) / 2 ≤ (32_000 - 12_000) / 2 :=
        Nat.div_le_div_right (Nat.sub_le_sub_right h2 12_000)
      calc 12_000 + (x - 12_000) / 2
          ≤ 12_000 + (32_000 - 12_000) / 2 := Nat.add_le_add_left h4 _
        _ = 22_000 := by decide
        _ ≤ 28_000 := by decide
    · rw [ite_eq_right h2]
      by_cases h3 : x ≤ 56_000
      · rw [ite_eq_left h3]
        have h4 : (x - 32_000) / 4 ≤ (56_000 - 32_000) / 4 :=
          Nat.div_le_div_right (Nat.sub_le_sub_right h3 32_000)
        calc 22_000 + (x - 32_000) / 4
            ≤ 22_000 + (56_000 - 32_000) / 4 := Nat.add_le_add_left h4 _
          _ = 28_000 := by decide
      · rw [ite_eq_right h3]
        exact Nat.le_refl 28_000

set_option maxRecDepth 8192 in
/-- 旧生命保険料／旧個人年金保険料の各欄は ¥35,000 を超えない。 -/
theorem oldLifeInsuranceDeduction_cap : ∀ x, oldLifeInsuranceDeduction x ≤ 35_000 := by
  intro x
  unfold oldLifeInsuranceDeduction
  by_cases h : x ≤ 15_000
  · rw [ite_eq_left h]
    exact Nat.le_trans h (by decide : 15_000 ≤ 35_000)
  · rw [ite_eq_right h]
    by_cases h2 : x ≤ 40_000
    · rw [ite_eq_left h2]
      have h4 : (x - 15_000) / 2 ≤ (40_000 - 15_000) / 2 :=
        Nat.div_le_div_right (Nat.sub_le_sub_right h2 15_000)
      calc 15_000 + (x - 15_000) / 2
          ≤ 15_000 + (40_000 - 15_000) / 2 := Nat.add_le_add_left h4 _
        _ = 27_500 := by decide
        _ ≤ 35_000 := by decide
    · rw [ite_eq_right h2]
      by_cases h3 : x ≤ 70_000
      · rw [ite_eq_left h3]
        have h4 : (x - 40_000) / 4 ≤ (70_000 - 40_000) / 4 :=
          Nat.div_le_div_right (Nat.sub_le_sub_right h3 40_000)
        calc 27_500 + (x - 40_000) / 4
            ≤ 27_500 + (70_000 - 40_000) / 4 := Nat.add_le_add_left h4 _
          _ = 35_000 := by decide
      · rw [ite_eq_right h3]
        exact Nat.le_refl 35_000

set_option maxRecDepth 8192 in
/-- art. 34(1)第五号 イ欄: 新・旧両方支払った場合は ¥28,000 合計額で上限。 -/
theorem lifeInsuranceColumnI_le_35000 (n o : Money) : lifeInsuranceColumnI n o ≤ 35_000 := by
  unfold lifeInsuranceColumnI
  by_cases h : n > 0 ∧ o > 0
  · rw [ite_eq_left h]
    exact Nat.le_trans (Nat.min_le_left _ _) (by decide : 28_000 ≤ 35_000)
  · rw [ite_eq_right h]
    by_cases hn : n > 0
    · rw [ite_eq_left hn]
      exact Nat.le_trans (newLifeInsuranceDeduction_cap n) (by decide : 28_000 ≤ 35_000)
    · rw [ite_eq_right hn]
      by_cases ho : o > 0
      · rw [ite_eq_left ho]
        exact oldLifeInsuranceDeduction_cap o
      · rw [ite_eq_right ho]
        exact Nat.zero_le _

set_option maxRecDepth 8192 in
/-- art. 34(1)第五号 ハ欄: 新個人年金・旧個人年金両方支払った場合は ¥28,000 合計額で上限。 -/
theorem lifeInsuranceColumnH_le_35000 (n o : Money) : lifeInsuranceColumnH n o ≤ 35_000 := by
  unfold lifeInsuranceColumnH newPersonalAnnuityDeduction oldPersonalAnnuityDeduction
  by_cases h : n > 0 ∧ o > 0
  · rw [ite_eq_left h]
    exact Nat.le_trans (Nat.min_le_left _ _) (by decide : 28_000 ≤ 35_000)
  · rw [ite_eq_right h]
    by_cases hn : n > 0
    · rw [ite_eq_left hn]
      exact Nat.le_trans (newLifeInsuranceDeduction_cap n) (by decide : 28_000 ≤ 35_000)
    · rw [ite_eq_right hn]
      by_cases ho : o > 0
      · rw [ite_eq_left ho]
        exact oldLifeInsuranceDeduction_cap o
      · rw [ite_eq_right ho]
        exact Nat.zero_le _

theorem lifeInsuranceDeduction_le_70000 (a b c d e : Money) :
    lifeInsuranceDeduction a b c d e ≤ 70_000 := by
  unfold lifeInsuranceDeduction
  exact Nat.min_le_left _ _

-- ==== kernel-decided smoke checks ====

example : newLifeInsuranceDeduction 0 = 0 := by decide
example : newLifeInsuranceDeduction 12_000 = 12_000 := by decide
example : newLifeInsuranceDeduction 12_001 = 12_000 := by decide
example : newLifeInsuranceDeduction 32_000 = 22_000 := by decide
example : newLifeInsuranceDeduction 32_001 = 22_000 := by decide
example : newLifeInsuranceDeduction 56_000 = 28_000 := by decide
example : newLifeInsuranceDeduction 56_001 = 28_000 := by decide
example : newLifeInsuranceDeduction 100_000_000 = 28_000 := by decide

example : oldLifeInsuranceDeduction 0 = 0 := by decide
example : oldLifeInsuranceDeduction 15_000 = 15_000 := by decide
example : oldLifeInsuranceDeduction 15_001 = 15_000 := by decide
example : oldLifeInsuranceDeduction 40_000 = 27_500 := by decide
example : oldLifeInsuranceDeduction 40_001 = 27_500 := by decide
example : oldLifeInsuranceDeduction 70_000 = 35_000 := by decide
example : oldLifeInsuranceDeduction 70_001 = 35_000 := by decide

example : lifeInsuranceColumnI 10_000 10_000 = 20_000 := by decide
example : lifeInsuranceColumnI 20_000 20_000 = 28_000 := by decide
example : lifeInsuranceColumnI 20_000 0 = 16_000 := by decide
example : lifeInsuranceColumnI 0 20_000 = 17_500 := by decide

example : lifeInsuranceDeduction 0 0 0 0 0 = 0 := by decide
example : lifeInsuranceDeduction 10_000 10_000 10_000 10_000 10_000 = 50_000 := by decide
example : lifeInsuranceDeduction 100_000_000 100_000_000 100_000_000 100_000_000 100_000_000 = 70_000 := by decide

example : earthquakeInsuranceDeduction 0 = 0 := by decide
example : earthquakeInsuranceDeduction 1 = 0 := by decide
example : earthquakeInsuranceDeduction 50_000 = 25_000 := by decide
example : earthquakeInsuranceDeduction 100_000 = 25_000 := by decide

end JapanTaxLaw

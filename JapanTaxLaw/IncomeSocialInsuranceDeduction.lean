import JapanTaxLaw.TaxFinance

/-!
# IncomeSocialInsuranceDeduction — 所得税法 art. 74（社会保険料控除）の bounded L4 モデル

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B
  (data/raw/340AC0000000033_20261001_507AC0000000070.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as IndividualIncomeTax.lean / IncomeBasicDeduction.lean /
   IncomeDependentDeductions.lean / IncomeWithholdingRates.lean /
   IncomeMiscDeductions.lean)

Namespace note: a dedicated sub-namespace `JapanTaxLaw.IncomeSocialInsuranceDeduction` is used
on purpose so this slice cannot collide with the flat-namespace `socialInsuranceDeduction`
constant of 地方税法 art. 34 (SocialInsuranceMutualAidDeduction.lean). This module models
所得税法 art. 74 only.

Pinned bytes 逐語 (needle evidence, transcribed one-for-one from the normalized source;
`re.sub(r"[\s　]+", "", ...)` 正規化後も一字不変。担当範囲原文・pinned JSON の
両方で各 1 回出現を `.find()` で確認済み):

  art. 74(1) 「居住者が、各年において、自己又は自己と生計を一にする配偶者その他の親族の負担すべき社会保険料を支払つた場合又は給与から控除される場合には、その支払つた金額又はその控除される金額を、その居住者のその年分の総所得金額、退職所得金額又は山林所得金額から控除する。」
  art. 74(2) 「前項に規定する社会保険料とは、次に掲げるものその他これらに準ずるもので政令で定めるもの（第九条第一項第七号（在勤手当の非課税）に掲げる給与に係るものを除く。）をいう。」
  art. 74(2) 一 「一健康保険法（大正十一年法律第七十号）の規定により被保険者として負担する健康保険の保険料」
  art. 74(2) 五 「五国民年金法の規定により被保険者として負担する国民年金の保険料及び国民年金基金の加入員として負担する掛金」

Computational result (bounded):

  socialInsuranceDeduction paidAmount = paidAmount
    （原文に上限・率なし。支払つた金額／給与から控除される金額そのものを控除）
  taxableAfterSocialInsurance totalIncome paid = totalIncome − paid  (saturating Nat)
    paid ≤ totalIncome のとき exact（アンダーフローなし）:
      taxableAfterSocialInsurance totalIncome paid + paid = totalIncome

Out of scope / honesty notes:

  * 社会保険料に該当するかどうか（art. 74(2) の健康保険・国民健康保険・介護保険・
    雇用保険・国民年金・厚生年金等の列挙、「政令で定めるもの」、
    「第九条第一項第七号に掲げる給与に係るものを除く」の適用可否）は
    **caller-established** とし、該当性判定の Bool は金額計算式に入れません。
  * 「居住者であること」「自己又は自己と生計を一にする配偶者その他の親族の負担すべき
    社会保険料であること」「支払つた／給与から控除される金額の算定」もすべて
    caller-established です。総所得金額（totalIncome）・支払額（paid）は入力です。
  * 給与から控除される場合も「その控除される金額」を paid として同じ式で扱います
    （支払と控除で別の式は作りません）。
  * 本モデルは**所得控除の額のみ**を扱い、税額計算（課税所得・税率適用・復興特別所得税・
    防衛特別所得税）は一切含みません。控除の適用順序、他の所得控除との調整、
    総所得金額等自体の算定、端数処理（通則法 art. 118 / 119）は非モデル化。
  * 所得税法全体の完成・網羅を主張しません。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.IncomeSocialInsuranceDeduction

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 74 — 控除額と控除後金額
-- ============================================================

/-- art. 74(1): 社会保険料控除額 = 支払つた金額（又は給与から控除される金額）そのもの。
    原文に上限・率はなし。社会保険料に該当するかは caller-established で、この式には
    該当性判定の Bool を入れません。 -/
def socialInsuranceDeduction (paidAmount : Money) : Money := paidAmount

/-- art. 74(1): 控除後金額 = 総所得等 − 支払額（saturating Nat 減算）。
    税額計算ではなく所得控除の額のみをモデル化する。総所得金額・支払額は
    caller-established な入力。 -/
def taxableAfterSocialInsurance (totalIncome paid : Money) : Money :=
  totalIncome - paid

-- --- 控除額は支払額そのもの（原文に上限・率なし） ---

theorem socialInsuranceDeduction_eq (paidAmount : Money) :
    socialInsuranceDeduction paidAmount = paidAmount := rfl

theorem socialInsuranceDeduction_mono {a b : Money} (h : a ≤ b) :
    socialInsuranceDeduction a ≤ socialInsuranceDeduction b := by
  exact h

-- --- 控除後金額: 原文の減算式への接続 ---

/-- paid ≤ totalIncome のとき、控除後 = 総所得 − 支払額（原文の減算式そのもの）。 -/
theorem taxableAfterSocialInsurance_eq_sub_of_le (totalIncome paid : Money)
    (_h : paid ≤ totalIncome) :
    taxableAfterSocialInsurance totalIncome paid = totalIncome - paid := rfl

/-- paid ≤ totalIncome のとき exact（アンダーフローなし）:
    (総所得 − 支払額) ＋ 支払額 ＝ 総所得。 -/
theorem taxableAfterSocialInsurance_add_paid_of_le (totalIncome paid : Money)
    (h : paid ≤ totalIncome) :
    taxableAfterSocialInsurance totalIncome paid + paid = totalIncome := by
  unfold taxableAfterSocialInsurance
  exact Nat.sub_add_cancel h

/-- `a ≤ b → a - b = 0` の axiom-free 証明。core の `Nat.sub_eq_zero_of_le` は
    `propext` に依存するため、`Nat.zero_sub` / `Nat.succ_sub_succ` を用いた
    帰納法で自前で示す。 -/
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

/-- 総所得 < 支払額のとき saturating 減算で 0（控除後は負にならない）。 -/
theorem taxableAfterSocialInsurance_of_lt (totalIncome paid : Money)
    (h : totalIncome < paid) :
    taxableAfterSocialInsurance totalIncome paid = 0 := by
  unfold taxableAfterSocialInsurance
  exact natSubEqZeroOfLeFree (Nat.le_of_lt h)

/-- 控除後は元の総所得を超えない。 -/
theorem taxableAfterSocialInsurance_le_income (totalIncome paid : Money) :
    taxableAfterSocialInsurance totalIncome paid ≤ totalIncome := by
  unfold taxableAfterSocialInsurance
  exact Nat.sub_le _ _

-- ==== kernel-decided smoke checks ====

example : socialInsuranceDeduction 0 = 0 := by decide
example : socialInsuranceDeduction 100_000 = 100_000 := by decide
example : socialInsuranceDeduction 1_000_000_000 = 1_000_000_000 := by decide

example : taxableAfterSocialInsurance 1_000_000 250_000 = 750_000 := by decide
example : taxableAfterSocialInsurance 250_000 250_000 = 0 := by decide
example : taxableAfterSocialInsurance 100_000 250_000 = 0 := by decide  -- paid > total (underflow)
example : taxableAfterSocialInsurance 0 0 = 0 := by decide
example : taxableAfterSocialInsurance 101 3 = 98 := by decide          -- 端数

end JapanTaxLaw.IncomeSocialInsuranceDeduction

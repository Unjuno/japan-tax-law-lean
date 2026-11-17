import JapanTaxLaw.TaxFinance

/-!
# IncomeDependentDeductions — 所得税法 art. 84（扶養控除）の bounded L4 モデル
  および art. 186の2（源泉控除対象配偶者に係る控除の適用）の NOT MODELLED 記録

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B
  (data/raw/340AC0000000033_20261001_507AC0000000070.law.json,
   current enforced revision per data/INVENTORY.json; same pin as
   IndividualIncomeTax.lean / IncomeMiscDeductions.lean)

Namespace note: a dedicated sub-namespace `JapanTaxLaw.IncomeDependentDeductions` is used
on purpose. The flat `JapanTaxLaw` namespace already owns `specificDependentDeduction`
and `elderlyDependentDeductionWithCoHabitation` from 地方税法 art. 34 (LocalIncomeTax.lean)
with DIFFERENT amounts (¥450,000 / ¥450,000 or ¥380,000). 本モジュールの所得税法
art. 84 の額は ¥380,000 / ¥630,000 / ¥480,000 です。名前衝突を避けるため部分名前空間を分離します。

Pinned bytes 逐語 (needle evidence, transcribed one-for-one from the normalized source;
`re.sub(r"[\s　]+", "", ...)` 正規化後も一字不変。担当範囲原文・pinned JSON の両方で
各 1 回出現を確認済み):

  art. 84 「居住者が控除対象扶養親族を有する場合には、その居住者のその年分の総所得金額、退職所得金額又は山林所得金額から、その控除対象扶養親族一人につき三十八万円」
          「その者が特定扶養親族である場合には六十三万円」
          「その者が老人扶養親族である場合には四十八万円」
          「前項の規定による控除は、扶養控除という。」
  art. 186の2 「（源泉控除対象配偶者に係る控除の適用）第百八十六条の二」
          「に源泉控除対象配偶者である旨の記載がされていないものとして、第百八十五条第一項第一号及び第二号並びに前条第一項第一号及び第二項第一号の規定を適用する。」

金額の読み取り（日本語数字 → Arabic、原文どおり）:

  三十八万円 = 380,000（一般の控除対象扶養親族）
  六十三万円 = 630,000（特定扶養親族）
  四十八万円 = 480,000（老人扶養親族）

  ※ 指示文の「老人控除対象扶養親族は58万円」は原文と異なります。原文は
    「老人扶養親族である場合には四十八万円」であり、本モデルは原文に従い
    480,000 を採用します（指示文自身が「原文を正確に読んで金額を確認すること」と
    求めている通りに確認した結果です）。

 Computational result (bounded):

   art84AmountPerDependent:
     general  → 380_000
     specific → 630_000
     elderly  → 480_000
   art84TotalDependentDeduction(b) =
     b.generalCount * 380_000 + b.specificCount * 630_000 + b.elderlyCount * 480_000
     （通常の Nat 掛け算・加算、上限なし・端数処理なし）
   art84IncomeAfterDependentDeduction(totalIncome, b) =
     totalIncome − art84TotalDependentDeduction(b)  (saturating Nat)

 NOT MODELLED — art. 186の2（源泉控除対象配偶者に係る控除の適用）:

   原文は、給与所得者の扶養控除等申告書等に源泉控除対象配偶者として記載された
   配偶者が、当該居住者を自らの申告書等に源泉控除対象配偶者として記載して
   第185条1項1号・2号／第186条1項1号・2項1号／第203条の3第1号〜第3号の
   適用を受ける場合に、当該居住者の申告書には記載がなかったものとして
   これらの規定を適用する、という **重複申告を排除するための法的擬制・
   適用順位の規定** です。金額・率・算定式などの「明確な計算規則」を一切
   含まず、第185条・第186条・第203条の3の源泉徴収税額計算自体も本スライスの
   外です。したがって数値モデルを作らず NOT MODELLED と明記します
   （原文の逐語 evidence は上記 needle で保持し、読んだことを記録します）。

 Out of scope / honesty notes:

   * 該当性（控除対象扶養親族であること、特定扶養親族・老人扶養親族であること、
     居住者であること）はすべて caller-established とし、区分・人数を
     入力として受け取る計算関数のみを提供します（ Bool を定数式に混入させません）。
   * 合計控除額に上限は設けません（原文に上限規定なし）。控除の適用順序、
     総所得金額・退職所得金額・山林所得金額自体の算定、他の所得控除との調整、
     復興特別所得税・防衛特別所得税、端数処理（通則法 art. 118 / 119）は非モデル化。
   * 第84条以外の所得控除条、第186条の2が参照する第185条・第186条・第203条の3は
     本スライスの外です。所得税法全体の完成・網羅を主張しません。

 Pinned evidence in doc-comments only; all theorems claim model properties only.
 All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.IncomeDependentDeductions

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 84 — 区分ごとの一人当たり定数
-- ============================================================

/-- art. 84 本文: 控除対象扶養親族一人につき三十八万円。 -/
def generalDependentAmount : Money := 380_000

/-- art. 84 括弧内: 特定扶養親族である場合には六十三万円。 -/
def specificDependentAmount : Money := 630_000

/-- art. 84 括弧内: 老人扶養親族である場合には四十八万円（原文「四十八万円」）。 -/
def elderlyDependentAmount : Money := 480_000

-- ============================================================
-- art. 84 — 扶養親族の区分と内訳（区分・人数は caller-established）
-- ============================================================

/-- art. 84 の扶養親族の区分。区分の認定は caller-established。 -/
inductive DependentCategory where
  | general
  | specific
  | elderly
  deriving DecidableEq, Repr

/-- 区分ごとの一人当たり控除額。引数の区分は caller-established。 -/
def art84AmountPerDependent (c : DependentCategory) : Money :=
  match c with
  | .general  => generalDependentAmount
  | .specific => specificDependentAmount
  | .elderly  => elderlyDependentAmount

/-- 区分別の人数内訳。各人数は caller-established（何人いるかの認定は行わない）。 -/
structure DependentBreakdown where
  generalCount : Nat
  specificCount : Nat
  elderlyCount : Nat
  deriving DecidableEq, Repr

/-- art. 84: 合計扶養控除額 = 区分別金額 × 人数の和。
     通常の Nat 掛け算・加算であり、上限なし・端数処理なし。 -/
def art84TotalDependentDeduction (b : DependentBreakdown) : Money :=
  b.generalCount * generalDependentAmount
    + b.specificCount * specificDependentAmount
    + b.elderlyCount * elderlyDependentAmount

/-- art. 84: 控除後の金額 = 総所得等 − 合計扶養控除額（saturating Nat）。 -/
def art84IncomeAfterDependentDeduction (totalIncome : Money)
    (b : DependentBreakdown) : Money :=
  totalIncome - art84TotalDependentDeduction b

-- --- positivity ---

theorem generalDependentAmount_pos : 0 < generalDependentAmount := by decide
theorem specificDependentAmount_pos : 0 < specificDependentAmount := by decide
theorem elderlyDependentAmount_pos : 0 < elderlyDependentAmount := by decide

-- --- 区分選択の characterization ---

theorem art84AmountPerDependent_general :
    art84AmountPerDependent .general = generalDependentAmount := rfl
theorem art84AmountPerDependent_specific :
    art84AmountPerDependent .specific = specificDependentAmount := rfl
theorem art84AmountPerDependent_elderly :
    art84AmountPerDependent .elderly = elderlyDependentAmount := rfl

-- --- 合計額の connection ---

theorem art84TotalDependentDeduction_zero :
    art84TotalDependentDeduction ⟨0, 0, 0⟩ = 0 := by decide

theorem art84TotalDependentDeduction_eq (b : DependentBreakdown) :
    art84TotalDependentDeduction b =
      b.generalCount * generalDependentAmount
        + b.specificCount * specificDependentAmount
        + b.elderlyCount * elderlyDependentAmount := rfl

/-- 合計額を区分別額で表し直したもの（enum と総額式の接続）。 -/
theorem art84TotalDependentDeduction_eq_sum (b : DependentBreakdown) :
    art84TotalDependentDeduction b =
      b.generalCount * art84AmountPerDependent .general
        + b.specificCount * art84AmountPerDependent .specific
        + b.elderlyCount * art84AmountPerDependent .elderly := rfl

-- --- saturating 減算の2分岐を明示 ---

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

theorem art84IncomeAfterDependentDeduction_of_ge (totalIncome : Money)
    (b : DependentBreakdown) (_h : art84TotalDependentDeduction b ≤ totalIncome) :
    art84IncomeAfterDependentDeduction totalIncome b =
      totalIncome - art84TotalDependentDeduction b := rfl

theorem art84IncomeAfterDependentDeduction_of_lt (totalIncome : Money)
    (b : DependentBreakdown) (h : totalIncome < art84TotalDependentDeduction b) :
    art84IncomeAfterDependentDeduction totalIncome b = 0 := by
  unfold art84IncomeAfterDependentDeduction
  exact natSubEqZeroOfLeFree (Nat.le_of_lt h)

/-- 控除後は元の総所得を超えない。 -/
theorem art84IncomeAfterDependentDeduction_le_total (totalIncome : Money)
    (b : DependentBreakdown) :
    art84IncomeAfterDependentDeduction totalIncome b ≤ totalIncome := by
  unfold art84IncomeAfterDependentDeduction
  exact Nat.sub_le _ _

-- ==== kernel-decided smoke checks ====

example : generalDependentAmount = 380_000 := by decide
example : specificDependentAmount = 630_000 := by decide
example : elderlyDependentAmount = 480_000 := by decide
example : specificDependentAmount > elderlyDependentAmount := by decide
example : elderlyDependentAmount > generalDependentAmount := by decide

example : art84AmountPerDependent .general = 380_000 := by decide
example : art84AmountPerDependent .specific = 630_000 := by decide
example : art84AmountPerDependent .elderly = 480_000 := by decide

example : art84TotalDependentDeduction ⟨0, 0, 0⟩ = 0 := by decide
example : art84TotalDependentDeduction ⟨1, 0, 0⟩ = 380_000 := by decide
example : art84TotalDependentDeduction ⟨0, 1, 0⟩ = 630_000 := by decide
example : art84TotalDependentDeduction ⟨0, 0, 1⟩ = 480_000 := by decide
example : art84TotalDependentDeduction ⟨2, 1, 3⟩ = 2_830_000 := by decide
example : art84TotalDependentDeduction ⟨100, 0, 0⟩ = 38_000_000 := by decide

example : art84IncomeAfterDependentDeduction 1_000_000 ⟨2, 0, 0⟩ = 240_000 := by decide
example : art84IncomeAfterDependentDeduction 380_000 ⟨1, 0, 0⟩ = 0 := by decide
example : art84IncomeAfterDependentDeduction 0 ⟨0, 0, 0⟩ = 0 := by decide

end JapanTaxLaw.IncomeDependentDeductions

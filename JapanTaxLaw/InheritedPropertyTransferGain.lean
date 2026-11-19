import JapanTaxLaw.TaxFinance

/-!
# InheritedPropertyTransferGain — 租税特別措置法施行令 art. 25の16（相続財産に係る譲渡所得の課税の特例）の bounded L4 モデル

Sources (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 租税特別措置法施行令)

担当範囲原文: C6_inherit2516.txt（art. 25の16、UTF-8、本文 1095 文字）。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only; 一字も変更せず、全角空白 U+3000 を含まない）:

  柱書・ただし書:
    「第一号に掲げる相続税額に第二号に掲げる割合を乗じて計算した金額とする。」
    「当該計算した金額が、当該資産の譲渡所得に係る収入金額から同項の規定の適用がない
      ものとした場合の当該資産の取得費及びその資産の譲渡に要した費用の額の合計額を
      控除した残額に相当する金額を超える場合には、その残額に相当する金額とし、
      当該収入金額が当該合計額に満たない場合には、当該計算した金額は、ないものとする。」
  第一号（相続税額）:
    「国税通則法第二条第四号に規定する附帯税に相当する税額を除く。」
  第二号（割合）:
    「のうちに当該譲渡をした資産の当該課税価格の計算の基礎に算入された価額の占める割合」

Modelled (only the explicit statutory arithmetic):

  * `inheritedTransferBase inheritanceTax ratio = inheritanceTax * ratio.num / ratio.den`
    — 一号の相続税額に二号の割合を乗じた金額（ただし書の上限適用前）。
      割合は caller-established な `TaxRate`（分子/分母）、丸めは切り捨て（Nat 除算）。
  * `inheritedResidualGain proceeds cost = max (proceeds - cost) 0`
    — ただし書の上限となる残額。Nat の減算により収入金額が合計額に満たなければ 0
    （「ないもの」）。`cost` は取得費と譲渡費用の合計額（`transferCostTotal` を参照）。
  * `inheritedTransferGain inheritanceTax ratio proceeds cost =
       min (inheritedTransferBase inheritanceTax ratio) (inheritedResidualGain proceeds cost)`
    — 計算額が残額を超えれば残額、超えなければ計算額。収入金額が合計額に満たなければ 0。

Scope & honest boundaries:

  * 相続税額（一号）・二号の割合・収入金額・取得費・譲渡費用・特例の該当性は
    すべて **caller-established**。金額の認定・該当性判定は本モジュールの外で行い、
    Bool は算定式に入れていません。
  * **二号の割合の具体的算定（相続税法第十一条の二の課税価格、同法第十九条・
    第二十一条の十四〜十八・第十三条の読替え等、他条文参照）は NOT MODELLED**。
    ここでは割合を確定済みの `TaxRate` として受け取るのみです。
  * 第一号の相続税額の確定時点・修正申告/更正後の金額（第2項）、贈与税控除の
    読替え（第3項）、附帯税相当額の控除の具体的算定も **NOT MODELLED**。
  * 原文は端数規定を持たない。Money = Nat の除算による**切り捨て**を丸め規則として
    明示する（他モジュールの `applyFloor` と同一慣例）。解釈を保証するものではありません。
  * 割合の分母 > 0 は `TaxRate.den_pos` により型で担保されています
    （退化ケースに法的意味があるとは主張しません）。
  * 転記監査は fidelity-only であり法的正しさを保証しません。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.
-/

namespace JapanTaxLaw.InheritedPropertyTransferGain

open JapanTaxLaw.TaxFinance

-- ============================================================
-- 原文の「合計額」・一号の金額・二号の割合
-- ============================================================

/-- 原文の「当該資産の取得費及びその資産の譲渡に要した費用の額の合計額」。
    `inheritedTransferGain` の `cost` 引数はこの合計額を指す。 -/
def transferCostTotal (acquisitionCost transferExpenses : Money) : Money :=
  acquisitionCost + transferExpenses

theorem transferCostTotal_eq (acquisitionCost transferExpenses : Money) :
    transferCostTotal acquisitionCost transferExpenses = acquisitionCost + transferExpenses := rfl

-- ============================================================
-- 一号の相続税額 × 二号の割合
-- ============================================================

/-- 一号の相続税額に二号の割合を乗じて計算した金額（ただし書の上限適用前）。
    割合は caller-established な `TaxRate`（分子/分母）、丸めは切り捨て（Nat 除算）。 -/
def inheritedTransferBase (inheritanceTax : Money) (ratio : TaxRate) : Money :=
  ratio.applyFloor inheritanceTax

theorem inheritedTransferBase_eq (inheritanceTax : Money) (ratio : TaxRate) :
    inheritedTransferBase inheritanceTax ratio =
      inheritanceTax * ratio.num / ratio.den := rfl

/-- 相続税額が 0 なら計算額も 0。 -/
theorem inheritedTransferBase_zero_tax (ratio : TaxRate) :
    inheritedTransferBase 0 ratio = 0 := by
  unfold inheritedTransferBase TaxRate.applyFloor
  simp

/-- 割合の分子が 0 なら計算額も 0。 -/
theorem inheritedTransferBase_zero_num (inheritanceTax : Money) :
    inheritedTransferBase inheritanceTax ⟨0, 1, by decide⟩ = 0 := by
  unfold inheritedTransferBase TaxRate.applyFloor
  simp

/-- 割合が 1 以下（num ≤ den）なら計算額は相続税額を超えない。 -/
theorem inheritedTransferBase_le_tax (inheritanceTax : Money) (ratio : TaxRate)
    (h : ratio.num ≤ ratio.den) :
    inheritedTransferBase inheritanceTax ratio ≤ inheritanceTax := by
  unfold inheritedTransferBase TaxRate.applyFloor
  have hmul : inheritanceTax * ratio.num ≤ inheritanceTax * ratio.den :=
    Nat.mul_le_mul_left inheritanceTax h
  have hdiv : inheritanceTax * ratio.num / ratio.den ≤
      inheritanceTax * ratio.den / ratio.den := Nat.div_le_div_right hmul
  rwa [Nat.mul_div_cancel inheritanceTax ratio.den_pos] at hdiv

-- ============================================================
-- ただし書の残額（上限）
-- ============================================================

/-- ただし書の上限となる残額: 収入金額 − (取得費 + 譲渡費用)。
    Nat の減算により収入金額が合計額に満たない場合は 0（「ないもの」）。
    `max ... 0` は原文の「残額に相当する金額」の形を明示するもので、Nat では恒等。 -/
def inheritedResidualGain (proceeds cost : Money) : Money :=
  max (proceeds - cost) 0

/-- Nat では `max (proceeds - cost) 0 = proceeds - cost`。 -/
theorem inheritedResidualGain_eq_sub (proceeds cost : Money) :
    inheritedResidualGain proceeds cost = proceeds - cost := by
  unfold inheritedResidualGain
  exact Nat.max_eq_left (Nat.zero_le _)

/-- 収入金額が合計額以下なら残額は 0。 -/
theorem inheritedResidualGain_zero_when_le (proceeds cost : Money) (h : proceeds ≤ cost) :
    inheritedResidualGain proceeds cost = 0 := by
  unfold inheritedResidualGain
  have hsub : proceeds - cost = 0 := Nat.sub_eq_zero_of_le h
  rw [hsub]
  rfl

/-- 収入金額が合計額に満たないなら残額は 0（「ないもの」）。 -/
theorem inheritedResidualGain_zero_when_lt (proceeds cost : Money) (h : proceeds < cost) :
    inheritedResidualGain proceeds cost = 0 :=
  inheritedResidualGain_zero_when_le proceeds cost (Nat.le_of_lt h)

-- ============================================================
-- 特例金額（一号・二号の積 + ただし書の上限）
-- ============================================================

/-- 相続財産に係る譲渡所得の課税の特例による金額 = min(計算額, 残額)。
    収入金額が合計額に満たなければ残額 = 0 なので結果は 0。 -/
def inheritedTransferGain (inheritanceTax : Money) (ratio : TaxRate)
    (proceeds cost : Money) : Money :=
  min (inheritedTransferBase inheritanceTax ratio) (inheritedResidualGain proceeds cost)

/-- 特例金額は計算額以下。 -/
theorem inheritedTransferGain_le_base (inheritanceTax : Money) (ratio : TaxRate)
    (proceeds cost : Money) :
    inheritedTransferGain inheritanceTax ratio proceeds cost ≤
      inheritedTransferBase inheritanceTax ratio := by
  unfold inheritedTransferGain
  exact Nat.min_le_left _ _

/-- 特例金額は残額以下（ただし書の上限）。 -/
theorem inheritedTransferGain_le_residual (inheritanceTax : Money) (ratio : TaxRate)
    (proceeds cost : Money) :
    inheritedTransferGain inheritanceTax ratio proceeds cost ≤
      inheritedResidualGain proceeds cost := by
  unfold inheritedTransferGain
  exact Nat.min_le_right _ _

/-- 計算額が残額以下なら特例金額 = 計算額。 -/
theorem inheritedTransferGain_eq_base (inheritanceTax : Money) (ratio : TaxRate)
    (proceeds cost : Money)
    (h : inheritedTransferBase inheritanceTax ratio ≤ inheritedResidualGain proceeds cost) :
    inheritedTransferGain inheritanceTax ratio proceeds cost =
      inheritedTransferBase inheritanceTax ratio := by
  unfold inheritedTransferGain
  exact Nat.min_eq_left h

/-- 計算額が残額を超えるなら特例金額 = 残額（上限が効く）。 -/
theorem inheritedTransferGain_eq_residual (inheritanceTax : Money) (ratio : TaxRate)
    (proceeds cost : Money)
    (h : inheritedResidualGain proceeds cost < inheritedTransferBase inheritanceTax ratio) :
    inheritedTransferGain inheritanceTax ratio proceeds cost =
      inheritedResidualGain proceeds cost := by
  unfold inheritedTransferGain
  exact Nat.min_eq_right (Nat.le_of_lt h)

/-- 収入金額が合計額以下なら特例金額は 0（「ないもの」）。 -/
theorem inheritedTransferGain_zero_when_proceeds_le_cost (inheritanceTax : Money)
    (ratio : TaxRate) (proceeds cost : Money) (h : proceeds ≤ cost) :
    inheritedTransferGain inheritanceTax ratio proceeds cost = 0 := by
  unfold inheritedTransferGain
  have hr : inheritedResidualGain proceeds cost = 0 :=
    inheritedResidualGain_zero_when_le proceeds cost h
  rw [hr]
  exact Nat.min_eq_right (Nat.zero_le _)

-- ============================================================
-- kernel-decided smoke checks
-- ============================================================

-- 合計額
example : transferCostTotal 300_000 50_000 = 350_000 := by decide

-- 計算額（一号 × 二号）
example : inheritedTransferBase 1_000_000 ⟨1, 10, by decide⟩ = 100_000 := by decide
example : inheritedTransferBase 1_000 ⟨1, 3, by decide⟩ = 333 := by decide  -- 端数切り捨て
example : inheritedTransferBase 100 ⟨0, 1, by decide⟩ = 0 := by decide
example : inheritedTransferBase 0 ⟨1, 2, by decide⟩ = 0 := by decide

-- 残額
example : inheritedResidualGain 500_000 300_000 = 200_000 := by decide
example : inheritedResidualGain 300_000 500_000 = 0 := by decide
example : inheritedResidualGain 300_000 300_000 = 0 := by decide

-- 特例金額: 計算額 < 残額 → 計算額
example : inheritedTransferGain 1_000_000 ⟨1, 10, by decide⟩ 500_000 300_000 = 100_000 := by decide
-- 計算額 > 残額 → 残額（ただし書の上限）
example : inheritedTransferGain 5_000_000 ⟨1, 10, by decide⟩ 400_000 100_000 = 300_000 := by decide
-- 収入金額 < 合計額 → 0（「ないもの」）
example : inheritedTransferGain 1_000_000 ⟨1, 2, by decide⟩ 100_000 300_000 = 0 := by decide

end JapanTaxLaw.InheritedPropertyTransferGain

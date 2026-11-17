import JapanTaxLaw.TaxFinance

/-!
# SpecialOrderPensionMinimum — 租税特別措置法施行令 第二十六条の二十七（公的年金等控除の最低控除額等の特例）bounded L4 スライス

Source (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json
  (revision CurrentEnforced per data/INVENTORY.json)

Pinned 原文（一字も変更せず、needle として転記監査に渡す）:

  「（公的年金等控除の最低控除額等の特例）第二十六条の二十七年齢が六十五歳以上である
    居住者が所得税法第二百三条の七に規定する公的年金等の支払を受ける場合における
    所得税法施行令第三百十九条の十二の規定の適用については、同条中「百十八万円」と
    あるのは、「百六十八万円（同条に規定する公的年金等が第三百十九条の六第一項各号
    又は第二項第一号（公的年金等の金額から控除する金額の調整等）に掲げるものである
    場合にあつては、九十万円）」とする。２前項の居住者の年齢が六十五歳以上であるか
    どうかの判定は、その年十二月三十一日の年齢によるものとする。」

Models the money constants and the read-replace selection of 第二十六条の二十七:

  * 所得税法施行令 第三百十九条の十二 の基底の最低控除額「百十八万円」= ¥1,180,000
  * 読み替え後「百六十八万円」= ¥1,680,000（年齢65歳以上の居住者）
  * 括弧書「九十万円」= ¥900,000（公的年金等が第三百十九条の六第一項各号又は
    第二項第一号（公的年金等の金額から控除する金額の調整等）に掲げるものである場合）
  * 第2項: 年齢判定は「その年十二月三十一日の年齢による」— caller-established Bool。

Computation (Money = Nat):

  baseMinimumDeduction            = 1_180_000
  specialMinimumDeduction         = 1_680_000
  adjustedPensionMinimumDeduction =   900_000
  minimumDeduction age65 adjusted = if age65 then
                                      if adjusted then 900_000 else 1_680_000
                                    else 1_180_000

Scope & honest boundaries:

  * `isAge65OrOlder`（第1項・第2項の「年齢が六十五歳以上」）と `isAdjustedPension`
    （第三百十九条の六第一項各号又は第二項第一号に掲げる公的年金等であるか）は
    **caller-established Bool**。年齢判定の基準日（その年十二月三十一日）の特定、
    公的年金等の種別の認定、居住者性、公的年金等の支払の有無は本モジュール外の
    法的判断（第2項の判定基準日は doc-comment に記録するのみで計算に用いない）。
  * Bool は**金額の算術には入れず**、原文から定めた 3 つの Money 定数の
    **選択にのみ**使う（ConsumptionTaxRate.rateOf / DelinquencyTax.delinquencyRate と同型）。
  * 所得税法施行令 第三百十九条の十二 の最低控除額そのものの算定、
    第三百十九条の六 各号の具体的な列挙、公的年金等の金額、控除額の調整等の詳細は
    **NOT MODELLED**（すべて caller-established）。
  * Pinned evidence is in doc-comments only; every theorem below claims a property
    of the model, never of the real legal semantics (転記監査は fidelity-only)。
-/

namespace JapanTaxLaw.SpecialOrderPensionMinimum

open JapanTaxLaw.TaxFinance

/-- 所得税法施行令 第三百十九条の十二 の最低控除額「百十八万円」(¥1,180,000)。
    第二十六条の二十七の読み替えが適用されない場合の基底値。 -/
def baseMinimumDeduction : Money := 1_180_000

/-- 第二十六条の二十七(1) の読み替え後の「百六十八万円」(¥1,680,000)。
    年齢65歳以上の居住者のうち、括弧書の調整対象年金以外の公的年金等。 -/
def specialMinimumDeduction : Money := 1_680_000

/-- 第二十六条の二十七(1) の括弧書「九十万円」(¥900,000)。
    公的年金等が第三百十九条の六第一項各号又は第二項第一号
    （公的年金等の金額から控除する金額の調整等）に掲げるものである場合。 -/
def adjustedPensionMinimumDeduction : Money := 900_000

/-- 年齢区分 `isAge65OrOlder` と年金種別 `isAdjustedPension` の 2 つの
    caller-established Bool で最低控除額を選択する。

    * 年齢65歳未満: 読み替えなし → 基底「百十八万円」= 1_180_000
    * 年齢65歳以上 かつ 調整対象年金: 括弧書「九十万円」= 900_000
    * 年齢65歳以上 かつ それ以外: 読み替え「百六十八万円」= 1_680_000

    Bool は金額の算術ではなく 3 定数の選択にのみ現れる。 -/
def minimumDeduction (isAge65OrOlder : Bool) (isAdjustedPension : Bool) : Money :=
  if isAge65OrOlder then
    if isAdjustedPension then adjustedPensionMinimumDeduction
    else specialMinimumDeduction
  else
    baseMinimumDeduction

-- ==== verified facts about the model (model consistency only) ====

theorem baseMinimumDeduction_pos : 0 < baseMinimumDeduction := by
  decide

theorem specialMinimumDeduction_pos : 0 < specialMinimumDeduction := by
  decide

theorem adjustedPensionMinimumDeduction_pos : 0 < adjustedPensionMinimumDeduction := by
  decide

example : baseMinimumDeduction = 1_180_000 := by decide
example : specialMinimumDeduction = 1_680_000 := by decide
example : adjustedPensionMinimumDeduction = 900_000 := by decide

/-- 原文の数的関係: 九十万円 < 百十八万円 < 百六十八万円。 -/
theorem adjusted_lt_base : adjustedPensionMinimumDeduction < baseMinimumDeduction := by
  decide

theorem adjusted_lt_special : adjustedPensionMinimumDeduction < specialMinimumDeduction := by
  decide

theorem base_lt_special : baseMinimumDeduction < specialMinimumDeduction := by
  decide

/-- 各 Bool 組合せの選択値（分岐は rfl で確定）。 -/
theorem minimumDeduction_false_false :
    minimumDeduction false false = baseMinimumDeduction := rfl

theorem minimumDeduction_false_true :
    minimumDeduction false true = baseMinimumDeduction := rfl

theorem minimumDeduction_true_false :
    minimumDeduction true false = specialMinimumDeduction := rfl

theorem minimumDeduction_true_true :
    minimumDeduction true true = adjustedPensionMinimumDeduction := rfl

/-- 選択される値は必ず 3 定数のいずれか。 -/
theorem minimumDeduction_is_one_of (a p : Bool) :
    minimumDeduction a p = baseMinimumDeduction ∨
    minimumDeduction a p = specialMinimumDeduction ∨
    minimumDeduction a p = adjustedPensionMinimumDeduction := by
  cases a <;> cases p <;> simp [minimumDeduction]

/-- 選択される最低控除額は常に正。 -/
theorem minimumDeduction_pos (a p : Bool) : 0 < minimumDeduction a p := by
  cases a <;> cases p <;> decide

/-- 選択値は 3 定数の最大値「百六十八万円」以下。 -/
theorem minimumDeduction_le_special (a p : Bool) :
    minimumDeduction a p ≤ specialMinimumDeduction := by
  cases a <;> cases p <;> decide

/-- 選択値は 3 定数の最小値「九十万円」以上。 -/
theorem adjusted_le_minimumDeduction (a p : Bool) :
    adjustedPensionMinimumDeduction ≤ minimumDeduction a p := by
  cases a <;> cases p <;> decide

-- ==== kernel-decided smoke checks (all 4 Bool combinations) ====

example : minimumDeduction false false = 1_180_000 := by decide
example : minimumDeduction false true = 1_180_000 := by decide
example : minimumDeduction true false = 1_680_000 := by decide
example : minimumDeduction true true = 900_000 := by decide

end JapanTaxLaw.SpecialOrderPensionMinimum

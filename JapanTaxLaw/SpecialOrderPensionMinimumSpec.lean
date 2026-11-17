import JapanTaxLaw.SpecialOrderPensionMinimum

/-!
# SpecialOrderPensionMinimum spec — 租税特別措置法施行令 第二十六条の二十七

Source (pinned; identical to SpecialOrderPensionMinimum.lean):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

Independent restatement of the read-replace money constants of 第二十六条の二十七
（原文は impl の doc-comment に一字も誤らず転記）:

  「同条中「百十八万円」とあるのは、「百六十八万円（同条に規定する公的年金等が
    第三百十九条の六第一項各号又は第二項第一号（公的年金等の金額から控除する金額の
    調整等）に掲げるものである場合にあつては、九十万円）」とする。」

Independence of the formulation:

  * impl が `if` で 3 定数を選ぶのに対し、spec は `match` で選択する。
  * spec 側の定数は実装定数を参照せず、原文の日本語リテラル
    「百十八万円 = 118 × 10000」「百六十八万円 = 168 × 10000」
    「九十万円 = 90 × 10000」から独立に置く。
  * 双方は `agreePensionMinimumDeduction`（4 通りの Bool 組合せの `==` 一致、
    `by decide`）でのみ接続する。これは法的意味の等価証明ではなく、
    モデル同士の有限点 spot-check にすぎない。

Scope boundaries identical to the implementation. 年齢区分・年金種別・基準日
（その年十二月三十一日）・居住者性・公的年金等の金額・該当性はすべて caller-established。
Bool は金額の算術に入れず定数の選択にのみ使う。339条の12 / 339条の6 の具体的算定は
NOT MODELLED。
-/

namespace JapanTaxLaw.SpecialOrderPensionMinimum

open JapanTaxLaw.TaxFinance

/-- Spec: 基底「百十八万円」= 118 × 10000（原文リテラルから独立に置く）。 -/
def specBaseMinimumDeduction : Money := 118 * 10000

/-- Spec: 読み替え「百六十八万円」= 168 × 10000。 -/
def specSpecialMinimumDeduction : Money := 168 * 10000

/-- Spec: 括弧書「九十万円」= 90 × 10000。 -/
def specAdjustedPensionMinimumDeduction : Money := 90 * 10000

example : specBaseMinimumDeduction = baseMinimumDeduction := by decide
example : specSpecialMinimumDeduction = specialMinimumDeduction := by decide
example : specAdjustedPensionMinimumDeduction = adjustedPensionMinimumDeduction := by decide

/-- Spec: 独立定式。impl が `if` を使うのに対し spec は `match` で選択する。 -/
def specMinimumDeduction (isAge65OrOlder : Bool) (isAdjustedPension : Bool) : Money :=
  match isAge65OrOlder with
  | false => specBaseMinimumDeduction
  | true =>
      match isAdjustedPension with
      | false => specSpecialMinimumDeduction
      | true => specAdjustedPensionMinimumDeduction

-- ==== points (kernel-decided) ====

example : specMinimumDeduction false false = 1_180_000 := by decide
example : specMinimumDeduction false true = 1_180_000 := by decide
example : specMinimumDeduction true false = 1_680_000 := by decide
example : specMinimumDeduction true true = 900_000 := by decide

/-- Spot-check: implementation agrees with the independent spec on all 4 Bool
     combinations. Points are sample points, not a proof of universal equivalence. -/
def agreePensionMinimumDeduction : Bool :=
  let samples : List (Bool × Bool) :=
    [(false, false), (false, true), (true, false), (true, true)]
  samples.all fun ap =>
    minimumDeduction ap.1 ap.2 == specMinimumDeduction ap.1 ap.2

example : agreePensionMinimumDeduction = true := by decide

end JapanTaxLaw.SpecialOrderPensionMinimum

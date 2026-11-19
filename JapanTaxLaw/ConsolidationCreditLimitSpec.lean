import JapanTaxLaw.ConsolidationCreditLimit

/-!
# ConsolidationCreditLimit spec — 法人税法施行令 art.148 の独立整数定式

Sources (pinned; identical to ConsolidationCreditLimit.lean):

  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121
  Raw snapshot: data/raw/340CO0000000097_20261001_507CO0000000121.law.json
  Article Num 148, flat/normalized leaf text 3094 chars, U+3000 count 0.

Independent restatement of:

  * art.148(2) — 調整前控除限度額 = 第一号 + (第二号 × 第三号) / 第二号。
    第二号 ≠ 0 なら閉じた形 `第一号 + 第三号` に等しい（乗算先行のため端数なし）。
    分母 0 は安全版として 0。
  * art.148(1) — 控除限度額 = max(調整前控除限度額 − 控除限度調整額, 0)。
    saturating 減算を `if` で明示。

Spec は impl の def を参照せず、原文から直接書いた整数式のみを使う。
Scope boundaries identical to the implementation（各号の具体的算定・§3 以降は NOT MODELLED）。
-/

namespace JapanTaxLaw.ConsolidationCreditLimit

/-- Spec §2: 調整前控除限度額の閉じた形。第二号 0 は安全版で 0、
    第二号 ≠ 0 なら `firstAmount + thirdAmount`（割合按分の代数単純化）。 -/
def specPreAdjustmentLimit (firstAmount secondAmount thirdAmount : Nat) : Nat :=
  if secondAmount = 0 then 0 else firstAmount + thirdAmount

/-- Spec §1: saturating 減算。impl の分岐条件 `p ≤ a` を反転表現 `a < p` で書く。 -/
def specConsolidationCreditLimit (preAdjustment adjustment : Nat) : Nat :=
  if adjustment < preAdjustment then preAdjustment - adjustment else 0

-- ==== spec smoke (kernel-decided) ====

example : specPreAdjustmentLimit 100 200 50 = 150 := by decide
example : specPreAdjustmentLimit 100 0 50 = 0 := by decide
example : specPreAdjustmentLimit 0 200 50 = 50 := by decide
example : specPreAdjustmentLimit 100 200 0 = 100 := by decide
example : specPreAdjustmentLimit 100 3 1 = 101 := by decide
example : specConsolidationCreditLimit 500 120 = 380 := by decide
example : specConsolidationCreditLimit 500 500 = 0 := by decide
example : specConsolidationCreditLimit 500 501 = 0 := by decide
example : specConsolidationCreditLimit 0 100 = 0 := by decide

/-- Agreement checks between implementation and Spec（定数値の `==` 一致確認であり、
    法的意味の等価証明ではない。有限グリッド、by decide）。 -/
def agreeConsolidationCreditLimit : Bool :=
  [ (100, 200, 50), (100, 0, 50), (0, 200, 50), (100, 200, 0),
    (100, 3, 1), (250, 7, 2), (1_000_000, 90_000, 12_345),
    (0, 0, 0), (7, 1, 9) ].all fun (f, s, t) =>
    preAdjustmentLimit f s t == specPreAdjustmentLimit f s t
  && [ (500, 120), (500, 500), (500, 501), (0, 100),
       (0, 0), (1, 0), (10, 9), (123_456, 65_432) ].all fun (p, a) =>
    consolidationCreditLimit p a == specConsolidationCreditLimit p a

example : agreeConsolidationCreditLimit = true := by decide

end JapanTaxLaw.ConsolidationCreditLimit

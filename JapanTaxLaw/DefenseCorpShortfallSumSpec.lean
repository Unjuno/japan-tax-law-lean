import JapanTaxLaw.DefenseCorpShortfallSum

/-
# DefenseCorpShortfallSumSpec — 政令第三条 第六項 第一号 の独立定式

Pinned: law 507CO0000000134, revision 507CO0000000134_20260401_508CO0000000105,
Article 3 Paragraph 6 Item 1; needle 「…調整前控除限度額が零を下回る場合…」.

Independent restatement: only strictly negative balances contribute their
magnitude; zero and positive balances contribute zero. Definitions below use
their own identifiers, no implementation constants; bridges are separate.
-/

namespace JapanTaxLaw.DefenseCorpShortfallSum

/-- 独立定式: 原文の zero floor は 0。 -/
def specZero : Int := 0

/-- 独立定式: 零未満だけ絶対値を寄与。impl 識別子は使わない。 -/
def specShortfall (b : Int) : Nat :=
  if b < specZero then Int.toNat (-b) else 0

/-- 独立定式: 有限リスト上の合計。 -/
def specSum : List Int → Nat
  | [] => 0
  | x :: xs => specShortfall x + specSum xs

theorem agreeZero : statutoryFloor = specZero := by
  unfold statutoryFloor specZero
  rfl

theorem agreeShortfall (b : Int) : shortfall b = specShortfall b := by
  unfold shortfall specShortfall
  rw [agreeZero]

theorem agreeSum (bs : List Int) : shortfallSum bs = specSum bs := by
  induction bs with
  | nil => rfl
  | cons b bs ih =>
      unfold shortfallSum specSum
      rw [agreeShortfall, ih]

example : specSum [-1, 0, 2, -3] = 4 := by decide
example : specShortfall 0 = 0 := by decide

end JapanTaxLaw.DefenseCorpShortfallSum

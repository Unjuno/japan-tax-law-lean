import JapanTaxLaw.OneYearConstructionStartWindow

/-
# OneYearConstructionStartWindowSpec — 半島振興法施行令 4(1)(2) の独立定式

Pinned: law 407M50000008012, revision 407M50000008012_20050401_417M60000008064,
Article 4 Paragraph 1 Item 2; needle 「…取得の日の翌日から起算して一年以内に…」.

Independent restatement: land qualifies when acquired on/after certification,
construction starts strictly after acquisition, and the start is within one
year of acquisition. Definitions use their own numerals and no implementation
identifiers; the agreement theorem is a separate bridge.
-/

namespace JapanTaxLaw.OneYearConstructionStartWindow

/-- 独立定式: 一年 = 1（caller が日数に変換）。 -/
def specYearCount : Nat := 1

/-- 独立定式: r <= a ∧ a < s ∧ s <= a + d。 -/
def specEligibleLand (r a s d : Nat) : Bool :=
  r <= a && a < s && s <= a + d

theorem agreeYearCount : yearCount = specYearCount := by
  unfold yearCount specYearCount
  rfl

theorem agreeEligibleLand (r a s d : Nat) :
    eligibleLand r a s d = specEligibleLand r a s d := by
  unfold eligibleLand specEligibleLand
  rfl

example : specEligibleLand 0 10 11 365 = true := by decide
example : specEligibleLand 0 10 376 365 = false := by decide

end JapanTaxLaw.OneYearConstructionStartWindow

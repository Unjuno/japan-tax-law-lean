import JapanTaxLaw.PeninsulaSpecialDepreciationCostFloor5M

/-
# PeninsulaSpecialDepreciationCostFloor5MSpec — 半島振興省令 1(1)(1)ロ の独立定式

Pinned: law 407M50000008016, revision 407M50000008016_20250401_507M60000008028,
Article 1; needle 「五百万円以上のもの」.

Independent restatement: the acquisition cost must be at least five million yen.
Definitions below use their own numerals and no implementation identifiers;
the agreement theorem is a separate bridge.
-/

namespace JapanTaxLaw.PeninsulaSpecialDepreciationCostFloor5M

/-- 独立定式: 五百万円 = 5,000,000。 -/
def specFloor : Nat := 5_000_000

/-- 独立定式: 取得価額が下限以上か（以上は inclusive）。 -/
def specEligible (cost : Nat) : Bool :=
  specFloor <= cost

theorem agreeFloor : floorYen = specFloor := by
  unfold floorYen specFloor
  rfl

theorem agreeEligible (cost : Nat) :
    eligible cost = specEligible cost := by
  unfold eligible specEligible
  rw [agreeFloor]

example : specEligible 4_999_999 = false := by decide
example : specEligible 5_000_000 = true := by decide

end JapanTaxLaw.PeninsulaSpecialDepreciationCostFloor5M

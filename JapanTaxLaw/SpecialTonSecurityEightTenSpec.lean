import JapanTaxLaw.SpecialTonSecurityEightTen

/-
# SpecialTonSecurityEightTenSpec — 特別とん税法施行令 第三条 第一項 の独立定式

Pinned: law 332CO0000000049, revision 332CO0000000049_20201001_502CO0000000128,
Article 3 Paragraph 1, needle 「…とん税額の八分の十に相当する特別とん税額を…」.

Independent restatement: the special tonnage tax is ten eighths (5/4) of the
tonnage tax. The spec below writes its own numerals and the exact times-
denominator form; no implementation identifier is reused. Bridges are separate.
-/

namespace JapanTaxLaw.SpecialTonSecurityEightTen

/-- 独立定式: 八分の十 = 10/8。 -/
def specNum : Nat := 10
def specDen : Nat := 8

/-- 独立定式: 分母倍の金額。impl 識別子は使わない。 -/
def specTimesDen (ton : Nat) : Nat :=
  ton * specNum

theorem agreeNum : rateNumerator = specNum := by
  unfold rateNumerator specNum
  rfl

theorem agreeDen : rateDenominator = specDen := by
  unfold rateDenominator specDen
  rfl

theorem agreeTimesDen (ton : Nat) :
    specialAmountTimesDenominator ton = specTimesDen ton := by
  unfold specialAmountTimesDenominator specTimesDen
  rw [agreeNum]

example : specTimesDen 100 = 1000 := by decide
example : specTimesDen 0 = 0 := by decide

end JapanTaxLaw.SpecialTonSecurityEightTen

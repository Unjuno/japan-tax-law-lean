import JapanTaxLaw.SpecialTaxCreditCap10000

/-
# SpecialTaxCreditCap10000Spec — 附則第五条の十二 第四項 の独立定式

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
Article 5_12 Paragraph 4, needle 「…所得割の額が一万円を超える場合には…」.

Independent restatement: when the income portion strictly exceeds ¥10,000 the
credit is ¥10,000 minus the prefectural credit (signed); otherwise it is the
paragraph-2 item-2 amount. Definitions below use only their own numerals and
no implementation identifiers; agreement theorems are separate bridges.
-/

namespace JapanTaxLaw.SpecialTaxCreditCap10000

/-- 独立定式: 一万円 = 10000。 -/
def specCeiling : Nat := 10000

/-- 独立定式: 分岐と符号付き控除。impl 識別子は使わない。 -/
def specCredit (income : Nat) (pref : Int) (fb : Int) : Int :=
  if specCeiling < income then (specCeiling : Int) - pref else fb

theorem agreeCeiling : ceilingYen = specCeiling := by
  unfold ceilingYen specCeiling
  rfl

theorem agreeCredit (income : Nat) (pref fb : Int) :
    specialCredit income pref fb = specCredit income pref fb := by
  unfold specialCredit specCredit
  rw [agreeCeiling]

example : specCredit 10000 100 7 = 7 := by decide
example : specCredit 10001 100 7 = 9900 := by decide
example : specCredit 10001 12000 7 = -2000 := by decide

end JapanTaxLaw.SpecialTaxCreditCap10000

import JapanTaxLaw.CorporateSpecialTaxBase

/-!
# CorporateSpecialTaxBase spec — 法人特別税法 art.9 の独立整数定式

Sources (pinned; identical to CorporateSpecialTaxBase.lean):
  Law id: 404AC0000000015, Revision: 404AC0000000015_20010401_413AC0000000006.
  Article Num 9.

Independent integer restatement (coordinator の数式は信じず原文から直接):
  * 課税標準 = 課税標準法人税額。
  * 課税標準法人税額 = 基準法人税額 − 年四百万円（saturating）。
  * 一年未満: 控除額 = 四百万円÷12×月数（除算先行・切り捨て）。

Spec は impl の def を参照せず、原文から直接書いた整数式のみを使う。
-/

namespace JapanTaxLaw.CorporateSpecialTaxBase

def specAnnualDeduction : Nat := 4_000_000
def specStandard (base : Nat) : Nat := base - specAnnualDeduction
def specPartialDeduction (months : Nat) : Nat := (specAnnualDeduction / 12) * months
def specPartial (base months : Nat) : Nat := base - specPartialDeduction months

example : specStandard 10_000_000 = 6_000_000 := by decide
example : specStandard 3_000_000 = 0 := by decide
example : specPartialDeduction 6 = 1_999_998 := by decide
example : specPartial 10_000_000 6 = 8_000_002 := by decide

def agreeCorporateSpecialTaxBase : Bool :=
  [0, 1, 3_000_000, 4_000_000, 10_000_000, 999_999_999].all fun b =>
    standardTaxBase b == specStandard b
  && [1, 6, 12, 13].all fun m =>
    partialDeduction m == specPartialDeduction m
    && partialTaxBase 10_000_000 m == specPartial 10_000_000 m

example : agreeCorporateSpecialTaxBase = true := by decide

end JapanTaxLaw.CorporateSpecialTaxBase

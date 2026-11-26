import JapanTaxLaw.TaxFinance

/-!
# TariffDifferential — 13 の 従価従量差額 規定

Pinned 関税定率法 rows state: 「課税価格が一キログラムにつき四八五円を超え
五〇〇円以下のもの…課税価格と五〇〇円との差額」. Within the band the price is
at most the ceiling, so the differential duty is `ceiling - price`. `price` and
the band's ceiling are caller-established; Nat subtraction clamps at zero.
Not legal advice.
-/

namespace JapanTaxLaw.TariffDifferential

def differential (price ceiling : Nat) : Nat :=
  if price ≤ ceiling then ceiling - price else 0

example : differential 485 500 = 15 := by decide
example : differential 500 500 = 0 := by decide
example : differential 501 500 = 0 := by decide

end JapanTaxLaw.TariffDifferential

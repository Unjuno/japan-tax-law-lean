import JapanTaxLaw.TaxFinance
/- RegTax41_19_3IndividualIncomeOver10M — 「ただし、当該個人のその年分の所得税に係る合計所得金額が千万円を超える場合には、この限りでない。」
Pinned: revision 332AC0000000026_20261101_507AC0000000013, article 41_19_3; unit NORM|c12f3953d4c85be4be5034ac1d384aea93cfb6c5d70eb855904518551f6d0429.
原文逐語: 「ただし、当該個人のその年分の所得税に係る合計所得金額が千万円を超える場合には、この限りでない。」
Scope: ONLY the strict 10M income trigger. The exception's effect and the
base rule are NOT MODELLED. No sorry/admit/Classical.choice. -/
namespace JapanTaxLaw.RegTax41_19_3IndividualIncomeOver10M
open JapanTaxLaw.TaxFinance
/-- 千万 — strict trigger. -/
def threshold : Money := 10_000_000
/-- 「ただし、当該個人のその年分の所得税に係る合計所得金額が千万円を超える場合には、この限りでない。」. -/
def inScope (a : Money) : Prop := threshold < a
def inScopeBool (amount : Money) : Bool := decide (10_000_000 < amount)
end JapanTaxLaw.RegTax41_19_3IndividualIncomeOver10M

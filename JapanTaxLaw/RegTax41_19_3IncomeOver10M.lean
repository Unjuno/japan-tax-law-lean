import JapanTaxLaw.TaxFinance
/- RegTax41_19_3IncomeOver10M — 「ただし、当該特定個人のその年分の所得税に係る合計所得金額が千万円を超える場合には、この限りでない。」
Pinned: revision 332AC0000000026_20261101_507AC0000000013, article 41_19_3; unit NORM|dc2ead3a9d4f57a50d2844f6ad20e035611cec7516ecd760a5b00ba0c3234272.
原文逐語: 「ただし、当該特定個人のその年分の所得税に係る合計所得金額が千万円を超える場合には、この限りでない。」
Scope: ONLY the ceiling/trigger interval of this exception clause. The
underlying procedure, exceptions' legal effects and other articles are NOT
MODELLED. No sorry/admit/Classical.choice. -/
namespace JapanTaxLaw.RegTax41_19_3IncomeOver10M
open JapanTaxLaw.TaxFinance
/-- 千万 — strict trigger (を超え). -/
def threshold : Money := 10_000_000

/-- 「ただし、当該特定個人のその年分の所得税に係る合計所得金額が千万円を超える場合には、この限りでない。」. -/
def inScope (a : Money) : Prop := threshold < a


def inScopeBool (amount : Money) : Bool := decide (10_000_000 < amount)
end JapanTaxLaw.RegTax41_19_3IncomeOver10M

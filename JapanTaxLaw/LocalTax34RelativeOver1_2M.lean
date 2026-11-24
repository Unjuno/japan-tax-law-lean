import JapanTaxLaw.TaxFinance
/- LocalTax34RelativeOver1_2M — 「前年の合計所得金額が百二十万円を超える特定親族」
Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34; unit NORM|57cd4b744e4fc3c25bc2762d40aaf803b14eb4e694033819ccd5880a5a204d63.
原文逐語: 「前年の合計所得金額が百二十万円を超える特定親族」
Scope: ONLY the threshold/tier; rates, other tiers and other articles NOT MODELLED.
No sorry/admit/Classical.choice. -/
namespace JapanTaxLaw.LocalTax34RelativeOver1_2M
open JapanTaxLaw.TaxFinance
/-- 百二十万 — strict lower (を超え/以上). -/
def threshold : Money := 1_200_000

/-- 「前年の合計所得金額が百二十万円を超える特定親族」. -/
def inScope (a : Money) : Prop := threshold < a


def inScopeBool (amount : Money) : Bool := decide (1_200_000 < amount)
end JapanTaxLaw.LocalTax34RelativeOver1_2M

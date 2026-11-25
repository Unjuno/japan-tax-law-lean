import JapanTaxLaw.TaxFinance
/- LocalTax15PeriodCeiling2Years — 「ただし、その期間は、既にその者につき徴収の猶予をした期間と合わせて二年を超えることができない。」
Pinned: revision 325AC0000000226_20261101_508AC0000000002, article 15; unit NORM|a645e7a0ce1b01d38a43e33963dc35966971411db018d81d64ed0d099332ad2b.
原文逐語: 「ただし、その期間は、既にその者につき徴収の猶予をした期間と合わせて二年を超えることができない。」
Scope: ONLY the ceiling/trigger interval of this exception clause. The
underlying procedure, exceptions' legal effects and other articles are NOT
MODELLED. No sorry/admit/Classical.choice. -/
namespace JapanTaxLaw.LocalTax15PeriodCeiling2Years
open JapanTaxLaw.TaxFinance
/-- 二 — inclusive ceiling. -/
def ceiling : Money := 2

/-- 「ただし、その期間は、既にその者につき徴収の猶予をした期間と合わせて二年を超えることができない。」. -/
def inScope (a : Money) : Prop := a ≤ ceiling


def inScopeBool (amount : Money) : Bool := decide (amount ≤ 2)
end JapanTaxLaw.LocalTax15PeriodCeiling2Years

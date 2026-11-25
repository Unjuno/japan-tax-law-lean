import JapanTaxLaw.TaxFinance
/- Customs123PeriodCeiling60Days — 「ただし、消去しないよう求める期間は、通じて六十日を超えることができない。」
Pinned: revision 329AC0000000061_20261101_507AC0000000064, article 123; unit NORM|ad89049f53b3ed5b486cc696d95a0200fe3a28ae8859d195de653f60468c2e40.
原文逐語: 「ただし、消去しないよう求める期間は、通じて六十日を超えることができない。」
Scope: ONLY the ceiling/trigger interval of this exception clause. The
underlying procedure, exceptions' legal effects and other articles are NOT
MODELLED. No sorry/admit/Classical.choice. -/
namespace JapanTaxLaw.Customs123PeriodCeiling60Days
open JapanTaxLaw.TaxFinance
/-- 六十 — inclusive ceiling. -/
def ceiling : Money := 60

/-- 「ただし、消去しないよう求める期間は、通じて六十日を超えることができない。」. -/
def inScope (a : Money) : Prop := a ≤ ceiling


def inScopeBool (amount : Money) : Bool := decide (amount ≤ 60)
end JapanTaxLaw.Customs123PeriodCeiling60Days

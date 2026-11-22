import JapanTaxLaw.TaxFinance

/-!
# ShortMeasure180Days — 関税定率法 art. 9（短期の措置 百八十日以内）

Sources (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json

Pinned 原文: 「ただし、とろうとする措置が百八十日以内の期間でとられるもの（以下この項において「短期の措置」という。）であつて、かつ、次の各号のいずれにも該当する場合は、この限りでない。」

Scoped claim: only the 短期の措置 百八十日以内 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.ShortMeasure180Days

def shortMeasureDays : Nat := 180

def withinShortMeasure (x : Nat) : Bool :=
  decide (x <= shortMeasureDays)

theorem threshold_value : shortMeasureDays = 180 := rfl

end JapanTaxLaw.ShortMeasure180Days

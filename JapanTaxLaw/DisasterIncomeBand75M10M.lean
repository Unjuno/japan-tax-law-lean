import JapanTaxLaw.TaxFinance

/-!
# DisasterIncomeBand75M10M — 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令） art. 3（災害時の合計所得金額の見積額 七百五十万円超千万円以下）

Sources (pinned):

  Law id: 322CO0000000268
  Revision: 322CO0000000268_20251201_507CO0000000120
  Raw snapshot: data/raw/322CO0000000268_20251201_507CO0000000120.law.json

Pinned 原文: 「災害時の合計所得金額の見積額が七百五十万円を超え千万円以下である報酬等の支払を受ける者」

Scoped claim: only the 災害時の合計所得金額の見積額 七百五十万円超千万円以下 interval; other conditions are caller-established.
-/

namespace JapanTaxLaw.DisasterIncomeBand75M10M

def lowerBound : Nat := 7500000
def upperBound : Nat := 10000000

def inBand (x : Nat) : Bool :=
  decide (lowerBound < x ∧ x <= upperBound)

theorem threshold_value : lowerBound = 7500000 ∧ upperBound = 10000000 := by
  constructor <;> rfl

end JapanTaxLaw.DisasterIncomeBand75M10M

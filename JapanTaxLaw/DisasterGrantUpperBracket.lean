import JapanTaxLaw.TaxFinance

/-!
# DisasterGrantUpperBracket — 災害被害者租税減免等施行令 附則第三条(5)第二号（七百五十万円超千万円以下）

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令）
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Revision: 322CO0000000268_20251201_507CO0000000120
  Raw snapshot: data/raw/322CO0000000268_20251201_507CO0000000120.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|288a1bc7b19ce5647fb2a5ace0f95f551be31c84058775e6ba7d297c6761a96a
  Source path: LawBody[40]/SupplProvision/SupplProvision[3]/Article:3/Article#3/
               Paragraph#5/Item#2/ItemSentence/Column#1/Sentence#1
  Statutory article: 附則第三条(5)第二号 — 七百五十万円超千万円以下の被災給与所得者等

原文逐語（pinned, 一字一句改変なし）:
  「災害時の合計所得金額の見積額が七百五十万円を超え千万円以下である被災給与所得者等」

Variable contract:
  `lowerBoundYen : Money := 7_500_000` = 七百五十万円 (exclusive lower bound: 超え).
  `upperBoundYen : Money := 10_000_000` = 千万円 (inclusive upper bound: 以下).
  `inBracket x := lowerBoundYen < x ∧ x ≤ upperBoundYen`.
  Unit 円; domain Nat. 「超え」 = strict >; 「以下」 = ≤.

Scope: only this income interval of the 被災給与所得者等 classification.
The substantive 災害被害者租税減免法, the tax benefit it gates, the other items of
the definition, 「災害時」 timing, other paragraphs and 省令 details are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterGrantUpperBracket

open JapanTaxLaw.TaxFinance

/-- 七百五十万円 — exclusive lower bound (超え). Unit 円; domain Nat. -/
def lowerBoundYen : Money := 7_500_000

/-- 千万円 — inclusive upper bound (以下). Unit 円; domain Nat. -/
def upperBoundYen : Money := 10_000_000

/-- 「七百五十万円を超え千万円以下」: strict lower, inclusive upper. -/
def inBracket (estimatedIncome : Money) : Prop :=
  lowerBoundYen < estimatedIncome ∧ estimatedIncome ≤ upperBoundYen

end JapanTaxLaw.DisasterGrantUpperBracket

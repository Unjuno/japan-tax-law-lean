import JapanTaxLaw.TaxFinance

/-!
# DisasterVictimIncomeBracket — 災害被害者租税減免等施行令 第三条 附則（四百五十万円超六百万円以下）

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、
    徴税猶予等に関する法律の施行に関する政令） — 災害被害者租税減免等施行令
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Revision: 322CO0000000268_20251201_507CO0000000120
  Raw snapshot: data/raw/322CO0000000268_20251201_507CO0000000120.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|8746221ba19978635b4364ecd7d12d09b01c13aea26958c14ab66b4f027ec141
  Source path: LawBody[32]/SupplProvision/SupplProvision[3]/Article:3/Article#3/
               Paragraph#5/Item#2/ItemSentence/Column#1/Sentence#1
  Statutory article: 附則第三条 — 災害時の合計所得金額の見積額が
    四百五十万円を超え六百万円以下である被災給与所得者

原文逐語（pinned, 一字一句改変なし）:
  「災害時の合計所得金額の見積額が四百五十万円を超え六百万円以下である被災給与所得者」

Variable contract:
  `lowerBoundYen : Money := 4_500_000` = 四百五十万円 (exclusive lower bound: 超え).
  `upperBoundYen : Money := 6_000_000` = 六百万円 (inclusive upper bound: 以下).
  `inBracket estimatedIncome := lowerBoundYen < estimatedIncome ∧ estimatedIncome ≤ upperBoundYen`.
  Unit 円; domain Nat (whole yen). 「超え」 = strict >; 「以下」 = ≤.

Scope: only this income interval of the 被災給与所得者 classification. The
substantive 災害被害者租税減免法, the tax benefit it gates, the other items of
the definition, 「災害時」 timing, other paragraphs and 省令 details are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterVictimIncomeBracket

open JapanTaxLaw.TaxFinance

/-- 四百五十万円 — exclusive lower bound (超え). Unit 円; domain Nat. -/
def lowerBoundYen : Money := 4_500_000

/-- 六百万円 — inclusive upper bound (以下). Unit 円; domain Nat. -/
def upperBoundYen : Money := 6_000_000

/-- 「四百五十万円を超え六百万円以下」: strict lower, inclusive upper. -/
def inBracket (estimatedIncome : Money) : Prop :=
  lowerBoundYen < estimatedIncome ∧ estimatedIncome ≤ upperBoundYen

end JapanTaxLaw.DisasterVictimIncomeBracket

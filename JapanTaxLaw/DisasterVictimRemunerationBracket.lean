import JapanTaxLaw.TaxFinance

/-!
# DisasterVictimRemunerationBracket — 災害被害者租税減免等施行令 附則第三条(5)第三号（四百万円超四百五十万円以下）

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、
    徴収猶予等に関する法律の施行に関する政令） — 災害被害者租税減免等施行令
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Revision: 322CO0000000268_20251201_507CO0000000120
  Raw snapshot: data/raw/322CO0000000268_20251201_507CO0000000120.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|8fb64d19e0267aac50775840f08f843558b85e1e81cef3bd11e4d9ce19aece9e
  Source path: LawBody[32]/SupplProvision/SupplProvision[3]/Article:3/Article#3/
               Paragraph#5/Item#3/ItemSentence/Column#1/Sentence#1
  Statutory article: 附則第三条(5)第三号 — 災害時の合計所得金額の見積額が
    四百万円を超え四百五十万円以下である報酬等の支払を受ける者

原文逐語（pinned, 一字一句改変なし）:
  「災害時の合計所得金額の見積額が四百万円を超え四百五十万円以下である報酬等の支払を受ける者」

Variable contract:
  `lowerBoundYen : Money := 4_000_000` = 四百万円 (exclusive lower bound: 超え).
  `upperBoundYen : Money := 4_500_000` = 四百五十万円 (inclusive upper bound: 以下).
  `inBracket estimatedIncome := lowerBoundYen < estimatedIncome ∧ estimatedIncome ≤ upperBoundYen`.
  Unit 円; domain Nat (whole yen). 「超え」 = strict >; 「以下」 = ≤.

Scope: only this income interval of the 報酬等の支払を受ける者 classification.
The substantive 災害被害者租税減免法, the tax benefit it gates, the other items of
the definition, 「災害時」 timing, other paragraphs and 省令 details are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterVictimRemunerationBracket

open JapanTaxLaw.TaxFinance

/-- 四百万円 — exclusive lower bound (超え). Unit 円; domain Nat. -/
def lowerBoundYen : Money := 4_000_000

/-- 四百五十万円 — inclusive upper bound (以下). Unit 円; domain Nat. -/
def upperBoundYen : Money := 4_500_000

/-- 「四百万円を超え四百五十万円以下」: strict lower, inclusive upper. -/
def inBracket (estimatedIncome : Money) : Prop :=
  lowerBoundYen < estimatedIncome ∧ estimatedIncome ≤ upperBoundYen

end JapanTaxLaw.DisasterVictimRemunerationBracket

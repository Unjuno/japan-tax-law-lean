import JapanTaxLaw.TaxFinance

/-!
# InheritanceRegPrescribedAmount — 相続税法施行規則 art.30（百万円）

Pinned source:
  Law id: 325M50000040017
  Law number: 昭和二十五年大蔵省令第十七号
  Revision: 325M50000040017_20260901_506M60000040016
  Raw snapshot: data/raw/325M50000040017_20260901_506M60000040016.law.json
  sha256: a4e46e6eba52b6f8a47365590d34aff35e9eeea4bbc7186ecdace837e35b552f
  Normative unit id: NORM|6b83a747a7e86cb520e53a9ba162dd0beda902d06616239281a19e2cb5460f75
  Source path: LawBody[2]/MainProvision/MainProvision[44]/Article:30/Article#30/
               Paragraph#3/ParagraphSentence/Sentence#1
  Statutory article: art.30(3) — 相続税法59条1項ただし書の財務省令で定める額

Law identity verified: INVENTORY official_title = 相続税法施行規則;
raw JSON law_title = 相続税法施行規則 (both checked, guarding against the
earlier wrong-law findings on other units).

原文逐語（pinned, 一字一句改変なし）:
  「法第五十九条第一項ただし書に規定する財務省令で定める額は、百万円とする。」

Variable contract:
  `prescribedAmountYen : Money := 1_000_000` = 百万円. The clause fixes the
  amount "prescribed by Ministry of Finance ordinance" under the proviso of
  相続税法 art.59(1) to exactly ¥1,000,000. `isPrescribedAmount a := a = 1_000_000`
  is the corresponding equality predicate. Unit 円; domain Nat.

Scope: only this delegated amount. The substantive content of 相続税法 art.59(1)
(proviso), the conditions under which the amount applies, other paragraphs and
政令 details are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceRegPrescribedAmount

open JapanTaxLaw.TaxFinance

/-- 百万円. Unit 円; domain Nat. -/
def prescribedAmountYen : Money := 1_000_000

/-- 「財務省令で定める額は、百万円とする」: the prescribed amount is exactly ¥1M. -/
def isPrescribedAmount (amount : Money) : Prop :=
  amount = prescribedAmountYen

end JapanTaxLaw.InheritanceRegPrescribedAmount

import JapanTaxLaw.TaxFinance

/-!
# CustomsInvestigationDeadline — 関税定率法 art.8(2)（調査終了期限）

Pinned source:
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|4034ae765e5c94d4bbd4588b6536d08053f9a82d48e12c78330531a3d78aa234
  Source path: LawBody[1]/MainProvision/MainProvision[18]/Article:8_2/Article#8_2/
               Paragraph#8/ParagraphSentence/Sentence#1
  Statutory article: art. 8(2) paragraph 8 (EFFECT / temporal deadline)

原文逐語（pinned, 一字一句改変なし）:
  「前項の調査は、第四項の調査が終了する日までに終了するものとする。」

Variable contract:
  `endDay : Nat` = 前項の調査が終了する日 (day index).
  `refDay : Nat` = 第四項の調査が終了する日 (day index).
  Both are day indices measured from a common origin; unit 日 (day); domain Nat.
  Result: the temporal-deadline proposition "前項の調査 must finish by the day
  第四項の調査 finishes" = `endDay ≤ refDay`.

Scope: only the temporal ordering of the two investigation-end days. The
investigation procedure, the substantive anti-dumping-duty rules of art.8(2),
the other paragraphs and the 政令 details are NOT MODELLED. This is a
computable slice of one norm unit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsInvestigationDeadline

/-- 「前項の調査が終了する日までに終了する」= endDay ≤ refDay. Unit 日; domain Nat. -/
def withinInvestigationDeadline (endDay refDay : Nat) : Prop :=
  endDay ≤ refDay

end JapanTaxLaw.CustomsInvestigationDeadline

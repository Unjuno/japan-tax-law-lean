import JapanTaxLaw.TaxFinance

/-
# QuotaApplicationCopyCountOne — とうもろこし等の関税割当制度に関する省令 第一条（提出部数は一通）

Pinned source:
  Law id: 340M50010000013
  Official title: とうもろこし等の関税割当制度に関する省令
  Law type: MinisterialOrdinance (省令)
  Revision: 340M50010000013_20220401_504M60000200005
  Raw snapshot: data/raw/340M50010000013_20220401_504M60000200005.law.json
  sha256: bffc3255bd51f8e34dc4ca4463aa05bb6e75d9c174f5f644208df706820a2ba3
  Statutory article: 第一条 (art. 1), 第一項 (1)
  Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/
               Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit id: NORM|b8a8b36b8a88d17067f380b89d2af71d86e63baac7cdfcd834c96a9bc4344894

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「関税割当制度に関する政令（以下「令」という。）第二条第一項の関税割当申請書の様式は別記様式第一によるものとし、その提出部数は一通とする。」

Variable contract:
  `submissionCopies : Nat := 1` = 一通 (the prescribed number of copies).
  `isPrescribedCopies (n : Nat) : Bool := decide (n == submissionCopies)`.
  Unit 通 (copies); domain Nat.

Scope: ONLY the numeric copy-count requirement is modelled. The prescribed
form (別記様式第一), the application content, other paragraphs and enforcement
rules are NOT MODELLED (caller-established). The source literal 一 is a
structural numeral excluded from the generator's numeric-literal axis; the
verbatim pin and an explicit independent kanji check carry the source audit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.QuotaApplicationCopyCountOne

/-- 一通 — the prescribed number of submitted copies. Unit 通; domain Nat. -/
def submissionCopies : Nat := 1

/-- 「提出部数は一通」: exactly one copy is submitted. -/
def isPrescribedCopies (n : Nat) : Bool :=
  decide (n == submissionCopies)

/-- Exactly one copy qualifies. -/
theorem one_true : isPrescribedCopies 1 = true := by
  unfold isPrescribedCopies submissionCopies
  decide

/-- Zero copies does not qualify. -/
theorem zero_false : isPrescribedCopies 0 = false := by
  unfold isPrescribedCopies submissionCopies
  decide

/-- Two copies do not qualify. -/
theorem two_false : isPrescribedCopies 2 = false := by
  unfold isPrescribedCopies submissionCopies
  decide

end JapanTaxLaw.QuotaApplicationCopyCountOne

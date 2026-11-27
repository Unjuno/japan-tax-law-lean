import JapanTaxLaw.TaxFinance

/-
# EvidenceNonSubmissionException — 相殺関税政令 第七条第四項ただし書（証拠不提出の例外）

Pinned source:
  Law id: 406CO0000000415 (相殺関税に関する政令)
  Revision: 406CO0000000415_20171008_428CO0000000240
  Raw snapshot: data/raw/406CO0000000415_20171008_428CO0000000240.law.json
  Article: 第七条 (art. 7), 第四項, 第二文 (proviso)
  Source path: LawBody[2]/MainProvision/MainProvision[6]/Article:7/Article#7/Paragraph#4/ParagraphSentence/Sentence#2
  Normative unit id: NORM|f7b116e19fbd4c2e1dfb0eafbee2f8a05520b402b210e60c5997abca04d1a524

原文逐語（pinned, verbatim, EXCEPTION）:
  「ただし、当該利害関係者が相当な期間内に当該証拠又は証言を提供しない場合は、この限りでない。」

Variable contract:
  A case kind is a Nat code: 0 = 相当な期間内に証拠又は証言を提供しない場合,
  1 = この限りでない (the main rule's limit does not apply), 2+ = caller-defined
  kinds. `asException` maps 0 to 1 and preserves every other kind.
  Unit: a discrete case tag; domain: Nat.

Scope: ONLY the proviso's exception switch is modelled. The main rule it
qualifies, the identity of the interested party, what counts as a reasonable
period and all other provisions are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.EvidenceNonSubmissionException

/-- 「相当な期間内に証拠又は証言を提供しない場合は、この限りでない」。 -/
def asException : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem non_submission_creates_exception : asException 0 = 1 := rfl

theorem no_exception_unchanged : asException 1 = 1 := rfl

theorem other_unchanged : asException 2 = 2 := rfl

theorem idempotent (c : Nat) : asException (asException c) = asException c := by
  cases c <;> rfl

end JapanTaxLaw.EvidenceNonSubmissionException

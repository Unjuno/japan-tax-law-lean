import JapanTaxLaw.TaxFinance

/-
# MinisterialNecessityException — 関税割当制度政令 第二条第四項ただし書（特に必要な場合の例外）

Pinned source:
  Law id: 336CO0000000153 (関税割当制度に関する政令)
  Revision: 336CO0000000153_20260401_508CO0000000085
  Raw snapshot: data/raw/336CO0000000153_20260401_508CO0000000085.law.json
  Article: 第二条 (art. 2), 第四項, 第二文 (proviso)
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#4/ParagraphSentence/Sentence#2
  Normative unit id: NORM|045b8c69307477e65df2ee80d4b3887e659daa232bf87e787c5475cece2afe69

原文逐語（pinned, verbatim, EXCEPTION）:
  「ただし、農林水産大臣又は経済産業大臣が特に必要があると認めるときは、この限りでない。」

Variable contract:
  A case kind is a Nat code: 0 = 農林水産大臣又は経済産業大臣が特に必要と認める場合,
  1 = この限りでない (the main rule's limit does not apply), 2+ = caller-defined
  kinds. `asException` maps 0 to 1 and preserves every other kind.
  Unit: a discrete case tag; domain: Nat.

Scope: ONLY the proviso's exception switch is modelled. The main rule it
qualifies, the identity/authority of the ministers and all other provisions
are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.MinisterialNecessityException

/-- 「特に必要があると認めるときは、この限りでない」。 -/
def asException : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem necessity_creates_exception : asException 0 = 1 := rfl

theorem no_necessity_unchanged : asException 1 = 1 := rfl

theorem other_unchanged : asException 2 = 2 := rfl

theorem idempotent (c : Nat) : asException (asException c) = asException c := by
  cases c <;> rfl

end JapanTaxLaw.MinisterialNecessityException

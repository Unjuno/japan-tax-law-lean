import JapanTaxLaw.TaxFinance

/-
# ImmediateRetaliationException — 報復関税等政令 第二条第一項ただし書（直ちに措置をとる場合の例外）

Pinned source:
  Law id: 406CO0000000418 (報復関税等に関する政令)
  Revision: 406CO0000000418_20010106_412CO0000000307
  Raw snapshot: data/raw/406CO0000000418_20010106_412CO0000000307.law.json
  Article: 第二条 (art. 2), 第一項, 第二文 (proviso)
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#1/ParagraphSentence/Sentence#2
  Normative unit id: NORM|191808d9f8712d403ee653616a4107f62c451eaae37d90ac990046223bceeca7

原文逐語（pinned, verbatim, EXCEPTION）:
  「ただし、報復関税等に係る措置を直ちにとる必要があると認められる場合は、この限りでない。」

Variable contract:
  A case kind is a Nat code: 0 = 報復関税等の措置を直ちにとる必要があると認められる場合,
  1 = この限りでない (the main rule's limit does not apply), 2+ = caller-defined
  kinds. `asException` maps 0 to 1 and preserves every other kind.
  Unit: a discrete case tag; domain: Nat.

Scope: ONLY the proviso's exception switch is modelled. The main rule it
qualifies, the content of the retaliatory measures and all other provisions
are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.ImmediateRetaliationException

/-- 「措置を直ちにとる必要があると認められる場合は、この限りでない」。 -/
def asException : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem immediate_need_creates_exception : asException 0 = 1 := rfl

theorem no_exception_unchanged : asException 1 = 1 := rfl

theorem other_unchanged : asException 2 = 2 := rfl

theorem idempotent (c : Nat) : asException (asException c) = asException c := by
  cases c <;> rfl

end JapanTaxLaw.ImmediateRetaliationException

import JapanTaxLaw.TaxFinance

/-!
# CustomsReadingSubstitution — 関税定率法 art.7(15)（一年内→一年内において速やかに 読替え）

Pinned source:
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|fc34952b4102c0a6697423e84c629c0eea802fb72c83594cac7374694c7ac66f
  Source path: LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/
               Paragraph#15/ParagraphSentence/Sentence#2
  Statutory article: art. 7(15) sentence 2 (READING / 読み替え)

原文逐語（pinned, 一字一句改変なし）:
  「この場合において、第七項本文中「一年以内に」とあるのは、
   「一年以内において速やかに」と読み替えるものとする。」

Variable contract:
  The rule substitutes the phrase 「一年以内に」 (within one year) with
  「一年以内において速やかに」 (within one year, promptly) in the main text of
  paragraph 7. `DeadlinePhrase` enumerates exactly those two statutory phrases.
  `outerDeadlineMonths` records the one-year (12-month) outer bound shared by
  both phrases; `hasPromptnessReq` records the promptness requirement added by
  the substituted phrase. `List DeadlinePhrase` models the paragraph-7 main
  text. All domains are Nat/Bool/List with explicit units recorded below.

Scope: only the reading substitution of these two phrases, in paragraph 7
MAIN TEXT (本文). The separate 6-month extension proviso 「ただし…六月以内に限り
延長することができる」 is NOT part of the substituted string and is NOT MODELLED;
hence outerDeadlineMonths = 12 is a main-text-only value, NOT the total maximum
investigation period. The triggering condition 「この場合において」, the
substantive investigation rules of art.7, other paragraphs and 政令 details are
likewise NOT MODELLED. This is a computable slice of one norm unit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsReadingSubstitution

/-- The two statutory phrases involved in the 読み替え. -/
inductive DeadlinePhrase where
  | withinOneYear          -- 「一年以内に」 (paragraph 7 original)
  | withinOneYearPromptly  -- 「一年以内において速やかに」 (substituted)
  deriving BEq, DecidableEq

/-- The reading rule: 「一年以内に」 is read as 「一年以内において速やかに」.
    Already-substituted phrases are unchanged (the rule is idempotent). -/
def readingSubstitution (p : DeadlinePhrase) : DeadlinePhrase :=
  match p with
  | DeadlinePhrase.withinOneYear => DeadlinePhrase.withinOneYearPromptly
  | DeadlinePhrase.withinOneYearPromptly => DeadlinePhrase.withinOneYearPromptly

/-- Outer deadline in months. Unit: 月 (months); both phrases carry the
    same one-year (= 12-month) outer bound. -/
def outerDeadlineMonths : DeadlinePhrase -> Nat
  | DeadlinePhrase.withinOneYear => 12
  | DeadlinePhrase.withinOneYearPromptly => 12

/-- Whether the phrase adds a promptness (速やかに) requirement. Unit: Bool. -/
def hasPromptnessReq : DeadlinePhrase -> Bool
  | DeadlinePhrase.withinOneYear => false
  | DeadlinePhrase.withinOneYearPromptly => true

/-- Apply the reading substitution across a text (paragraph-7 main text). -/
def applyReadingToText (text : List DeadlinePhrase) : List DeadlinePhrase :=
  text.map readingSubstitution

end JapanTaxLaw.CustomsReadingSubstitution

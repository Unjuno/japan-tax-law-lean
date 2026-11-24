import JapanTaxLaw.TaxFinance

/-
# PrescribedTimesTwo — 沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する省令 第二十六条(1)
（政令で定める回数は、二回とする）

Pinned source:
  Law id: 347M50000040042
  Official title: 沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する省令
  Law type: MinisterialOrdinance (省令)
  Revision: 347M50000040042_20251231_507M60000040072
  Raw snapshot: data/raw/347M50000040042_20251231_507M60000040072.law.json
  sha256: a403b5c2cb0edd15cd1ad54f18a7a33132c74ac80b7f9afcdce7935b51aaf667
  Statutory article: 第二十六条 (art. 26), 第一項 (1)
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:26/Article#26/
               Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit id: NORM|23f9f0b92275bf292ef67ec9c8960150c623566ad2a5d52ef238574d14da3a25

原文逐語（pinned, 一字一句改変なし, DELEGATION, verbatim-unique in whole law）:
  「令第八十七条第四項に規定する財務省令で定める回数は、二回とする。」

Variable contract:
  `prescribedTimes : Nat := 2` = 二回 (the prescribed number of times).
  `isPrescribedCount (n : Nat) : Bool := decide (n == prescribedTimes)`.
  Unit 回 (times); domain Nat.

Scope: ONLY the explicit numeric count fixed by this delegation is modelled.
The underlying 政令 art.87(4) matter, the procedure the count belongs to, other
articles and enforcement rules are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.PrescribedTimesTwo

/-- 二回 — the prescribed number of times. Unit 回; domain Nat. -/
def prescribedTimes : Nat := 2

/-- 「回数は二回」: the count is exactly two. -/
def isPrescribedCount (n : Nat) : Bool :=
  decide (n == prescribedTimes)

/-- Exactly two qualifies. -/
theorem two_true : isPrescribedCount 2 = true := by
  unfold isPrescribedCount prescribedTimes
  decide

/-- One does not qualify. -/
theorem one_false : isPrescribedCount 1 = false := by
  unfold isPrescribedCount prescribedTimes
  decide

/-- Three does not qualify. -/
theorem three_false : isPrescribedCount 3 = false := by
  unfold isPrescribedCount prescribedTimes
  decide

end JapanTaxLaw.PrescribedTimesTwo

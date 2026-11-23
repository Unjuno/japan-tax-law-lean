import JapanTaxLaw.TaxFinance

/-
# CommitteeTermTwoYears — 国税審議会令 第四条（委員の任期は、二年とする）

Pinned source:
  Law id: 412CO0000000278
  Official title: 国税審議会令
  Law type: CabinetOrder (政令)
  Revision: 412CO0000000278_20260401_507CO0000000412
  Raw snapshot: data/raw/412CO0000000278_20260401_507CO0000000412.law.json
  sha256: 165d5edc3356cf47fead9f75eac0d3cd410266ef01827d8880614af90d8c0186
  Statutory article: 第四条 (art. 4), 第一項 (para. 1)
  Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/
               Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit id: NORM|5adb98f94dfcc1816db82d141229cfd8c175fbebd2c2a3ad22d59aafbc2a2032

原文逐語（pinned, 一字一句改変なし, EFFECT, verbatim-unique in whole law）:
  「委員の任期は、二年とする。」

Variable contract:
  `committeeTermYears : Nat := 2` = 二年 (two years).
  `isCommitteeTerm (years : Nat) : Bool := decide (2 <= years && years <= 2)`.
  Unit 年; domain Nat (whole years). The predicate is true exactly at two years.

Scope: ONLY the explicit term length is modelled. The identity of 委員, the
appointment/renewal rules, the committee's powers, other articles and all
operational rules are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CommitteeTermTwoYears

/-- 二年 — the statutory committee term. Unit 年; domain Nat. -/
def committeeTermYears : Nat := 2

/-- 「任期は二年」: the term length is exactly two years. -/
def isCommitteeTerm (years : Nat) : Bool :=
  decide (committeeTermYears <= years && years <= committeeTermYears)

/-- Exactly two years qualifies. -/
theorem term_two_true : isCommitteeTerm 2 = true := by
  unfold isCommitteeTerm committeeTermYears
  decide

/-- One year is not the statutory term. -/
theorem term_one_false : isCommitteeTerm 1 = false := by
  unfold isCommitteeTerm committeeTermYears
  decide

/-- Three years is not the statutory term. -/
theorem term_three_false : isCommitteeTerm 3 = false := by
  unfold isCommitteeTerm committeeTermYears
  decide

end JapanTaxLaw.CommitteeTermTwoYears

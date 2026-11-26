import Std
import JapanTaxLaw.TaxFinance

/-
# IssuanceDeadlineFifteenElapsedDays — 関税暫定措置法施行令証明書発給省令 第二条 第四項
（受理した日から起算して十五日を経過した日までに証明書の交付）

Pinned sources:
  Law id: 407M50000200018 (関税暫定措置法施行令第二条第一項又は第二項の
    証明書の発給に関する省令)
  Revision: 407M50000200018_20201221_502M60000200083 (enforced 2020-12-21)
  Raw snapshot: data/raw/407M50000200018_20201221_502M60000200083.law.json
  Article Num 2, Paragraph Num 4, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#4/ParagraphSentence/Sentence#1
  Normative unit: NORM|6d7cf599ccaf0f5c0e6dc301eaaa00ec9bbd73fce4b5ea055b0cb4e0aa1f9b51

Verbatim 原文 needle (scoped to Article 2 Paragraph 4):
  「受理した日から起算して十五日を経過した日までに」

Variable contract:
  accept = 申請を農林水産大臣が受理した日 (caller-established day index)
  issue  = 証明書の交付日 (caller-established day index)
  elapsed = 十五日 = 15 days
  byDeadline accept issue = (issue <= accept + 15)

This is an EVENT-ANCHORED forward deadline (issue by accept+15), distinct from
the already formalized 特定国等証明書発給省令 art.2(4) 「受理した日から十五日以内」,
which models a relative duration `days <= 15`. Both are faithful to their own
原文; they are not merged.

Scope: ONLY this two-variable deadline relation. §1 issuance discretion and
formalities, §2 refusal notification, applicant/goods identification, the
definition of 受理, calendar/leap-year arithmetic, the parent 関税暫定措置法施行令
art.2(1)/(2) and all other articles/laws are NOT MODELLED. No legal review.
-/

namespace JapanTaxLaw.IssuanceDeadlineFifteenElapsedDays

/-- 原文の「十五」= 15 日（経過日の起点は受理日）。 -/
def elapsedDays : Nat := 15

/-- 受理日から十五日を経過した日までに交付されるか。 -/
def byDeadline (accept : Nat) (issue : Nat) : Bool :=
  issue <= accept + elapsedDays

theorem elapsed_is_fifteen : elapsedDays = 15 := rfl

/-- 厳密境界: 経過日前 / 経過日丁度 / 経過日後。 -/
theorem before_elapsed_day : byDeadline 0 14 = true := by decide
theorem on_elapsed_day : byDeadline 0 15 = true := by decide
theorem after_elapsed_day : byDeadline 0 16 = false := by decide

/-- 受理日が後ろにずれても同じ期限関係が成り立つ。 -/
theorem shifted_acceptance : byDeadline 10 25 = true := by decide
theorem shifted_too_late : byDeadline 10 26 = false := by decide

/-- 受理日当日の交付。 -/
theorem same_day : byDeadline 0 0 = true := by decide

end JapanTaxLaw.IssuanceDeadlineFifteenElapsedDays

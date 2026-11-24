import JapanTaxLaw.TaxFinance

/-
# FilingDateException — 通算法人 第六条（指定期日が提出期限前の日の例外）

Sources (pinned):
  Law id: 426CO0000000139
  Revision: 426CO0000000139_20260401_508CO0000000095
  Raw snapshot: data/raw/426CO0000000139_20260401_508CO0000000095.law.json
  SHA-256: 2239be3cdc09998cc3a9c75a05d8b8c6b47df4135ec708cdcb6aa31f40d76dcf
  91,424 bytes; Article Num 6.

Pinned 原文 (verbatim needle, scoped Article 6):
「ただし、当該指定された期日が当該他の通算法人の同条第一項の規定による申告書の提出期限前の日である場合は、この限りでない。」

Scope / variable contract:
  designatedDate = 指定された期日 (Nat, day index);
  filingDeadline = 他の通算法人の同条第一項の規定による申告書提出期限 (Nat, day index).
  Dates are caller-established day indices; calendar arithmetic is NOT MODELLED.
  The exception (この限りでない) disables the base rule exactly when the
  designated date is STRICTLY BEFORE the other consolidated taxpayer's deadline.
  isBeforeDeadline d f = decide (d < f): STRICT; equality does NOT trigger it.
  baseRuleApplies d f = decide (f <= d): the exact complement.
  「第一項」's 1 in itemOneRef is a CROSS-REFERENCE IDENTIFIER to paragraph 1
  of the same article, NOT a substantive numeric threshold.
  This model provides no legal review.
-/

namespace JapanTaxLaw.FilingDateException

/-- 同条第一項: structural cross-reference identifier, not a threshold. -/
def itemOneRef : Nat := 1

/-- The proviso trigger: designated date strictly before the other filing deadline. -/
def isBeforeDeadline (designatedDate : Nat) (filingDeadline : Nat) : Bool :=
  decide (designatedDate < filingDeadline)

/-- Complement: the main rule applies on or after the deadline. -/
def baseRuleApplies (designatedDate : Nat) (filingDeadline : Nat) : Bool :=
  decide (filingDeadline <= designatedDate)

theorem item_one_ref_eq_one : itemOneRef = 1 := rfl

theorem is_before_deadline_9_10 : isBeforeDeadline 9 10 = true := rfl
theorem is_before_deadline_10_10 : isBeforeDeadline 10 10 = false := rfl
theorem is_before_deadline_11_10 : isBeforeDeadline 11 10 = false := rfl

theorem base_rule_applies_9_10 : baseRuleApplies 9 10 = false := rfl
theorem base_rule_applies_10_10 : baseRuleApplies 10 10 = true := rfl
theorem base_rule_applies_11_10 : baseRuleApplies 11 10 = true := rfl

end JapanTaxLaw.FilingDateException

import JapanTaxLaw.TaxGeneralPriority

/-!
# TaxGeneralPriority tests — 国税通則法 Act art. 4 smoke checks

Decidable smoke checks for the priority rule. Scope limited to
Act art. 4 (national-tax laws' special provision beats this Act).

Note: `⟨coveredByThisAct, distinctElsewhere⟩` — see MatterPriorityFacts.
-/

namespace JapanTaxLaw

-- 別段の定めあり ⇒ 他法適用（本法規定の有無を問わず）
example : resolveThisActPriority ⟨.yes, .yes⟩ = .applyOtherLaw := by decide
example : resolveThisActPriority ⟨.no, .yes⟩ = .applyOtherLaw := by decide
example : resolveThisActPriority ⟨.unknown, .yes⟩ = .applyOtherLaw := by decide
example : resolveThisActPriority ⟨.conflict, .yes⟩ = .applyOtherLaw := by decide

-- 別段の定めなし ∧ 本法が規定 ⇒ 本法適用
example : resolveThisActPriority ⟨.yes, .no⟩ = .applyThisAct := by decide

-- 別段の定めなし ∧ 本法未規定 ⇒ 判定不能（不明は偽として処理しない）
example : resolveThisActPriority ⟨.no, .no⟩ = .undetermined := by decide
example : resolveThisActPriority ⟨.unknown, .no⟩ = .undetermined := by decide
example : resolveThisActPriority ⟨.unknown, .unknown⟩ = .undetermined := by decide
example : resolveThisActPriority ⟨.no, .unknown⟩ = .undetermined := by decide

-- 矛盾 ⇒ 判定不能の上位（矛盾）
example : resolveThisActPriority ⟨.no, .conflict⟩ = .inconsistent := by decide
example : resolveThisActPriority ⟨.unknown, .conflict⟩ = .inconsistent := by decide
example : resolveThisActPriority ⟨.conflict, .no⟩ = .inconsistent := by decide
example : resolveThisActPriority ⟨.conflict, .unknown⟩ = .inconsistent := by decide

-- 不明は本法にも他法にも確定しない（＝偽として扱われない）
example : resolveThisActPriority ⟨.unknown, .unknown⟩ ≠ .applyThisAct := by decide
example : resolveThisActPriority ⟨.unknown, .unknown⟩ ≠ .applyOtherLaw := by decide

end JapanTaxLaw

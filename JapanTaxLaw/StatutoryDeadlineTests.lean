import JapanTaxLaw.StatutoryDeadline

/-!
# StatutoryDeadline tests — 国税通則法 Act art. 2 item 8 smoke checks

Decidable smoke checks for the exclusion clause slice. Scope limited to
Act art. 2 item 8's carve-out (exclusion of the five period kinds);
sub-items イ–ニ are not claimed.
-/

namespace JapanTaxLaw

-- いずれの除外も肯定されない ⇒ 法定納期限である
example : isStatutoryDeadline ⟨.no, .no, .no, .no, .no⟩ = Verdict.yes := by decide

-- 繰上請求 ⇒ 法定納期限ではない
example : isStatutoryDeadline ⟨.yes, .no, .no, .no, .no⟩ = Verdict.no := by decide
-- 延納 ⇒ 法定納期限ではない
example : isStatutoryDeadline ⟨.no, .yes, .no, .no, .no⟩ = Verdict.no := by decide
-- 納税の猶予 ⇒ 法定納期限ではない
example : isStatutoryDeadline ⟨.no, .no, .yes, .no, .no⟩ = Verdict.no := by decide
-- 徴収の猶予 ⇒ 法定納期限ではない
example : isStatutoryDeadline ⟨.no, .no, .no, .yes, .no⟩ = Verdict.no := by decide
-- 滞納処分の猶予 ⇒ 法定納期限ではない
example : isStatutoryDeadline ⟨.no, .no, .no, .no, .yes⟩ = Verdict.no := by decide

-- 複数肯定でも除外は優先
example : isStatutoryDeadline ⟨.yes, .yes, .yes, .yes, .yes⟩ = Verdict.no := by decide

-- 不明 ⇒ 法定納期限ではない（不明を偽として処理しない）
example : isStatutoryDeadline ⟨.unknown, .no, .no, .no, .no⟩ = Verdict.unknown := by decide
example : isStatutoryDeadline ⟨.no, .unknown, .no, .no, .no⟩ = Verdict.unknown := by decide
example : isStatutoryDeadline ⟨.no, .no, .no, .no, .unknown⟩ ≠ Verdict.yes := by decide
-- 矛盾 ⇒ 法定納期限ではない
example : isStatutoryDeadline ⟨.conflict, .no, .no, .no, .no⟩ = Verdict.conflict := by decide

-- 除外が肯定されたら法定納期限（肯定側）ではなくなる
example : exclusionApplies ⟨.yes, .yes, .no, .no, .no⟩ = Verdict.yes := by decide

end JapanTaxLaw

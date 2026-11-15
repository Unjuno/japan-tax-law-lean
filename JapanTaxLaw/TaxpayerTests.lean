import JapanTaxLaw.Taxpayer

/-!
# Taxpayer tests — 国税通則法 Act art. 2 item 5 smoke checks

Decidable smoke checks for the definition layer. Scope limited to
Act art. 2 item 5; later items are not claimed.
-/

namespace JapanTaxLaw

-- 直接納付トラック：義務あり・除外なし ⇒ 納税者
example : isTaxpayer ⟨.yes, .no, .no, .no⟩ = Verdict.yes := by decide
-- 源泉徴収等トラック：徴収して納付すべき者 ⇒ 納税者
example : isTaxpayer ⟨.no, .yes, .yes, .yes⟩ = Verdict.yes := by decide
-- 義務ありでも第二次納税義務者 ⇒ 納税者ではない
example : isTaxpayer ⟨.yes, .no, .yes, .no⟩ = Verdict.no := by decide
-- 義務ありでも国税の保証人 ⇒ 納税者ではない
example : isTaxpayer ⟨.yes, .no, .no, .yes⟩ = Verdict.no := by decide
-- 義務なし・徴収納付義務なし ⇒ 納税者ではない
example : isTaxpayer ⟨.no, .no, .no, .no⟩ = Verdict.no := by decide
-- 義務等矛盾 ⇒ 判定矛盾（どちらとも決められない）
example : isTaxpayer ⟨.yes, .conflict, .no, .no⟩ = Verdict.yes := by decide
example : isTaxpayer ⟨.conflict, .no, .no, .no⟩ = Verdict.conflict := by decide
example : isTaxpayer ⟨.unknown, .unknown, .no, .no⟩ = Verdict.unknown := by decide
-- 第二次納税義務者でも徴収納付義務あり ⇒ 納税者
example : isTaxpayer ⟨.no, .yes, .yes, .no⟩ = Verdict.yes := by decide
-- 保証人であっても徴収納付義務あり ⇒ 納税者
example : isTaxpayer ⟨.no, .yes, .no, .yes⟩ = Verdict.yes := by decide
-- 直接義務あり・除外 unknown ⇒ 判定 unknown（不明は偽として処理しない）
example : isTaxpayer ⟨.yes, .no, .unknown, .no⟩ = Verdict.unknown := by decide

end JapanTaxLaw

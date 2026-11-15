import JapanTaxLaw.LocalExemption

/-!
# LocalExemption tests — 地方税法 Act art. 6 smoke checks

Decidable smoke checks for the Act art. 6 exemption/uneven-tax permissions.
Scope limited to Act art. 6; Act art. 7 （受益に因る特例） and Act art. 2
side products are not claimed.
-/

namespace JapanTaxLaw

-- 地方団体かつ公益上の理由 ⇒ 課税しないことができる
example : mayNotLevy ⟨.yes, .yes, .no⟩ = Verdict.yes := by decide
example : mayNotLevy ⟨.yes, .yes, .yes⟩ = Verdict.yes := by decide
-- 地方団体かつ公益上の理由 ⇒ 不均一の課税をすることができる
example : mayLevyUnevenly ⟨.yes, .no, .yes⟩ = Verdict.yes := by decide
example : mayLevyUnevenly ⟨.yes, .yes, .yes⟩ = Verdict.yes := by decide

-- 地方団体だが公益上の理由ない ⇒ 除外選択肢なし
example : mayNotLevy ⟨.yes, .no, .no⟩ = Verdict.no := by decide
example : mayLevyUnevenly ⟨.yes, .no, .no⟩ = Verdict.no := by decide

-- 地方団体でなければ適用できない
example : mayNotLevy ⟨.no, .yes, .no⟩ = Verdict.no := by decide
example : mayLevyUnevenly ⟨.no, .no, .yes⟩ = Verdict.no := by decide

-- 両段落とも不成立 ⇒ .undetermined (hypotheses unknown)
example : classifyLocalTaxExemption ⟨.unknown, .no, .no⟩ = .undetermined := by decide
-- 両段落成立 ⇒ .bothAllowed
example : classifyLocalTaxExemption ⟨.yes, .yes, .yes⟩ = .bothAllowed := by decide
-- 第1項のみ成立 ⇒ .mayNotLevy
example : classifyLocalTaxExemption ⟨.yes, .yes, .no⟩ = .mayNotLevy := by decide
-- 第2項のみ成立 ⇒ .mayLevyUnevenly
example : classifyLocalTaxExemption ⟨.yes, .no, .yes⟩ = .mayLevyUnevenly := by decide
-- 矛盾 ⇒ .inconsistent
example : classifyLocalTaxExemption ⟨.yes, .conflict, .yes⟩ = .inconsistent := by decide

end JapanTaxLaw

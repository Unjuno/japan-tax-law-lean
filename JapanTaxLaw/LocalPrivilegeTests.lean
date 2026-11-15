import JapanTaxLaw.LocalPrivilege

/-!
# LocalPrivilege tests — 地方税法 Act art. 7 smoke checks

Decidable smoke checks for the Act art. 7 special-benefit privileges.
Scope limited to Act art. 7 （受益に因る不均一課税及び一部課税）;
Act art. 6 is covered in LocalExemptionTests.lean.
-/

namespace JapanTaxLaw

-- 地方団体かつ受益がある ⇒ 不均一の課税をすることができる
example : mayLevyUnevenForBenefit ⟨.yes, .yes⟩ = Verdict.yes := by decide
example : mayLevyUnevenForBenefit ⟨.yes, .unknown⟩ = Verdict.unknown := by decide
-- 地方団体かつ受益がある ⇒ その一部に課税をすることができる
example : mayLevyOnPartOnlyForBenefit ⟨.yes, .yes⟩ = Verdict.yes := by decide
example : mayLevyOnPartOnlyForBenefit ⟨.yes, .unknown⟩ = Verdict.unknown := by decide

-- 地方団体でない ⇒ 特例の適用なし
example : mayLevyUnevenForBenefit ⟨.no, .yes⟩ = Verdict.no := by decide
example : mayLevyOnPartOnlyForBenefit ⟨.no, .yes⟩ = Verdict.no := by decide
-- 受益がない ⇒ 特例の適用なし
example : mayLevyUnevenForBenefit ⟨.yes, .no⟩ = Verdict.no := by decide
example : mayLevyOnPartOnlyForBenefit ⟨.yes, .no⟩ = Verdict.no := by decide
-- 不明 ⇒ 判定不能
example : mayLevyUnevenForBenefit ⟨.unknown, .unknown⟩ = Verdict.unknown := by decide
example : mayLevyOnPartOnlyForBenefit ⟨.unknown, .yes⟩ = Verdict.unknown := by decide

-- 分類: 受益があるなら両方利用可能
example : classifyLocalTaxPrivilege ⟨.yes, .yes⟩ = .bothAllowed := by decide
example : classifyLocalTaxPrivilege ⟨.yes, .no⟩ = .undetermined := by decide
example : classifyLocalTaxPrivilege ⟨.yes, .unknown⟩ = .undetermined := by decide
-- 地方団体でないなら .undetermined
example : classifyLocalTaxPrivilege ⟨.no, .yes⟩ = .undetermined := by decide
-- 矛盾入力 ⇒ .inconsistent
example : classifyLocalTaxPrivilege ⟨.conflict, .yes⟩ = .inconsistent := by decide
example : classifyLocalTaxPrivilege ⟨.yes, .conflict⟩ = .inconsistent := by decide

end JapanTaxLaw

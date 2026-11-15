import JapanTaxLaw.InheritanceTaxActor

/-!
# InheritanceTaxActor tests — 相続税法 Act art. 1の3 smoke checks

Decidable smoke checks for the actor-scope slice (Act art. 1の3 clause (一) first-block:
the compliant individual resident who acquired property by inheritance or bequest).
-/

namespace JapanTaxLaw

-- 全条件 yes ⇒ 納税義務あり
example : owesInheritanceTaxVerdict ⟨.yes, .yes, .yes, .yes⟩ = Verdict.yes := by decide
-- 個人でない ⇒ 納税義務なし
example : owesInheritanceTaxVerdict ⟨.no, .yes, .yes, .yes⟩ = Verdict.no := by decide
-- 施行地に住所を有しない ⇒ 納税義務なし
example : owesInheritanceTaxVerdict ⟨.yes, .no, .yes, .yes⟩ = Verdict.no := by decide
-- 一時居住者 ⇒ 納税義務なし（このモデルでは"trigger"側として扱わない）
example : owesInheritanceTaxVerdict ⟨.yes, .yes, .no, .yes⟩ = Verdict.no := by decide
-- 遺贈・相続による取得でない ⇒ 納税義務なし
example : owesInheritanceTaxVerdict ⟨.yes, .yes, .yes, .no⟩ = Verdict.no := by decide

-- 不明 ⇒ 判定不能寄り（no へ倒れないことの確認）
example : owesInheritanceTaxVerdict ⟨.unknown, .yes, .yes, .yes⟩ = Verdict.unknown := by decide
example : owesInheritanceTaxVerdict ⟨.yes, .unknown, .yes, .yes⟩ = Verdict.unknown := by decide
example : owesInheritanceTaxVerdict ⟨.yes, .yes, .unknown, .yes⟩ = Verdict.unknown := by decide
example : owesInheritanceTaxVerdict ⟨.yes, .yes, .yes, .unknown⟩ = Verdict.unknown := by decide

-- 矛盾 ⇒ 判決不能
example : owesInheritanceTaxVerdict ⟨.conflict, .yes, .yes, .yes⟩ = Verdict.conflict := by decide
example : owesInheritanceTaxVerdict ⟨.yes, .conflict, .yes, .yes⟩ = Verdict.conflict := by decide

-- 分類: ちょうど 1 つ
example : classifyInheritanceTaxActor ⟨.yes, .yes, .yes, .yes⟩ = .owes := by decide
example : classifyInheritanceTaxActor ⟨.no, .yes, .yes, .yes⟩ = .doesNotOwe := by decide
example : classifyInheritanceTaxActor ⟨.unknown, .yes, .yes, .yes⟩ = .undetermined := by decide
example : classifyInheritanceTaxActor ⟨.conflict, .yes, .yes, .yes⟩ = .inconsistent := by decide

-- 一部条件だけ満たす、残りは不明 ⇒ .unknown（条件不明は判定不能）
example : owesInheritanceTaxVerdict ⟨.yes, .no, .yes, .unknown⟩ = Verdict.no := by decide

end JapanTaxLaw


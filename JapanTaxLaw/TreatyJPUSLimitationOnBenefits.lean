/-\!
# TreatyJPUSLimitationOnBenefits — 日米租税条約 第二十二条（特典制限）

L3 条約層（別層）。第二十二条の適格者カスケード構造をカーネル証明する：
- ２２１：条約特典は、別段の定めがある場合を除き、追加要件を満たし、かつ
  (a)個人 (b)政府等 (c)上場法人/50%所有法人 (d)第四条１の者
  (e)適格年金基金 (f)その他の適格者 — のいずれかに該当する場合に限る。
- 容易化：適格性は「追加要件 AND いずれかの適格カテゴリ」の連立。

具体的な所有割合・上場要件・法的効力は NOT MODELLED。legal_review PENDING。
-/
namespace JapanTaxLaw.TreatyJPUSLimitationOnBenefits

-- 適格カテゴリのいずれかに該当（a..f の論理和）
def isQualifyingCategory (individual government listedCorp ownedCorp art4Person pensionFund other : Bool) : Bool :=
  individual || government || listedCorp || ownedCorp || art4Person || pensionFund || other

theorem individual_qualifies : isQualifyingCategory true false false false false false false = true := by decide
theorem government_qualifies : isQualifyingCategory false true false false false false false = true := by decide
theorem no_category_not_qualified : isQualifyingCategory false false false false false false false = false := by decide

-- ２２１：特典適格 = 追加要件 AND 適格カテゴリ（別段の定めがある場合はこの限りでない）
def treatyEligible (meetsRequirements qualifyingCategory separateProvision : Bool) : Bool :=
  separateProvision || (meetsRequirements && qualifyingCategory)
theorem eligible_when_all : treatyEligible true true false = true := by decide
theorem requirements_fail : treatyEligible false true false = false := by decide
theorem category_fail : treatyEligible true false false = false := by decide
theorem separate_provision_overrides : treatyEligible false false true = true := by decide

-- 適格なら適格カテゴリのいずれかが必要（separate provision が無い場合）
theorem eligibility_requires_category (m q s : Bool) (h : treatyEligible m q s = true) (hs : s = false) : q = true := by
  subst s
  simp [treatyEligible] at h
  cases m <;> cases q <;> simp at h ⊢

def limitationOnBenefitsDeclared : Bool := true
theorem limitation_on_benefits_is_declaration : limitationOnBenefitsDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSLimitationOnBenefits

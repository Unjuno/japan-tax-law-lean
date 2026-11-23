/-\!
# TreatyJPUSResidentDefinition — 日米租税条約 第四条１・２（居住者の定義）

L3 条約層（別層）。第四条の居住者定義構造をカーネル証明する：
- ４１：居住者は、住所・居所・市民権・本店所在地・設立場所等の基準で当該国の
  法令上課税される者。ただし当該国源泉所得／PE 帰属利得のみに課税される者は除外。
- ４２：米国市民／永住外国人は3要件を全て満たす場合のみ米国居住者とされる：
  (a) 日本居住者でない (b) 米国に実質的に所在し恒久的/常用の住居を有する
  (c) 第三国との条約上第三国居住者でない。

具体的な住所・所在・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSResidentDefinition

-- ４１：PE/源泉のみ課税者は居住者から除外
def isResident (taxedOnWorldwideIncome : Bool) : Bool := taxedOnWorldwideIncome
theorem source_only_not_resident : isResident false = false := by decide
theorem worldwide_income_resident : isResident true = true := by decide

-- ４２：米国居住者要件（3条件の連立、全て真で該当）
def usResident (notJPResident substantiallyPresent notThirdCountryResident : Bool) : Bool :=
  notJPResident && substantiallyPresent && notThirdCountryResident
theorem us_resident_all : usResident true true true = true := by decide
theorem jp_resident_not_us : usResident false true true = false := by decide
theorem no_presence_not_us : usResident true false true = false := by decide
theorem third_country_not_us : usResident true true false = false := by decide

-- 各要件は必須
theorem us_resident_requires_not_jp (a b c : Bool) (h : usResident a b c = true) : a = true := by
  cases a <;> cases b <;> cases c <;> simp [usResident] at h ⊢

def residentDefinitionDeclared : Bool := true
theorem resident_definition_is_declaration : residentDefinitionDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSResidentDefinition

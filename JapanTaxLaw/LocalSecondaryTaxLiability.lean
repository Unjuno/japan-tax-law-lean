/-\!
# LocalSecondaryTaxLiability — 地方税法 第十一条の六（第二次納税義務）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000226_20261101_508AC0000000002.law.json Article:11_6

原文の規範構造：各号の者が納税者の事業に欠くことができない重要財産を有し、
その財産から生ずる所得が納税者の所得となっている場合に、納税者が滞納し、
滞納処分しても不足すると認められるときは、各号の者は当該財産を限度として
第二次納税義務を負う。対象2単位 = 2つの号の主体区分:
- 号1: 納税者が個人の場合 → 生計を一にする親族で事業所得を受ける者
- 号2: 納税者が同族会社の場合 → 判定の基礎となった株主/社員

変数: `hasImportantProperty` 重要財産保有, `incomeIsTaxpayers` 所得が納税者のもの,
`delinquent` 滞納, `insufficientAfterLevy` 滞納処分後も不足,
`category1` 号1該当, `category2` 号2該当。
第二次納税義務 = 全要件成立 且つ (号1 又は 号2)。
「財産を限度」の具体的算定は NOT MODELLED。
-/
namespace JapanTaxLaw.LocalSecondaryTaxLiability

-- 第二次納税義務の成立：全要件 且つ (号1 or 号2)
def secondaryLiability (props income delinq insuff cat1 cat2 : Bool) : Bool :=
  props && income && delinq && insuff && (cat1 || cat2)

theorem all_conditions_cat1 : secondaryLiability true true true true true false = true := by decide
theorem all_conditions_cat2 : secondaryLiability true true true true false true = true := by decide
theorem missing_property_no_liability : secondaryLiability false true true true true false = false := by decide
theorem no_shortfall_no_liability : secondaryLiability true true true false true false = false := by decide
theorem no_category_no_liability : secondaryLiability true true true true false false = false := by decide

-- 号は論理和（いずれかで足りる）: 具体値で確認
theorem cat1_suffices_true : secondaryLiability true true true true true false = true := by decide
theorem cat1_suffices_false : secondaryLiability false true true true true false = false := by decide
theorem cat2_suffices_true : secondaryLiability true true true true false true = true := by decide
theorem cat2_suffices_false : secondaryLiability true true true true false false = false := by decide

def localSecondaryTaxLiabilityDeclared : Bool := true
theorem local_secondary_tax_liability_is_declaration : localSecondaryTaxLiabilityDeclared = true := rfl

end JapanTaxLaw.LocalSecondaryTaxLiability

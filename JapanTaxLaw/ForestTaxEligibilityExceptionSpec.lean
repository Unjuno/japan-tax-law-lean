import JapanTaxLaw.ForestTaxEligibilityException

/-
# ForestTaxEligibilityExceptionSpec — 森林環境税法 第四条（非課税対象者の所得制限）の独立定式

Pinned source (same snapshot as the implementation):
  Law id: 431AC0000000003
  Revision: 431AC0000000003_20260401_508AC0000000002
  Raw snapshot: data/raw/431AC0000000003_20260401_508AC0000000002.law.json
  sha256: b854d3c0e79d4141f03d053f2bedce95934c26f32a8508324a742dc384edfcf4
  Article: 第四条 (raw JSON Article attr.Num = "4", main provision)
  原文逐語: 「障害者、未成年者、寡婦又はひとり親（これらの者の当該年度の初日の属する年の前年（次号において「前年」という。）の合計所得金額が百三十五万円を超える場合を除く。）」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specCeiling : Nat := 1_350_000` (百三十五万円) and restates the four-category
membership and the inclusive income test on that own constant:
  specCategory c := c == "障害者" || c == "未成年者" || c == "寡婦" || c == "ひとり親"
  specEligible c income := specCategory c && decide (income <= specCeiling)
No implementation identifier (`incomeCeiling`, `isQualifyingCategory`, `eligible`)
occurs in any independent `spec*` definition. The ONLY impl/spec bridges are the
universal kernel-checked theorems agreeCeiling / agreeCategory / agreeEligible,
proved by pure `unfold ... ; rfl`: after unfolding, both sides are definitionally
identical terms. No `by_cases`, no `omega`, no `Classical.choice`, no extra axiom.

Variable contract: c = 障害者/未成年者/寡婦/ひとり親 (String category);
  income = 前年合計所得金額 (Nat, 円); 百三十五万円超 = >1_350_000 EXCLUSIVE
  exclusion, so income <= 1_350_000 INCLUSIVE for eligibility.
Not modelled (same as the implementation): category definitions under 地方税法
  第292条, 前年 computation, 生活保護扶助, 政令で定める金額, other paragraphs,
  supplementary provisions and legal determination.
-/

namespace JapanTaxLaw.ForestTaxEligibilityException

/-- Spec-local statutory constant: 百三十五万円 = 1,350,000 (円, Nat). Independent of impl. -/
def specCeiling : Nat := 1_350_000

/-- Independent 「障害者、未成年者、寡婦又はひとり親」 four-category membership. -/
def specCategory (c : String) : Bool :=
  c == "障害者" || c == "未成年者" || c == "寡婦" || c == "ひとり親"

/-- Independent eligibility: one of the four categories AND income <= specCeiling. -/
def specEligible (c : String) (income : Nat) : Bool :=
  specCategory c && decide (income <= specCeiling)

/-- Universal, kernel-checked ceiling bridge. Pure axiom-free `unfold ... ; rfl`. -/
theorem agreeCeiling : incomeCeiling = specCeiling := by
  unfold incomeCeiling specCeiling
  rfl

/-- Universal, kernel-checked category bridge. Pure axiom-free `unfold ... ; rfl`. -/
theorem agreeCategory (c : String) : isQualifyingCategory c = specCategory c := by
  unfold isQualifyingCategory specCategory
  rfl

/-- Universal, kernel-checked eligibility bridge. Pure axiom-free `unfold ... ; rfl`. -/
theorem agreeEligible (c : String) (income : Nat) : eligible c income = specEligible c income := by
  unfold eligible specEligible isQualifyingCategory specCategory incomeCeiling specCeiling
  rfl

example : specCeiling = 1_350_000 := by decide
example : specCategory "障害者" = true := by decide
example : specCategory "一般" = false := by decide
example : specEligible "障害者" 1_350_000 = true := by decide
example : specEligible "障害者" 1_350_001 = false := by decide

end JapanTaxLaw.ForestTaxEligibilityException

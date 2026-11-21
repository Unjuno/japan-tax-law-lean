import JapanTaxLaw.TaxFinance

/-
# ForestTaxEligibilityException — 森林環境税及び森林環境譲与税に関する法律 第四条（非課税対象者の所得制限）bounded L4 モデル

Pinned source:
  Law id: 431AC0000000003
  Official title: 森林環境税及び森林環境譲与税に関する法律 (Act, 平成三十一年法律第三号)
  Revision: 431AC0000000003_20260401_508AC0000000002 (current-enforced;
    enforcement 2026-04-01, amendment law 508AC0000000002)
  Raw snapshot: data/raw/431AC0000000003_20260401_508AC0000000002.law.json
  Raw snapshot sha256: b854d3c0e79d4141f03d053f2bedce95934c26f32a8508324a742dc384edfcf4
    (raw bytes 124407; matches INVENTORY.json `raw_snapshot.source_sha256`)
  Statutory article: 第四条 (raw JSON Article attr.Num = "4"), main provision at
    law_full_text/children/1/children/2/children/1/children/1/children/3.
    A same-numbered Article also occurs in 附則 — NOT MODELLED (BY-DESIGN).

原文逐語（pinned, 一字一句改変なし）:
  「障害者、未成年者、寡婦又はひとり親（これらの者の当該年度の初日の属する年の前年（次号において「前年」という。）の合計所得金額が百三十五万円を超える場合を除く。）」

Variable contract:
  c : String — the person's category: 障害者 / 未成年者 / 寡婦 / ひとり親.
  income : Nat — 前年（当該年度の初日の属する年の前年）の合計所得金額, unit 円.
  百三十五万円超 = income > 1_350_000 is the EXCLUSIVE exclusion; hence
    income <= 1_350_000 is the INCLUSIVE ceiling for eligibility.
  incomeCeiling : Nat := 1_350_000 (百三十五万円).
  isQualifyingCategory c := membership in the four enumerated categories.
  eligible c income := isQualifyingCategory c && decide (income <= incomeCeiling).

Scope: ONLY the explicit eligibility-exception structure — the four enumerated
  categories plus the 百三十五万円 income ceiling. The definition of each category
  by 地方税法第292条, the computation of 前年, 生活保護扶助 (第一号), the 政令で定める
  金額 (第三号), other paragraphs/articles, supplementary provisions and every
  legal determination are NOT MODELLED. No legal review is provided.

No `sorry`, `admit`, `axiom`, `by_cases`, `omega` or `Classical.choice`.
-/

namespace JapanTaxLaw.ForestTaxEligibilityException

/-- 百三十五万円 — inclusive ceiling for 前年合計所得金額 (円, Nat). -/
def incomeCeiling : Nat := 1_350_000

/-- 第四条第二号の四区分: 障害者 / 未成年者 / 寡婦 / ひとり親. -/
def isQualifyingCategory (c : String) : Bool :=
  c == "障害者" || c == "未成年者" || c == "寡婦" || c == "ひとり親"

/-- 非課税対象者の適格性: 四区分のいずれか かつ 前年合計所得金額が百三十五万円以下. -/
def eligible (c : String, income : Nat) : Bool :=
  isQualifyingCategory c && decide (income <= incomeCeiling)

theorem incomeCeiling_value : incomeCeiling = 1_350_000 := by
  rfl

theorem isQualifyingCategory_t1 : isQualifyingCategory "障害者" = true := by
  decide

theorem isQualifyingCategory_t2 : isQualifyingCategory "未成年者" = true := by
  decide

theorem isQualifyingCategory_t3 : isQualifyingCategory "寡婦" = true := by
  decide

theorem isQualifyingCategory_t4 : isQualifyingCategory "ひとり親" = true := by
  decide

theorem isQualifyingCategory_other : isQualifyingCategory "一般" = false := by
  decide

theorem eligible_at_ceiling : eligible "障害者" 1_350_000 = true := by
  decide

theorem eligible_above_ceiling : eligible "障害者" 1_350_001 = false := by
  decide

theorem eligible_non_category : eligible "一般" 0 = false := by
  decide

end JapanTaxLaw.ForestTaxEligibilityException

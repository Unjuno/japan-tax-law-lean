import JapanTaxLaw.TaxFinance

/-!
# SpecialTonnageArt10PenaltyCap — 特別とん税法 art.10(1)（罰金50万円/拘禁3年の上限）bounded L4 モデル

Sources (pinned):
  Law id: 332AC0000000038
  Revision: 332AC0000000038_20250601_504AC0000000068
  Raw snapshot: data/raw/332AC0000000038_20250601_504AC0000000068.law.json
  SHA-256: 5bfed8c6c85b2803e3987df079cb731532df32b2f2bce061afd1ab2e255c9669
  Norm unit NORM|2f886a909310a1f78cd7bd2e372a1664fea11ee5a4b06a02f77527939e87f273
  Source path: LawBody[1]/MainProvision/MainProvision[9]/Article:10/Article#10/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語:
  「偽りその他不正の行為により、特別とん税を免れ、又は納付すべき特別とん税を納付しなかつた者は、三年以下の拘禁刑若しくは五十万円以下の罰金に処し、又はこれを併科する。」

Computation（原文逐語から導出、上限スライスのみ）:
  termYears <= 3（三年以下）, fineYen <= 500000（五十万円以下）
  上限判定: termYears <= 3 && fineYen <= 500000

Scope / NOT MODELLED:
  - 「又は…併科する」の選択・科刑の裁量、犯罪成立、徴収手続 (§3) は NOT MODELLED。
  - 未遂 (§2) は NOT MODELLED。本モデルは computable slice のみ。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.SpecialTonnageArt10PenaltyCap

open JapanTaxLaw.TaxFinance

/-- 拘禁刑の上限（年）。 -/
def termCapYears : Nat := 3

/-- 罰金の上限（円）。 -/
def fineCapYen : Nat := 500000

/-- 三年以下・五十万円以下の両上限を満たすか。 -/
def withinCaps (termYears fineYen : Nat) : Bool :=
  termYears <= termCapYears && fineYen <= fineCapYen

example : withinCaps 0 0 = true := by decide
example : withinCaps 2 499999 = true := by decide
example : withinCaps 3 500000 = true := by decide
example : withinCaps 4 500000 = false := by decide
example : withinCaps 3 500001 = false := by decide
example : termCapYears = 3 := by decide
example : fineCapYen = 500000 := by decide

end JapanTaxLaw.SpecialTonnageArt10PenaltyCap

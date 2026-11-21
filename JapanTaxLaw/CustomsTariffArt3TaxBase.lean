import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt3TaxBase — 関税定率法 第三条(1)（課税標準及び税率）EFFECT

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|88116e54e6374f3a288fd1aa1e79fc8167d6e733288dae64920deaaa35ab05ba
  Source path: LawBody[1]/MainProvision/MainProvision[2]/Article:3/Article#3/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （課税標準及び税率）

原文逐語（pinned, 一字一句改変なし）:
  「関税は、輸入貨物の価格又は数量を課税標準として課するものとし、その税率は、別表による。」

Norm kind: EFFECT. The article establishes that the 課税標準 (tax base) of
customs duty on 輸入貨物 is one of two ALTERNATIVES: 価格 (price) or
数量 (quantity). 「価格又は数量」 is a disjunction — either alternative,
not both, not a third. The 税率 (rate) is delegated to 別表 (a separate table)
and is NOT MODELLED — this unit models only the tax-base alternative structure.

Variable contract:
  TaxBase : Type with exactly two inhabitants, price (価格) and
  quantity (数量). Domain is the inductive type, not a numeric range.
  No arithmetic/unit/dimension applies (this is a structural EFFECT, not an
  amount formula). The 別表 rate table is out of scope.

Scope: only the 価格-又は-数量 tax-base disjunction. The 別表 rate, other
paragraphs, other articles, and any concrete duty computation are NOT MODELLED.
No legal-correctness claim; human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt3TaxBase

/-- 課税標準 (tax base) — exactly two alternatives from 価格又は数量. -/
inductive TaxBase : Type
  | price : TaxBase      -- 価格
  | quantity : TaxBase   -- 数量

deriving instance DecidableEq for TaxBase

namespace TaxBase

/-- The two admissible bases, enumerated (価格, 数量). -/
def admissibleBases : List TaxBase := [price, quantity]

/-- Boolean classifier: is this base one of the two statutory alternatives? -/
def isAdmissible (b : TaxBase) : Bool := b == price || b == quantity

/-- Exhaustiveness: every base is 価格 or 数量. -/
theorem exhaustive (b : TaxBase) : b = price ∨ b = quantity := by
  cases b <;> simp

/-- Exclusivity: 価格 and 数量 are distinct alternatives. -/
theorem price_ne_quantity : price ≠ quantity := by decide

/-- The enumerated list has exactly the two admissible members. -/
theorem admissibleBases_exact : admissibleBases = [price, quantity] := rfl

end TaxBase

end JapanTaxLaw.CustomsTariffArt3TaxBase

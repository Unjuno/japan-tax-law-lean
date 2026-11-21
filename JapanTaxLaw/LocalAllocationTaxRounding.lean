import JapanTaxLaw.TaxFinance

/-!
# LocalAllocationTaxRounding — 普通交付税に関する省令 第十条(18)（４，８８０円×Ｌの端数 四捨五入）

Pinned source:
  Law id: 337M50000008017
  Official title: 普通交付税に関する省令
  Law number: 昭和三十七年自治省令第十七号
  Law type: MinisterialOrdinance (省令)
  Revision: 337M50000008017_20260724_508M60000008092
  Raw snapshot: data/raw/337M50000008017_20260724_508M60000008092.law.json
  sha256: c2a411e7dbb3b65f6d41cef894263fdd6c384ad7789f9242d29917139632ad98
  Normative unit id: NORM|fe7a9ceb0231c6a7b59824ffad4d0f3cbeb1793f4f5d17fb8adea3a931e499aa
  Source path: LawBody[4]/MainProvision/MainProvision[1]/Article:10/Article#10/
               Paragraph#18/List/ListSentence/Sentence#1/ArithFormula
  Article caption: （普通態容補正係数の算定方法）
  The formula is ４，８８０円 × L (full-width digits in source). When the product
  has a fraction under ¥UNIT (千円未満の端数), that fraction is rounded half-up
  (四捨五入): remainder ≥ THRESHOLD rounds up, else down. BASE and UNIT/THRESHOLD
  derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「４，８８０円×Ａに千円未満の端数があるときは、その端数を四捨五入する。」

Variable contract (円, domain Nat):
  baseYen : Money := 4_880      (４，８８０円)
  roundingUnit : Money := 1_000  (千円)
  halfThreshold : Money := 500 (四捨五入 half-up threshold)
  hasFraction l := (baseYen * l) % roundingUnit ≠ 0
  roundsUp l := halfThreshold ≤ (baseYen * l) % roundingUnit

Scope: only the rounding condition and direction are modeled. The determination of
L, the table reference, other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalAllocationTaxRounding

open JapanTaxLaw.TaxFinance

/-- ４，８８０円 — base amount. Derived from verbatim source. -/
def baseYen : Money := 4_880

/-- 千円 — rounding unit. -/
def roundingUnit : Money := 1_000

/-- 四捨五入 half-up threshold (500). -/
def halfThreshold : Money := 500

/-- Whether 端数 (fraction under ¥1000) exists. -/
def hasFraction (l : Money) : Prop := (baseYen * l) % roundingUnit ≠ 0

/-- 四捨五入: remainder at or above half rounds up. -/
def roundsUp (l : Money) : Prop := halfThreshold ≤ (baseYen * l) % roundingUnit

end JapanTaxLaw.LocalAllocationTaxRounding

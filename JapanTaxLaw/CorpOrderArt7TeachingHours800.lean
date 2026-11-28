import JapanTaxLaw.TaxFinance

/-!
# CorpOrderArt7TeachingHours800 — 法人税法施行令 art.7(1) 年間授業時間800時間以上 bounded L4 モデル

Sources (pinned):
  Law id: 340M50000040012
  Revision: 340M50000040012_20261001_505M60000040013
  Raw snapshot: data/raw/340M50000040012_20261001_505M60000040013.law.json
  SHA-256: ae40e395af88ba819be06f9ec266b7a1c09ee87150ed9db59c3d3b86abae96d8
  Norm unit NORM|43ef29845ae3079d5f10e8371307baccf8e78b4fd1798ed4233b95a29d7e8b9e
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:7/Article#7/Paragraph#1/Item#2/Subitem1#1/Subitem2#1/Subitem2Sentence/Column#2/Sentence#1

原文逐語: 「その一年間の授業時間数が八百時間以上であること。」

Computation（原文逐語から導出、時間数条件スライスのみ、単位: 時間/年）:
  annualTeachingHours : Nat — 一年間の授業時間数（caller-established）
  requiredHours := 800（八百時間）
  meetsRequirement hours := hours >= 800

Scope / NOT MODELLED:
  - 学校種別の認定・修業期間・他の号の要件（450時間等）は NOT MODELLED。
  - 本モデルは当該号の時間数判定のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CorpOrderArt7TeachingHours800

/-- 原文の下限（八百時間）。 -/
def requiredHours : Nat := 800

/-- 年間授業時間数が800時間以上か。 -/
def meetsRequirement (annualTeachingHours : Nat) : Bool :=
  annualTeachingHours >= requiredHours

example : requiredHours = 800 := by decide
example : meetsRequirement 0 = false := by decide
example : meetsRequirement 799 = false := by decide
example : meetsRequirement 800 = true := by decide
example : meetsRequirement 801 = true := by decide

end JapanTaxLaw.CorpOrderArt7TeachingHours800

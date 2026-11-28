import JapanTaxLaw.TaxFinance

/-!
# CorpOrderArt7TeachingHours450And800 — 法人税法施行令 art.7(1) 年間450時間 かつ 通算800時間 bounded L4 モデル

Sources (pinned):
  Law id: 340M50000040012
  Revision: 340M50000040012_20261001_505M60000040013
  Raw snapshot: data/raw/340M50000040012_20261001_505M60000040013.law.json
  SHA-256: ae40e395af88ba819be06f9ec266b7a1c09ee87150ed9db59c3d3b86abae96d8
  Norm unit NORM|09b22d07ad97230dfe5fc99a1976f2bf741e94f388d9442f76194688cbe2e0ea
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:7/Article#7/Paragraph#1/Item#2/Subitem1#1/Subitem2#2/Subitem2Sentence/Column#2/Sentence#1

原文逐語:
  「その一年間の授業時間数が四百五十時間以上であり、かつ、その修業期間を通ずる授業時間数が八百時間以上であること。」

Computation（原文逐語から導出、時間数条件スライスのみ、単位: 時間）:
  annualHours : Nat, totalHours : Nat（caller-established）
  annualMin := 450（四百五十時間以上）
  totalMin := 800（八百時間以上）
  meetsBoth a t := a >= 450 && t >= 800

Scope / NOT MODELLED:
  - 学校種別の認定・修業期間の算定・他号（800時間のみ）は NOT MODELLED。
  - 本モデルは当該号の二つの時間数判定のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CorpOrderArt7TeachingHours450And800

/-- 一年間の下限（四百五十時間）。 -/
def annualMin : Nat := 450

/-- 修業期間全体の下限（八百時間）。 -/
def totalMin : Nat := 800

/-- 二つの時間数要件をともに満たすか。 -/
def meetsBoth (annualHours totalHours : Nat) : Bool :=
  annualHours >= annualMin && totalHours >= totalMin

example : meetsBoth 0 0 = false := by decide
example : meetsBoth 449 799 = false := by decide
example : meetsBoth 450 800 = true := by decide
example : meetsBoth 451 801 = true := by decide
example : meetsBoth 450 799 = false := by decide
example : meetsBoth 449 800 = false := by decide

end JapanTaxLaw.CorpOrderArt7TeachingHours450And800

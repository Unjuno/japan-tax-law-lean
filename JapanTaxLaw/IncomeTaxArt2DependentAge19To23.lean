import JapanTaxLaw.TaxFinance

/-!
# IncomeTaxArt2DependentAge19To23 — 所得税法 art.2(1) 控除対象扶養親族 19歳以上23歳未満 bounded L4 モデル

Sources (pinned):
  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json
  SHA-256: 94c4a7ad83726cde60787967ed4e959585ad0af9279d25db9aa02264b3fe606b
  Norm unit NORM|261d265a8c2ee41e66451727e37a5786cadbaac206f75b7e1d919892b5e9a444
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:2/Article#2/Paragraph#1/Item#34_3/ItemSentence/Column#2/Sentence#1

原文逐語: 「控除対象扶養親族のうち、年齢十九歳以上二十三歳未満の者をいう。」

Computation（原文逐語から導出、年齢帯スライスのみ、単位: 歳）:
  lowerInclusive := 19（十九歳以上）
  upperExclusive := 23（二十三歳未満）
  inAgeBand age := age >= 19 && age < 23

Scope / NOT MODELLED:
  - 扶養親族の事実認定・所得金額・控除額の計算は NOT MODELLED。
  - 本モデルは当該号の年齢帯判定のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.IncomeTaxArt2DependentAge19To23

/-- 下限（十九歳、含む）。 -/
def lowerInclusive : Nat := 19

/-- 上限（二十三歳、含まない）。 -/
def upperExclusive : Nat := 23

/-- 十九歳以上二十三歳未満の年齢帯か。 -/
def inAgeBand (age : Nat) : Bool :=
  age >= lowerInclusive && age < upperExclusive

example : lowerInclusive = 19 := by decide
example : upperExclusive = 23 := by decide
example : inAgeBand 0 = false := by decide
example : inAgeBand 18 = false := by decide
example : inAgeBand 19 = true := by decide
example : inAgeBand 22 = true := by decide
example : inAgeBand 23 = false := by decide

end JapanTaxLaw.IncomeTaxArt2DependentAge19To23

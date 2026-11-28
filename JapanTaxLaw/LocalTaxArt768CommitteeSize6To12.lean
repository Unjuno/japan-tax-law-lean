import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt768CommitteeSize6To12 — 地方税法 art.768(3) 委員定数 6人以上12人以内 bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  SHA-256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Norm unit NORM|c08eaca308e4a6bc684cb992e213f837e3ac79e747cb0cfe364582935d683f48
  Source path: LawBody[2]/MainProvision/MainProvision[8]/Article:768/Article#768/Paragraph#3/ParagraphSentence/Sentence#1

原文逐語: 「委員の定数は、六人以上十二人以内において定款で定める。」

Computation（原文逐語から導出、定数帯スライスのみ、単位: 人）:
  lowerInclusive := 6（六人以上）
  upperInclusive := 12（十二人以内）
  inRange n := n >= 6 && n <= 12

Scope / NOT MODELLED:
  - 定款の定め方・委員の選任・組織運営は NOT MODELLED。
  - 本モデルは当該項の定数帯のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt768CommitteeSize6To12

/-- 下限（六人、含む）。 -/
def lowerInclusive : Nat := 6

/-- 上限（十二人、含む）。 -/
def upperInclusive : Nat := 12

/-- 委員定数が6人以上12人以内か。 -/
def inRange (n : Nat) : Bool :=
  n >= lowerInclusive && n <= upperInclusive

example : inRange 0 = false := by decide
example : inRange 5 = false := by decide
example : inRange 6 = true := by decide
example : inRange 12 = true := by decide
example : inRange 13 = false := by decide

end JapanTaxLaw.LocalTaxArt768CommitteeSize6To12

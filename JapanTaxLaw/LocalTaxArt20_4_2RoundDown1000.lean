import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt20_4_2RoundDown1000 — 地方税法 art.20の4の2 千円未満端数切り捨て bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  SHA-256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Norm unit NORM|c394f869d77816079abc3c9c8acb62df860e7b1c981febbd843dad16e1a73d28
  Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:20_4_2/Article#20_4_2/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語:
  「その額に千円未満の端数があるとき、又はその全額が千円未満であるときは、
   その端数金額又はその全額を切り捨てる。」

Computation（原文逐語から導出、端数処理スライスのみ、単位: 円）:
  unit := 1000（千円）
  roundDown amount := amount - (amount % unit)
  → amount < 1000 のとき 0（全額を切り捨て）
  → それ以外のとき 千円未満の端数を切り捨て

Scope / NOT MODELLED:
  - 課税標準額そのものの算定・他の端数処理（百円未満等）・特例は NOT MODELLED。
  - 本モデルは当該項の千円単位切り捨てのみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt20_4_2RoundDown1000

/-- 切り捨て単位（千円）。 -/
def unit : Nat := 1000

/-- 千円未満の端数（または全額）を切り捨てる。 -/
def roundDown (amount : Nat) : Nat :=
  amount - (amount % unit)

example : roundDown 0 = 0 := by decide
example : roundDown 1 = 0 := by decide
example : roundDown 999 = 0 := by decide
example : roundDown 1000 = 1000 := by decide
example : roundDown 1999 = 1000 := by decide
example : roundDown 2000 = 2000 := by decide

end JapanTaxLaw.LocalTaxArt20_4_2RoundDown1000

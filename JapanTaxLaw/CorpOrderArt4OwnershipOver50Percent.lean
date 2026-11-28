import JapanTaxLaw.TaxFinance

/-!
# CorpOrderArt4OwnershipOver50Percent — 法人税法施行令 art.4(3)(1) 持株50%超 判定 bounded L4 モデル

Sources (pinned):
  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121
  Raw snapshot: data/raw/340CO0000000097_20261001_507CO0000000121.law.json
  SHA-256: 92bab730d90617c1a1439ba19ba8f79041368febf3840c919103689cfcd90fe6
  Norm unit NORM|70fd1e08e42eaf268afc822cb3f3f25b464306d079b4ba5ae91efc61e640367d
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:4/Article#4/Paragraph#3/Item#1/ItemSentence/Sentence#1

原文逐語:
  「他の会社の発行済株式又は出資（その有する自己の株式又は出資を除く。）の総数又は総額の百分の五十を超える数又は金額の株式又は出資を有する場合」

Computation（原文逐語から導出、持株比率スライスのみ、単位: 株/口）:
  held : Nat — 有する株式数（caller-established）
  total : Nat — 発行済株式総数（自己株式を除く、caller-established）
  exceeds50 held total := held * 100 > total * 50（百分の五十を超える）

Scope / NOT MODELLED:
  - 自己株式の算入除外の計算、議決権の計算、他の号・条の関係は NOT MODELLED。
  - 本モデルは当該号の比率判定のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CorpOrderArt4OwnershipOver50Percent

/-- 原文の「百分の五十」の分子。 -/
def thresholdNumerator : Nat := 50

/-- 百分率の分母。 -/
def percentDenominator : Nat := 100

/-- 発行済株式の50%を超えて保有するか。 -/
def exceeds50 (held total : Nat) : Bool :=
  held * percentDenominator > total * thresholdNumerator

example : exceeds50 0 100 = false := by decide
example : exceeds50 49 100 = false := by decide
example : exceeds50 50 100 = false := by decide
example : exceeds50 51 100 = true := by decide
example : exceeds50 1 1 = true := by decide
example : exceeds50 0 0 = false := by decide

end JapanTaxLaw.CorpOrderArt4OwnershipOver50Percent

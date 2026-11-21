import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt56And57Ref — 相続税法 第五十六条及び第五十七条（STRUCTURE）

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|9444b08b151252b8c7527f222f0241b42b4cac0e133134e92ce2decf09ab8612
  Source path: LawBody[3]/MainProvision/MainProvision[6]/Article:56:57/Article#56:57/ArticleTitle
  Article title (cross-reference heading): verbatim from source.

原文逐語（pinned, 一字一句改変なし）:
  「第五十六条及び第五十七条」

Norm kind: STRUCTURE — an article-title cross-reference. The heading 「第五十六条
及び第五十七条」 groups two articles under a common cross-reference; 「及び」 ("and")
is a conjunction listing both article numbers. The computable slice models the
referenced article-number set {56, 57} and a membership predicate: a given article
number is either referenced by this heading or not. Both numbers are extracted
structurally from the verbatim needle (第…条 pattern + kanji_to_int) — no hand-typed
statutory numerals.

The needle is an ArticleTitle heading (not article body text); find_article_text sees
main-provision text only and does not return it — a file-kind transcription locator
is used. The substantive content of Articles 56/57 is NOT MODELLED (separate units).

Variable contract (meaning / unit / domain / type):
  Article number : Nat (unit: 条; domain positive Nat).
  referenced : Nat -> Prop — true for 56 and 57, false otherwise.
  No numeric amount/unit/dimension applies (structural cross-reference, not a formula).

Scope: only the cross-reference membership. The substantive provisions of Articles
56 and 57, other headings and legal correctness are NOT MODELLED. Human legal review
remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt56And57Ref

/-- 第五十六条 (first referenced article number, derived from needle). -/
def firstArticle : Nat := 56

/-- 第五十七条 (second referenced article number, derived from needle). -/
def secondArticle : Nat := 57

/-- 及び: an article number is referenced iff it is one of the two listed. -/
def referenced (n : Nat) : Prop := n = firstArticle ∨ n = secondArticle

/-- The two referenced article numbers are distinct. -/
theorem articles_distinct : firstArticle ≠ secondArticle := by
  decide

end JapanTaxLaw.InheritanceTaxArt56And57Ref

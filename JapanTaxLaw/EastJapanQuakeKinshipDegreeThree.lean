import Std
import JapanTaxLaw.TaxFinance

/-
# EastJapanQuakeKinshipDegreeThree — 東日本大震災被災者等国税臨時特例法施行規則 第十五条 第二項 第四号 ロ
（滅失建物等所有者の三親等内の親族であることを証する書類）

Pinned sources:
  Law id: 423M60000040020 (東日本大震災の被災者等に係る国税関係法律の
    臨時特例に関する法律施行規則)
  Revision: 423M60000040020_20260414_508M60000040039
  Raw snapshot: data/raw/423M60000040020_20260414_508M60000040039.law.json
  Article 15, Paragraph 2, Item 4, Subitem1#2 (ロ), Subitem1Sentence#1.
  Normative unit: NORM|de38703e5c85ea362d6087ff5a21cb07d078027a2ce50b65651e2a265966d9fd

Verbatim 原文 needle (scoped main Article 15):
  「戸籍の謄本その他の書類でその適用を受けようとする者が滅失建物等所有者の三親等内の親族であることを証する書類」

Variable contract (abstract kinship graph; caller establishes the degree):
  degree : Nat = 親族関係の最短辺距離（本人 0、父母 1、祖父母 2、曾祖父母 3）
  thirdDegree = 三 = 3
  withinThirdDegree degree = degree <= thirdDegree   （「内」は上限を含む）

Out of scope: what counts as 戸籍の謄本, the definition/certification of
滅失建物等所有者, subitems イ/ハ/ニ, other paragraphs of art. 15, the
substantive Japanese kinship law, other laws and all legal determinations.
No human legal review; LEGAL_REVIEW_PENDING.
-/

namespace JapanTaxLaw.EastJapanQuakeKinshipDegreeThree

/-- 原文の「三」= 3（親等）。 -/
def thirdDegree : Nat := 3

/-- 三親等内（上限 inclusive）。 -/
def withinThirdDegree (degree : Nat) : Bool :=
  degree <= thirdDegree

theorem degree_is_three : thirdDegree = 3 := rfl

-- 「内」境界: 0..3 true、4 false
theorem self_degree : withinThirdDegree 0 = true := by decide
theorem parent_degree : withinThirdDegree 1 = true := by decide
theorem grandparent_degree : withinThirdDegree 2 = true := by decide
theorem greatgrandparent_degree : withinThirdDegree 3 = true := by decide
theorem fourth_degree : withinThirdDegree 4 = false := by decide

end JapanTaxLaw.EastJapanQuakeKinshipDegreeThree

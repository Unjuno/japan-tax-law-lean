import JapanTaxLaw.RequiredApplicationDocuments

/-
# RequiredApplicationDocumentsSpec — independent spec for 自動車重量税法施行規則 第六条第二項

Pinned source (identical to RequiredApplicationDocuments.lean):
  Law id: 346M50000040066
  Revision: 346M50000040066_20230101_504M60000040020
  Raw snapshot: data/raw/346M50000040066_20230101_504M60000040020.law.json
  sha256: 9c5f07b0a6e4e1c9d55f9184603779c4949d5932403a06c23c03f1a8a2a90f56
  Statutory article: 第六条 第二項

原文逐語:
  「前項の申出書には、同項の指定を受けようとする者に係る定款、登記事項証明書並びに最終の貸借対照表、損益計算書及び事業報告又はこれらに準ずるもの（以下この項において「定款等」という。）を添付しなければならない。」

This file is an INDEPENDENT formulation. It owns its own Bool structure and its
own definitions; the independent formulas `specAllRequired` / `specSatisfies`
contain NO implementation identifier. The standard set is expressed as a list
of the five flags under `List.all id` (「並びに」/「及び」 = conjunction), and the
equivalent set (準ずるもの) is an accepted alternative via `||`. No numerals
appear anywhere in the independent formula: this is a STRUCTURAL norm, so the
pinned needle above is the sole source anchor (spec_literals is expected empty).
Only the `toSpecDocument` converter and the `agree*` theorem below mention the
implementation, and they bridge the two formulations in the Lean kernel only.
-/

namespace JapanTaxLaw.RequiredApplicationDocumentsSpec

/-- Spec-local attachment record. Own structure; no implementation type is reused. -/
structure SpecDocument where
  articles            : Bool
  registryCertificate : Bool
  balanceSheet        : Bool
  incomeStatement     : Bool
  businessReport      : Bool
  equivalentAccepted  : Bool

/-- Independent formula for 「並びに」/「及び」: all five standard documents required. -/
def specAllRequired (d : SpecDocument) : Bool :=
  [d.articles, d.registryCertificate, d.balanceSheet, d.incomeStatement, d.businessReport].all id

/-- Independent formula for 「又はこれらに準ずるもの」: equivalent set is an alternative. -/
def specSatisfies (d : SpecDocument) : Bool :=
  specAllRequired d || d.equivalentAccepted

/-- Plumbing only: copy the implementation's Bool fields into the spec structure. -/
def toSpecDocument (d : JapanTaxLaw.RequiredApplicationDocuments.Documents) : SpecDocument :=
  { articles            := d.articles
    registryCertificate := d.registryCertificate
    balanceSheet        := d.balanceSheet
    incomeStatement     := d.incomeStatement
    businessReport      := d.businessReport
    equivalentAccepted  := d.equivalentAccepted }

/-- Universal, kernel-checked agreement: implementation = independent spec for every record. -/
theorem agree_allDocumentsAttached (d : JapanTaxLaw.RequiredApplicationDocuments.Documents) :
    JapanTaxLaw.RequiredApplicationDocuments.allDocumentsAttached d =
      specSatisfies (toSpecDocument d) := by
  cases d with
  | mk a r b i br e =>
      cases a <;> cases r <;> cases b <;> cases i <;> cases br <;> cases e <;>
        simp [JapanTaxLaw.RequiredApplicationDocuments.allDocumentsAttached,
              JapanTaxLaw.RequiredApplicationDocuments.completeDocuments,
              toSpecDocument, specSatisfies, specAllRequired, List.all]

example : specAllRequired
    ({ articles := true, registryCertificate := true, balanceSheet := true, incomeStatement := true, businessReport := true, equivalentAccepted := false }) = true := by
  decide

example : specSatisfies
    ({ articles := false, registryCertificate := false, balanceSheet := false, incomeStatement := false, businessReport := false, equivalentAccepted := true }) = true := by
  decide

end JapanTaxLaw.RequiredApplicationDocumentsSpec

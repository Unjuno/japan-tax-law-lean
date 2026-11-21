import JapanTaxLaw.TaxFinance

/-
# RequiredApplicationDocuments — 自動車重量税法施行規則 第六条（納付受託者の指定の手続）

Pinned source:
  Law id: 346M50000040066
  Official title: 自動車重量税法施行規則
  Law number: 昭和四十六年大蔵省令第六十六号
  Law type: MinisterialOrdinance (省令)
  Revision: 346M50000040066_20230101_504M60000040020
  Raw snapshot: data/raw/346M50000040066_20230101_504M60000040020.law.json
  sha256: 9c5f07b0a6e4e1c9d55f9184603779c4949d5932403a06c23c03f1a8a2a90f56
  Statutory article: 第六条 (art. 6), 第二項 (paragraph 2)

原文逐語（pinned, 一字一句改変なし）:
  「前項の申出書には、同項の指定を受けようとする者に係る定款、登記事項証明書並びに最終の貸借対照表、損益計算書及び事業報告又はこれらに準ずるもの（以下この項において「定款等」という。）を添付しなければならない。」

Variable contract:
  `Documents` is a record of Bool flags, one per attachment category. Each field
  is whether that document is attached (true) or not (false):
    articles            = 定款
    registryCertificate = 登記事項証明書
    balanceSheet        = 最終の貸借対照表
    incomeStatement     = 損益計算書
    businessReport      = 事業報告
    equivalentAccepted  = これらに準ずるもの (equivalent documents, attached instead).
  「並びに」 and 「及び」 are conjunctions: ALL five standard documents are required
  (completeDocuments). 「又はこれらに準ずるもの」 makes the equivalent set an
  ACCEPTED ALTERNATIVE to the standard set (allDocumentsAttached = complete || equivalent).
  The parenthetical 「以下この項において「定款等」という。」 only names the set; it
  adds no sixth category. 「最終の」 qualifies the three accounting documents.
  This is a STRUCTURAL norm with NO numerals: source correspondence is anchored
  solely by the pinned 逐語 needle above, not by any statutory literal.

Scope: ONLY the explicit mandatory-attachment requirement of 第六条第二項 is modelled.
  The 申出書 and 国土交通大臣 designation of paragraph 1, the ただし書
  electronic-viewing exception, the notification of paragraph 3, genuineness of
  any document and all other articles are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.RequiredApplicationDocuments

/-- 第六条第二項の「定款等」添付要件。各 Bool は当該書類が添付されたかどうか。 -/
structure Documents where
  articles            : Bool   -- 定款
  registryCertificate : Bool   -- 登記事項証明書
  balanceSheet        : Bool   -- 最終の貸借対照表
  incomeStatement     : Bool   -- 損益計算書
  businessReport      : Bool   -- 事業報告
  equivalentAccepted  : Bool   -- これらに準ずるもの（標準セットの代替）

/-- 「定款、登記事項証明書並びに最終の貸借対照表、損益計算書及び事業報告」:
    「並びに」/「及び」は連立（all five required）。 -/
def completeDocuments (d : Documents) : Bool :=
  d.articles && d.registryCertificate && d.balanceSheet && d.incomeStatement && d.businessReport

/-- 「…又はこれらに準ずるものを添付しなければならない」:
    準ずるものは標準セットの代替として認められる。 -/
def allDocumentsAttached (d : Documents) : Bool :=
  completeDocuments d || d.equivalentAccepted

/-- 五書類すべてが添付済みなら complete（全て present）。 -/
theorem all_present_complete :
    completeDocuments ({ articles := true, registryCertificate := true,
      balanceSheet := true, incomeStatement := true, businessReport := true,
      equivalentAccepted := false }) = true := by
  decide

/-- 定款のみ未添付なら complete ではない。 -/
theorem missing_articles_incomplete :
    completeDocuments ({ articles := false, registryCertificate := true,
      balanceSheet := true, incomeStatement := true, businessReport := true,
      equivalentAccepted := false }) = false := by
  decide

/-- 登記事項証明書のみ未添付なら complete ではない。 -/
theorem missing_registry_incomplete :
    completeDocuments ({ articles := true, registryCertificate := false,
      balanceSheet := true, incomeStatement := true, businessReport := true,
      equivalentAccepted := false }) = false := by
  decide

/-- 最終の貸借対照表のみ未添付なら complete ではない。 -/
theorem missing_balance_sheet_incomplete :
    completeDocuments ({ articles := true, registryCertificate := true,
      balanceSheet := false, incomeStatement := true, businessReport := true,
      equivalentAccepted := false }) = false := by
  decide

/-- 損益計算書のみ未添付なら complete ではない。 -/
theorem missing_income_statement_incomplete :
    completeDocuments ({ articles := true, registryCertificate := true,
      balanceSheet := true, incomeStatement := false, businessReport := true,
      equivalentAccepted := false }) = false := by
  decide

/-- 事業報告のみ未添付なら complete ではない。 -/
theorem missing_business_report_incomplete :
    completeDocuments ({ articles := true, registryCertificate := true,
      balanceSheet := true, incomeStatement := true, businessReport := false,
      equivalentAccepted := false }) = false := by
  decide

/-- 標準書類が全て未添付でも、準ずるものが添付されれば要件を満たす。 -/
theorem equivalent_satisfies :
    allDocumentsAttached ({ articles := false, registryCertificate := false,
      balanceSheet := false, incomeStatement := false, businessReport := false,
      equivalentAccepted := true }) = true := by
  decide

/-- 何も添付しなければ（空集合）要件を満たさない。 -/
theorem empty_not_attached :
    allDocumentsAttached ({ articles := false, registryCertificate := false,
      balanceSheet := false, incomeStatement := false, businessReport := false,
      equivalentAccepted := false }) = false := by
  decide

/-- 単調性: complete な集合に書類を追加（各標準フラグを true に）しても complete は保たれる。 -/
theorem complete_monotone (d : Documents) (h : completeDocuments d = true) :
    completeDocuments ({ d with articles := true, registryCertificate := true,
      balanceSheet := true, incomeStatement := true, businessReport := true }) = true := by
  cases d with
  | mk a r b i br e =>
      cases a <;> cases r <;> cases b <;> cases i <;> cases br <;> cases e <;> decide

/-- 完全性は五書類すべてを要する（complete ⇔ 五フラグすべて true）。 -/
theorem complete_iff_all_five (d : Documents) :
    completeDocuments d = true ↔
      d.articles = true ∧ d.registryCertificate = true ∧ d.balanceSheet = true ∧
      d.incomeStatement = true ∧ d.businessReport = true := by
  cases d with
  | mk a r b i br e =>
      cases a <;> cases r <;> cases b <;> cases i <;> cases br <;> cases e <;> decide

/-- 添付要件を満たすのは、完全セットまたは準ずるもののいずれか。 -/
theorem attached_iff (d : Documents) :
    allDocumentsAttached d = true ↔ (completeDocuments d = true ∨ d.equivalentAccepted = true) := by
  cases d with
  | mk a r b i br e =>
      cases a <;> cases r <;> cases b <;> cases i <;> cases br <;> cases e <;> decide

end JapanTaxLaw.RequiredApplicationDocuments

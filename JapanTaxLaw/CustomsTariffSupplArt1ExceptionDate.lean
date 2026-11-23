import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffSupplArt1ExceptionDate — EXCEPTION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|34bc97d6d32588ad832ab14de19ae658b3d7e00e7bb4bacc59564498bfe859c3
  Source path: LawBody[50]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#2

原文逐語（pinned, 一字一句改変なし）:
  「ただし、次に掲げる規定は、平成四年一月一日から施行する。」
  Enclosing sentence (both dates): 「この法律は、平成三年四月一日から施行する。ただし、次に掲げる規定は、平成四年一月一日から施行する。」

Norm kind: EXCEPTION — the ただし (however) clause of 附則第一条 (施行期日), which
overrides the general enforcement date for the provisions listed next. The
computable slice models: (a) the two enforcement dates as (era-year, month, day)
Nats, (b) which date applies to a listed provision (the exception) vs any other
(the general rule), and (c) the ordering that the exception date is later.
All date components were parsed programmatically from the verbatim source;
no hand-typed statutory strings.

Variable contract (meaning / unit / domain / type):
  Date : structure — era-year/month/day as Nat (unit 年/月/日; domain Nat, same 平成 era).
  generalDate : 平成3年4月1日 (the main rule's enforcement date).
  exceptionDate : 平成4年1月1日 (the exception's enforcement date).
  ProvisionKind : listed (次に掲げる規定) or other.
  applicableDate : ProvisionKind -> Date — exception for listed, general otherwise.
  inForceOn k d := leDate (applicableDate k) d (in force on and after that date).

Scope: only the date selection and within-era ordering. The identification of
the "listed provisions" themselves, cross-era conversion, other supplementary
provisions, and legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1ExceptionDate

/-- A date within the fixed era (平成): era year/month/day. -/
structure Date where
  year : Nat
  month : Nat
  day : Nat

/-- この法律は、平成3年4月1日から施行する (general rule). -/
def generalDate : Date := ⟨3, 4, 1⟩

/-- ただし、次に掲げる規定は、平成4年1月1日から施行する (exception). -/
def exceptionDate : Date := ⟨4, 1, 1⟩

/-- The provisions addressed by the ただし exception vs all others. -/
inductive ProvisionKind : Type
  | listed : ProvisionKind
  | other : ProvisionKind

/-- The exception overrides the date only for the listed provisions. -/
def applicableDate (k : ProvisionKind) : Date :=
  match k with
  | ProvisionKind.listed => exceptionDate
  | ProvisionKind.other => generalDate

/-- Lexicographic order on (year, month, day) within the fixed era. -/
def leDate (a b : Date) : Prop :=
  a.year < b.year ∨
  (a.year = b.year ∧ (a.month < b.month ∨ (a.month = b.month ∧ a.day <= b.day)))

/-- In force on and after the applicable date. -/
def inForceOn (k : ProvisionKind) (d : Date) : Prop := leDate (applicableDate k) d

/-- Listed provisions use the exception date. -/
theorem listed_applicable : applicableDate ProvisionKind.listed = exceptionDate := rfl

/-- Other provisions use the general date. -/
theorem other_applicable : applicableDate ProvisionKind.other = generalDate := rfl

/-- The exception date is later than the general date (year 3 < 4). -/
theorem exception_after_general : leDate generalDate exceptionDate := by
  left
  decide

/-- The general date is not later than the exception date. -/
theorem general_not_after_exception : ¬ leDate exceptionDate generalDate := by
  unfold leDate exceptionDate generalDate
  decide

/-- Listed provisions are in force on the exception date itself. -/
theorem listed_in_force_on_exception : inForceOn ProvisionKind.listed exceptionDate := by
  unfold inForceOn applicableDate leDate
  right
  constructor
  · rfl
  · right
    constructor
    · rfl
    · decide

end JapanTaxLaw.CustomsTariffSupplArt1ExceptionDate

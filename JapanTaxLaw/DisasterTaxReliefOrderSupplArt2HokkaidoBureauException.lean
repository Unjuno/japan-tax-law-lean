import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefOrderSupplArt2HokkaidoBureauException — EXCEPTION

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令）
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Raw snapshot: data/raw/322CO0000000268_*.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|483362ae8efa29996e865140eaba318b1901fc6c2e58af0a10161d9ec7695684
  Source path: LawBody[34]/SupplProvision/SupplProvision[2]/Article:2/Article#2/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「東北海運局長（山形県又は秋田県の区域に係る処分等又は申請等に係る場合を除く。）」

Norm kind: EXCEPTION — a transitional table cell defining the 東北海運局長 (the
Tohoku Maritime Transport Bureau Director) with an exception: cases concerning
dispositions or applications relating to the area of 山形県 or 秋田県 are
excluded from that office's scope. The computable slice models the
prefecture-based exception flag. All statutory terms below are reproduced
programmatically from the verbatim needle; the canonical quote is byte-verbatim.

Variable contract (meaning / domain / type):
  Region : Type — the first listed prefecture (山形県), the second (秋田県),
             and other regions.
  isExcluded : Region -> Bool — true for the two listed prefecture areas.
  No numeric amount/unit applies (structural jurisdiction exception).

Scope: only the prefecture-based exclusion flag. The substantive disposition /
application procedures, the rest of the table, and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderSupplArt2HokkaidoBureauException

/-- The regions named in the exception. -/
inductive Region : Type
  | firstPrefecture : Region
  | secondPrefecture : Region
  | other : Region

/-- Cases relating to the listed prefecture areas are excepted. -/
def isExcluded (r : Region) : Bool :=
  match r with
  | Region.firstPrefecture => true
  | Region.secondPrefecture => true
  | Region.other => false

/-- The first listed prefecture is excepted. -/
theorem first_excluded : isExcluded Region.firstPrefecture = true := rfl

/-- The second listed prefecture is excepted. -/
theorem second_excluded : isExcluded Region.secondPrefecture = true := rfl

/-- Other regions are not excepted. -/
theorem other_not_excluded : isExcluded Region.other = false := rfl

end JapanTaxLaw.DisasterTaxReliefOrderSupplArt2HokkaidoBureauException
